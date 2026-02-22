🔰 DOSSIER DE SÉCURITÉ ET CONTINUITÉ (PCR/PRA)
⚡ ETL-S : Supply Chain Data Pipeline
Gestion de Crise • Continuité Logistique • Intégrité Base de Données

Classification: Confidentiel (Interne Camrail / Bolloré Logistics) | Version: 1.0.0
Responsable: KAMENI TCHOUATCHEU GAETAN BRUNEL

🔍 Analyse BIA • 🛡️ Stratégies PCA • 🔄 Procédures PRA • 📝 Maintenance MCO

---

## 📋 TABLE DES MATIÈRES
1. [Contexte & Enjeux Critiques](#-contexte-et-enjeux-critiques)
2. [Analyse d'Impact Métier (BIA)](#-analyse-dimpact-métier-bia)
3. [Stratégies de Continuité (PCA)](#️-stratégies-de-continuité-pca)
4. [Procédures de Reprise (PRA)](#-procédures-de-reprise-pra)
5. [Maintenance & Tests (MCO)](#-maintenance--tests-mco)
6. [Annexe Technique](#-annexe-technique)

---

## 🚨 CONTEXTE ET ENJEUX CRITIQUES
Ce plan définit la stratégie de résilience opérationnelle du **Pipeline ETL Automatisé (ETL-S)**.
Ce système est le cœur nerveux de la donnée logistique quotidienne. Si l'ETL de Nuit (2h00 AM) ne se termine pas, la Direction Logistique Ferroviaire commence sa journée à 8h00 avec des données de la veille (Avarie décisionnelle majeure en gestion des flux de fret).

**Objectifs du PCR :**
* **Fiabilité des Flux :** S'assurer qu'un seul enregistrement erroné de l'ERP ne fasse pas crasher l'intégration entière de la nuit.
* **Intégrité SGBD :** Prévenir les verrous (Locks) de la base de données SQL.
* **Alerte Précoce :** Notification immédiate (Loguru) si le Batch nocturne échoue.

---

## 🔍 ANALYSE D'IMPACT MÉTIER (BIA)

### Cartographie des Risques
| Menace Identifiée | Probabilité | Impact Métier | Sévérité |
| :--- | :--- | :--- | :--- |
| **API Référentiel Injoignable** | Élevée (3/5) | Métadonnées machines non mises à jour. | 🟡 Mineur |
| **Modification Format CSV ERP** | Moyenne (2/5) | Crash lors de la Transformation Pandas (KeyError). | 🟠 Majeur |
| **Base SQLite Verrouillée** | Faible (1/5) | Impossible d'enregistrer les millions de transactions au Load. | 🔴 Critique |
| **Coupure Serveur à 2h00 AM**| Très Faible | Aucun KPI journalier mis à jour pour le comité de direction. | 🔴 Critique |

### Métriques de Performance (SLA)
* **RTO (Recovery Time Objective) : < 2 Heures.**
  Le pipeline doit pouvoir être relancé ou débogué avant 7h00 du matin.
* **RPO (Recovery Point Objective) : < 24 Heures.**
  Système basé sur des batchs quotidiens. Zéro perte acceptée hors J-1.

---

## 🛡️ STRATÉGIES DE CONTINUITÉ (PCA)
L'architecture de l'ETL intègre dès la conception la gestion asynchrone des erreurs.

### 1. Tolérance aux Pannes d'Extraction (API API-Gateway)
* ⚡ **Mode Nominal :** Récupération réussie du référentiel Machine JSON.
* 🚨 **Incident Détecté :** Le serveur de l'API externe répond HTTP 503.
* 🔄 **Basculement Auto :** Le script de Transformation utilise automatiquement le cache local des référentiels de la veille. Le chargement continue avec une mention de *stale data*.

### 2. Le Maintien Transactionnel (SQL Load)
* **Problème :** Coupure d'énergie serveur pendant l'insertion `.to_sql()`. Base partiellement écrite.
* **Solution :** Pandas et SQLAlchemy sont configurés pour s'exécuter dans des transactions sécurisées. Si le fichier complet n'est pas intégré, la transaction est annulée (Rollback), laissant la base propre à J-1 sans données partielles corrompues.

---

## 🔄 PROCÉDURES DE REPRISE (PRA)
En cas d'échec avéré et notifié du planificateur nocturne Windows.

### 4.1. Protocole de Reprise Manuelle Batch (PowerShell)
Si le Dashboard matinal est muet, l'Astreinte Data Engineer doit jouer ce PRA :

```powershell
# SCRIPT DE REPRISE DE BATCH (ETL-S)

# 1. Vérification des verrous (Locks) SQLite
Stop-Process -Name "python" -Force 
Write-Host "✅ Dégagements des verrous applicatifs Python."

# 2. Back-up immédiat de sécurité avant intervention
Copy-Item "database/supply_chain_dwh.sqlite" "database/supply_chain_dwh_SAFE.sqlite"
Write-Host "✅ Copie de sauvegarde de la base de données effectuée."

# 3. Lancement du mode DEBUG
cd "C:\chemin\vers\Data-Pipeline-Automation"
.\env\Scripts\activate
# Exécution avec suivi de log maximal
python src/main_pipeline.py
Write-Host "🚀 Pipeline forcé relancé techniquement."
```

### 4.2. Stratégie de Sauvegarde (Backup)
* **Stockage de Froid (Cold Storage) :** Les fichiers CSV/JSON bruts ingérés chaque nuit (Data Lake local) sont conservés pendant 30 jours, permettant un recalcul ab initio de l'historique complet en cas de destruction de la base.

---

## 📝 MAINTENANCE & TESTS (MCO)
S'assurer de la solidité du pipeline ETL de nuit.

### Scénarios de Test (Réalisés chaque trimestre)
1. **"Schema Mutation Test" :**
   * *Action :* Changer le nom d'une colonne dans le fichier CSV simulé de l'ERP.
   * *Attendu :* L'erreur `KeyError` est attrapée proprement dans `main_pipeline.py`. Le Logger remonte l'erreur sans crasher brutalement l'Operating System.
2. **"Database Lock Test" :**
   * *Action :* Ouvrir manuellement `supply_chain_dwh.sqlite` avec DBeaver et effectuer une requête bloquante (Write). Lancer ensuite l'ETL Pandas.
   * *Attendu :* SQLAlchemy attend la fin du timeout puis lève une alerte SQL gérée proprement.

---

## 🔧 ANNEXE TECHNIQUE
### Contacts d'Astreinte
* **Responsable Technique :** Kameni Tchouatcheu (Ext. 06.XX.XX.XX.XX)
* **DBA / Architecte Data :** support-data@camrail.net

### Versions Validées en Production
* **Python :** 3.12.x
* **Numpy :** STRICTEMENT 1.26.0 (Pour éviter conflit avec Pandas C-Headers)
* **SQLAlchemy :** 2.0+

*Ce document est la propriété de la Direction Logistique Ferroviaire (Data Department). Dernière mise à jour : Février 2026 par G.B.K.T.*
