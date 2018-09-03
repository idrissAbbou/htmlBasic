::this script create the basic files for a webpage
@echo off
setlocal enabledelayedexpansion
set filename=%1
set openWithCode=%2
goto :main

:CreateTheFiles
setlocal
	::make the dirictories
	mkdir !filename!
	mkdir !filename!\css
	mkdir !filename!\scripts
	mkdir !filename!\img
	::make the needed files
	type NUL> !filename!\index.html
	type NUL> !filename!\css\style.css
	type NUL> !filename!\scripts\script.js
endlocal
goto :eof

:CheckForFilesExistence
setlocal
	echo the followed files are created
	dir !filename!
endlocal
goto :eof

:OpenWithCode
setlocal
	if !openWithcode! == y ( 
		code !filename!
	)
endlocal
goto :eof

:CreateTheIndexContent
setlocal
	(
		echo ^<^^!DOCTYPE html^>
		echo ^<html lang="en"^>
		echo ^<head^>
    	echo	^<link rel="stylesheet" href="./css/style.css"^>
    	echo	^<meta charset="UTF-8"^>
    	echo	^<meta name="viewport" content="width=device-width, initial-scale=1.0"^>
   		echo	^<meta http-equiv="X-UA-Compatible" content="ie=edge"^>
   		echo	^<title^>Document^</title^>
		echo ^</head^>
		echo ^<body^>
		echo ^</body^>
		echo ^</html^>
	) >> !filename!\index.html
endlocal
goto :eof

:main
setlocal
	call :CreateTheFiles
	call :CheckForFilesExistence
	call :OpenWithCode
	call :CreateTheIndexContent
endlocal
goto :eof
