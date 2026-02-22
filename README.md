# 🚂 Freight Data Pipeline Automation V1.0
🌍 Camrail / Bolloré Logistics Data Engineering Project
![Python](https://img.shields.io/badge/Python-3.12-blue) ![SQLite](https://img.shields.io/badge/SQLite-Data_Warehouse-lightgrey) ![Pandas](https://img.shields.io/badge/Pandas-Transformation-green)

**Version:** 1.0.0 Stable | **Date:** Février 2026  
**Auteur:** KAMENI TCHOUATCHEU GAETAN BRUNEL  

---

## 🎯 VUE D'ENSEMBLE DU PROJET

Ce projet illustre de solides compétences en **Ingénierie des Données (Data Engineering)** en automatisant le traitement quotidien des flux logistiques de fret (locomotives, marchandises, incidents en gare).

✅ **ETL Architecture :** Modèle complet (Extraction, Transformation, Chargement).
✅ **Data Warehouse :** Alimentation transactionnelle d'une base de données SQLite3.
✅ **Automatisation O.S :** Préparation pour la mise en tâche planifiée Windows (Task Scheduler).

| Aspect | Démonstration |
| :--- | :--- |
| **Gouvernance IT** | Consolidation des données dispersées vers une base relationnelle. |
| **Scalabilité** | Scripts séparés (`extract.py`, `transform.py`, `load.py`). |
| **Fiabilité** | Exécution orchestrée supportant la gestion d'exceptions globale. |
| **Business Value** | KPI calculés (Alertes logistiques, Volume par gare). |

---

## 🏗️ ARCHITECTURE DU PIPELINE

1. **Layer: Extraction** (`extract.py`)
   * Connexion simulée au Référentiel Machines (API/JSON).
   * Récupération des transactions de fret journalier.
2. **Layer: Transformation** (`transform.py`)
   * Normalisation des dates et jointure (Merge) des tables de faits/dimensions.
   * Agrégation analytique par gare de triage.
3. **Layer: Loading** (`load.py` & `main_pipeline.py`)
   * Chargement par lot via SQLAlchemy dans `supply_chain_dwh.sqlite`.

---

## 🚀 DÉMARRAGE RAPIDE

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

Le fichier `database/supply_chain_dwh.sqlite` sera généré, regorgeant des tables de faits propres.

---

## 📖 REQUÊTAGE ET AUTOMATISATION

Le fichier `sql/advanced_queries.sql` met en valeur des requêtes SQL avancées avec les fenêtres temporelles analytiques (Window Functions `LAG()`, `OVER()`) pour classer la fiabilité des Hubs.
Le script `automate_etl.ps1` sert au déploiement de routine nocturne sur serveur de production.

© 2026 Kameni Tchouatcheu Gaetan Brunel - Tous droits réservés
