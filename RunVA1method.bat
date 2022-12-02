@chcp 65001
set param_c="StartFeaturePlayer;QuietInstallVanessaExt;WorkspaceRoot=%cd%;VAParams=%cd%\tools\VAParams.json"
call "C:\Program Files\1cv8\8.3.20.1710\bin\1cv8c" /N"Администратор" /TestManager /Execute "C:\tools\VASingle\vanessa-automation-single.epf" /IBConnectionString "File=""C:\!D\1C_Base\KursVA\"";" /C%param_c%