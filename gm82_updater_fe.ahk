#Requires AutoHotkey v2.0
#NoTrayIcon

;@Ahk2Exe-Set FileVersion, 1.0
;@Ahk2Exe-Set ProductVersion, 1.0.0.0
;@Ahk2Exe-Set CompanyName, Pikakid98

if not FileExist("gm82_updater.exe")
{
	Download "https://github.com/zulc22/8.2Updater-next/releases/latest/download/gm82_updater.exe", "gm82_updater.exe"
}

if (PID := ProcessExist("GameMaker.exe"))
{
	if A_Args.Length < 1
	{
		Run A_AppData "\GameMaker8.2\GameMaker.exe"
	} else {
		Run A_AppData "\GameMaker8.2\GameMaker.exe" " " '"' A_Args[1] '"'
		ExitApp
	}
}


if A_Args.Length < 1
{
	RunWait "gm82_updater.exe" , , "Hide"
	ProcessClose "GameMaker.exe"
	Run A_AppData "\GameMaker8.2\GameMaker.exe"
} else {
	for n, param in A_Args  ; For each parameter:
	{
		RunWait "gm82_updater.exe" , , "Hide"
		ProcessClose "GameMaker.exe"
		Run A_AppData "\GameMaker8.2\GameMaker.exe" " " '"' A_Args[1] '"'
	}
}

ExitApp

