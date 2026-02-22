🔰 DOSSIER DE SÉCURITÉ ET CONTINUITÉ (PCR/PRA)
⚡ ETL-F : Freight Data Pipeline
Gestion de Crise • Continuité Logistique • Intégrité Base de Données

Classification: Confidentiel (Interne Camrail / Bolloré Logistics) | Version: 1.0.0
Responsable: KAMENI TCHOUATCHEU GAETAN BRUNEL

---

## 🚨 CONTEXTE ET ENJEUX CRITIQUES
Ce plan définit la stratégie de résilience opérationnelle du **Pipeline ETL Automatisé**.
Ce système est le cœur nerveux de la donnée logistique quotidienne. Si l'ETL de Nuit (2h00 AM) ne se termine pas, la Direction Logistique Ferroviaire commence sa journée avec des données obsolètes (Avarie décisionnelle majeure en gestion des flux de fret).

**Objectifs :**
* S'assurer qu'un seul enregistrement erroné de l'ERP ne fasse pas crasher l'intégration.
* Protection des écritures dans le SGBD SQL par rollback en cas de dysfonctionnement imprévu.

---

## 🔍 ANALYSE D'IMPACT MÉTIER (BIA)
| Menace Identifiée | Probabilité | Impact Métier | Sévérité |
| :--- | :--- | :--- | :--- |
| **API Fret Hors Ligne** | Moyenne (2/5) | Arrêt processus ETL matinal. | 🟠 Majeur |
| **Structure Fichier Corrompue** | Moyenne (2/5) | Colonne manquante entraînant une violation de mapping `pandas`. | 🟠 Majeur |
| **Base SQL en Deadlock**| Faible (1/5) | Processus ETL en attente infinie, corruption mémoire de charge. | 🔴 Critique |

---

## 🛡️ STRATÉGIES DE CONTINUITÉ (PCA)

### Base de données (Isolation)
L'Engine SQLAlchemy gère ses connexions de manière Transactionnelle. Si l'exécution plante sans confirmation, un Rollback automatique est émis pour préserver la table.

---

## 🔄 PROCÉDURES DE REPRISE (PRA)

### Reprise (Cold Reboot du Job Nocturne)
En cas de crash signalé :

```powershell
# 1. Tuer un processus de chargement zombie Data Pipeline
Stop-Process -Name "python" -Force 

# 2. Exécuter l'injection en force manuelle
cd "C:\chemin\vers\Data-Pipeline-Automation"
.\env\Scripts\activate
python src/main_pipeline.py
Write-Host "✅ Les gares logistiques ont été mises à jour avec succès dans le SQL."
```

---

## 🔧 ANNEXE TECHNIQUE
### Contacts d'Astreinte
* **Architecte Data / Ingénieur Fret :** Kameni Tchouatcheu
* **Support :** support-data@camrail.net

*Ce document est la propriété de la Direction Logistique Ferroviaire (Data Department). Dernière mise à jour : Février 2026 par G.B.K.T.*
