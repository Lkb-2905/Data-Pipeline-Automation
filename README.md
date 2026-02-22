🌍 DOSSIER DE CONFIGURATION D'EXPLOITATION (DCE)
⚡ DPA : Data Pipeline Automation
Python SQLite Pandas ETL License

Version: 1.0.0 Stable | Date: Février 2026
Auteur: KAMENI TCHOUATCHEU GAETAN BRUNEL
Contact: gaetanbrunel.kamenitchouatcheu@et.esiea.fr

🚀 Démarrage Rapide • 📚 Documentation • 🎯 Fonctionnalités • 🔧 Installation

📋 TABLE DES MATIÈRES
Vue d'ensemble du projet
Architecture Technique
Stack Technologique
Fonctionnalités Clés
Démarrage Rapide
Guide d'Utilisation
Qualité & Best Practices
Roadmap & Évolutions

🎯 VUE D'ENSEMBLE DU PROJET
Contexte & Objectifs
Ce projet illustre de solides compétences en Ingénierie des Données (Data Engineering) en automatisant le traitement quotidien des flux logistiques de fret (Camrail / Bolloré Logistics). Il organise les données sur les locomotives, les marchandises et les incidents en gare au sein d'un entrepôt central.

✅ ETL Architecture : Modèle complet d'Extraction, Transformation et Chargement.
✅ Data Warehouse : Alimentation transactionnelle d'une base de données SQLite3.
✅ Automatisation O.S : Exécution orchestrée par scripts Windows.
✅ Data Quality : Gouvernance IT et normalisation.

Pourquoi ce projet ?
Aspect | Démonstration
--- | ---
Gouvernance IT | Consolidation des fichiers dispersés en une Base Unique.
Scalabilité | Pipeline séparé en couches autonomes.
Fiabilité | Gestion globale des exceptions lors du chargement.
Business Value | Permet l'analyse avancée des KPIs logistiques.

🏗️ ARCHITECTURE TECHNIQUE
Diagramme de Flux
Flux de Données Détaillé
1. Layer Extraction (`extract.py`) : Connexion API/JSON simulée pour rapatrier les sources.
2. Layer Transformation (`transform.py`) : Normalisation des horodatages et jointures en Pandas.
3. Layer Loading (`load.py`) : Upserts dans la base de données SQL.
4. Orchestration (`main_pipeline.py`) : Script exécutant de manière séquentielle le pipeline.

🛠️ STACK TECHNOLOGIQUE
Technologies Core
Composant | Technologie | Version | Justification Technique
--- | --- | --- | ---
Langage | Python | 3.12+ | Standard pour les pipelines data.
SGBD | SQLite | 3 | DWH en fichier local simplifié.
ORM | SQLAlchemy | Latest | Mapper Python-SQL sécurisé.
Data Processing | Pandas | Latest | Nettoyage de grandes volumétries en RAM.

🎯 FONCTIONNALITÉS CLÉS
🚀 Fonctionnalités Principales
Data Pipeline Robuste
Création stricte du fichier `supply_chain_dwh.sqlite`.
Requêtage de haut niveau
Table de faits propre permettant la réalisation de dashboards.

🛡️ Sécurité & Robustesse
Résilience : Gestion des transactions SQL (Rollbacks en cas d'erreur).

🚀 DÉMARRAGE RAPIDE
Prérequis
Python (v3.12+)

Installation Rapide
```bash
# 1. Naviguer dans le dossier du projet
cd Data-Pipeline-Automation

# 2. Créer l'environnement
python -m venv env
.\env\Scripts\activate

# 3. Installer les dépendances
pip install -r requirements.txt

# 4. Lancer le pipeline complet
python src/main_pipeline.py
```

📖 GUIDE D'UTILISATION
Exécution Routine
Le fichier `database/supply_chain_dwh.sqlite` est généré, prêt. Le fichier `sql/advanced_queries.sql` met en valeur des requêtes SQL avancées avec les fenêtres temporelles.

📸 Aperçu de l'Exécution
![Exécution du Pipeline ETL](execution_screenshot.png)

✨ QUALITÉ & BEST PRACTICES
Standards de Code
Modularité : Code séparé. SSOT dans la BDD centrale.

🗺️ ROADMAP & ÉVOLUTIONS
Version Actuelle : 1.0.0 ✅
Pipeline complet fonctionnel en batch vers SQLite.

🤝 CONTRIBUTION
Les contributions sont les bienvenues.

📄 LICENCE
Ce projet est développé dans un cadre académique et professionnel. Droits réservés.

👨💻 AUTEUR
KAMENI TCHOUATCHEU GAETAN BRUNEL
Ingénieur Logiciel & Data | Étudiant ESIEA

📧 Email : gaetanbrunel.kamenitchouatcheu@et.esiea.fr
🐙 GitHub : @Lkb-2905

© 2026 Kameni Tchouatcheu Gaetan Brunel - Tous droits réservés
