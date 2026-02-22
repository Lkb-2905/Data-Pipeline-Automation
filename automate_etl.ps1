# =====================================================================
# Script d'automatisation du Pipeline ETL (Planificateur Windows)
# Ce script crée une tâche exécutant le traitement de la Supply Chain
# tous les jours à 2:00 AM.
# =====================================================================

$TaskName = "Camrail_ETL_Nightly_Batch"
$Action = New-ScheduledTaskAction -Execute "python" -Argument "c:\Users\pc\Desktop\projet total energies\Data-Pipeline-Automation\src\main_pipeline.py" -WorkingDirectory "c:\Users\pc\Desktop\projet total energies\Data-Pipeline-Automation"
$Trigger = New-ScheduledTaskTrigger -Daily -At 2am
$Settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -StartWhenAvailable

# Enregistrement de la tâche dans Windows
Register-ScheduledTask -TaskName $TaskName -Action $Action -Trigger $Trigger -Settings $Settings -Description "Exécution quotidienne du Data Pipeline ETL Supply Chain" -User "SYSTEM" -Force

Write-Host "✅ Tâche planifiée '$TaskName' créée avec succès. Le pipeline s'exécutera désormais toutes les nuits." -ForegroundColor Green
