🌍 DOSSIER DE CONFIGURATION D'EXPLOITATION (DCE)
⚡ DPA PCR : Pipeline Data Automation Sécurité & PRA
Gestion Crise Logistique SQL Continuité License

Version: 1.0.0 Stable | Date: Février 2026
Auteur: KAMENI TCHOUATCHEU GAETAN BRUNEL
Contact: gaetanbrunel.kamenitchouatcheu@et.esiea.fr

🚀 Démarrage Rapide • 📚 Documentation • 🎯 Fonctionnalités • 🔧 Installation

📋 TABLE DES MATIÈRES
Vue d'ensemble du projet
Architecture Technique
Stratégies de Continuité (PCA)
Procédures de Reprise (PRA)
Annexe Technique

🎯 VUE D'ENSEMBLE DU PROJET
Contexte et Enjeux Critiques
Ce plan définit la stratégie de résilience opérationnelle du Pipeline ETL Automatisé, le cœur nerveux de la donnée logistique. Si l'ETL de Nuit ne se termine pas, la Direction Logistique commence sa journée avec des données obsolètes.
Objectifs : Protéger les écritures au SGBD et garantir la robustesse.

🏗️ ARCHITECTURE TECHNIQUE
Analyse d'Impact Métier (BIA)
Menace Identifiée | Probabilité | Impact Métier | Sévérité
--- | --- | --- | ---
API Fret Hors Ligne | Moyenne (2/5) | Arrêt processus ETL matinal. | 🟠 Majeur
Structure Fichier Corrompue | Moyenne (2/5) | Violation de mapping `pandas`. | 🟠 Majeur
Base SQL en Deadlock | Faible (1/5) | Attente infinie, corruption mémoire. | 🔴 Critique

🛠️ STACK TECHNOLOGIQUE
Stratégies de Continuité (PCA)
L'Engine SQLAlchemy gère ses connexions de manière Transactionnelle. Si l'exécution plante sans confirmation, un Rollback automatique est émis.

🎯 FONCTIONNALITÉS CLÉS
Procédures de Reprise (PRA)
Reprise (Cold Reboot du Job Nocturne).

🚀 DÉMARRAGE RAPIDE
```powershell
# 1. Tuer un processus de chargement zombie Data Pipeline
Stop-Process -Name "python" -Force 

# 2. Exécuter l'injection en force manuelle
cd "C:\chemin\vers\Data-Pipeline-Automation"
.\env\Scripts\activate
python src/main_pipeline.py
Write-Host "✅ Les gares logistiques ont été mises à jour avec succès dans le SQL."
```

📖 GUIDE D'UTILISATION
Annexe Technique
Contacts : Architecte Data : Kameni Tchouatcheu. Support : support-data@camrail.net.

✨ QUALITÉ & BEST PRACTICES
Supervision
Assurer des logs claires sur l'exécution des jobs Windows Task Scheduler nocturnes.

🗺️ ROADMAP & ÉVOLUTIONS
Ajout de la mise en alerte Email/SMS lors d'un échec du job dans une V2.

🤝 CONTRIBUTION
Document soumis à la Direction Logistique.

📄 LICENCE
Confidentiel Camrail / Bolloré Logistics.

👨💻 AUTEUR
KAMENI TCHOUATCHEU GAETAN BRUNEL
Ingénieur Logiciel & Data | Étudiant ESIEA

📧 Email : gaetanbrunel.kamenitchouatcheu@et.esiea.fr
🐙 GitHub : @Lkb-2905

© 2026 Kameni Tchouatcheu Gaetan Brunel - Tous droits réservés
