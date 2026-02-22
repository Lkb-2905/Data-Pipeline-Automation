🌍 DOSSIER DE CONFIGURATION D'EXPLOITATION (DCE)
# ⚡ DPA PCR : Dossier de Sécurité et Continuité (PRA)
![Sécurité](https://img.shields.io/badge/Plan-Continuité-red) ![SQL](https://img.shields.io/badge/SQL-Intégrité-blue) ![Qualité](https://img.shields.io/badge/Qualité-ITIL-yellow)

**Version:** 1.0.0 Stable | **Date:** Février 2026  
**Auteur:** KAMENI TCHOUATCHEU GAETAN BRUNEL  
**Contact:** gaetanbrunel.kamenitchouatcheu@et.esiea.fr  

🚀 [Démarrage Rapide](#-démarrage-rapide) • 📚 [Documentation](#-guide-dutilisation) • 🎯 [Fonctionnalités](#-fonctionnalités-clés) • 🔧 [Installation](#-installation-rapide)

---

## 📋 TABLE DES MATIÈRES
1. [Vue d'ensemble du projet](#-vue-densemble-du-projet)
2. [Architecture Technique (Menaces)](#️-architecture-technique)
3. [Stack Technologique & PCA](#️-stack-technologique)
4. [Fonctionnalités Clés (Reprise)](#-fonctionnalités-clés)
5. [Démarrage Rapide](#-démarrage-rapide)
6. [Guide d'Utilisation](#-guide-dutilisation)
7. [Qualité & Best Practices](#-qualité--best-practices)
8. [Roadmap & Évolutions](#️-roadmap--évolutions)

---

## 🎯 VUE D'ENSEMBLE DU PROJET

### Contexte & Objectifs
Ce document définit la stratégie de résilience opérationnelle absolue de l'Infrastructure **Data Pipeline Automation (DPA)**.
Le Pipeline est le système nerveux acheminant la donnée critique au Data Warehouse chaque nuit. Ce PCR vise à contrecarrer toute panne du script nocturne perturbant le flux de pilotage (SLA).

Il illustre les compétences suivantes :

✅ **Architecture transactionnelle :** Préservation par clauses ACID et ORM.
✅ **Tolérance logicielle :** Protection du SGBD contre les corruptions Python.
✅ **Industrialisation :** Formalisme de récupération logistique.
✅ **Data Reliability :** Auditabilité de chaque batch d'insertion SQL.

### Pourquoi ce projet ?
| Aspect | Démonstration |
| --- | --- |
| **Scalabilité** | Architecture garantissant le maintien de performance sur incident. |
| **Maintenabilité** | Redémarrage des processus simplifiés par un script central (Cold Boot). |
| **Sécurité** | Verrouillage anti-effacement des tables métiers critiques. |

---

## 🏗️ ARCHITECTURE TECHNIQUE

### Flux de Données Détaillé (BIA)
| Menace Identifiée | Probabilité | Impact Métier | Sévérité |
| --- | --- | --- | --- |
| **API Fret Hors Ligne** | Moyenne (2/5) | Extraction asynchrone stoppée, batch ignoré. | 🟠 Majeur |
| **Structure Fichier Corrompue** | Moyenne (2/5) | Crash du script Pandas. Aucune altération du DB. | 🟠 Majeur |
| **Base SQL en Deadlock** | Faible (1/5) | Incapacité à écrire les faits logsiques finaux. | 🔴 Critique |

---

## 🛠️ STACK TECHNOLOGIQUE

### Stratégies de Continuité (PCA)
* **Isolation SQLAlchemy** : Les manipulations vers le Data Warehouse sont orchestrées par des sessions (Transactions). S'il advient une erreur inattendue au bloc `Load`, le commit est refusé et l'état propre antérieur est sanctuarisé (Rollback massif). 
* **Journalisation** : L'alerte d'échec est archivée. Le système survit jusqu'à l'astreinte.

---

## 🎯 FONCTIONNALITÉS CLÉS

### 🚀 Procédures de Reprise (PRA)
**Reprise et Cold Reboot du Job**
Lors d'une alerte bloquante sur un chargement en suspens Zombie, l'administrateur s'y connecte pour forcer l'extinction et injecter manuellement la dernière journée.

### 🛡️ Sécurité & Robustesse
| Aspect | Implémentation |
| --- | --- |
| **Résilience** | Le script s'interrompt pour protéger la DB s'il y a plus de 30% d'erreurs d'ingestion. |

---

## 🚀 DÉMARRAGE RAPIDE

### Installation Express (Déploiement Reprise de Cyle)
```powershell
# Fort risque critique détecté : Purger les exécutions fantômes
Stop-Process -Name "python" -Force 

# Nettoyer et relancer l'injection transactionnelle manuellement
cd "C:\chemin\vers\Data-Pipeline-Automation"
.\env\Scripts\activate
python src/main_pipeline.py

Write-Host "✅ Le Data Warehouse (SGBD) est restauré aux conditions nominales."
```

---

## 📖 GUIDE D'UTILISATION

### Scénario d'Astreinte (Contacts)
* **Architecte Data :** Kameni Tchouatcheu
* **Support SQL :** support-data@camrail.net
* **Procédure :** Escalade Niveau 2.

---

## ✨ QUALITÉ & BEST PRACTICES

### Standards Métiers
* **Traçabilité :** S'assurer de logs explicites vers les outils centraux.

### Métriques d'Excellence
✅ **Performance :** Garantie d'intégrité "Zéro perte de cohérence DB".

---

## 🗺️ ROADMAP & ÉVOLUTIONS

**Version Actuelle : 1.0.0 ✅**
* PCA/PRA opérationnel par Rollbacks automatiques.

**Version 2.0.0 🚧**
* Ajout d'une brique "Alerte SMS automatique" lors d'un échec d'ETL.

---

## 🤝 CONTRIBUTION
*Critique : Modifications approuvées par le CTO Uniquement*.

---

## 📄 LICENCE
Ce document relève des Opérations Confidentielles (Usage Interne Camrail).

## 👨‍💻 AUTEUR
**KAMENI TCHOUATCHEU GAETAN BRUNEL**  
Ingénieur Logiciel & Data | Étudiant ESIEA  

© 2026 Kameni Tchouatcheu Gaetan Brunel - Tous droits réservés
