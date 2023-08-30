@echo off
setlocal
setlocal EnableExtensions
setlocal enabledelayedexpansion
color 0F
title OptiLauncher v2.1B
set BATCH_VERSION=2.1.2
set API_URL=https://orl.theanx9.repl.co/launcher
set OPTID=%~dp0OptiData
chcp 65001 > nul

:: Este segundo Echo es para Windows 7
:: Por alguna razón Windows 7 no quiere leer el primero??
@echo off


:: --------------------------------------------------------------- INICIO --------------------------------------------------------------

for /f "tokens=4-5 delims=. " %%i in ('ver') do set wver=%%i.%%j

:wincheck
if not !wver! == 10.0 (if exist "!OPTID!\Tools\wget.exe" (goto menu)
mkdir "!OPTID!\Tools"
mode con: cols=61 lines=27
cls
echo.
echo        _____     _   _ __                     _          
echo       /     /___/ /_/_/  /  ____ _ _ ___ ____/ /____ ___
echo      /  /  / . /  _/ /  /__/ . // / /   /  _/   / -_/ _/
echo     /_____/  _/_/ /_/_____/_/_//___/_/_/___/_/_/___/_/  
echo           /_/                                           
echo.
echo -------------------------------------------------------------
echo    It looks like you have Windows 8.1 or lower.
echo.
echo    These versions of Windows do not come with cURL pre-installed,
echo    and therefore, some files will not be downloadable.
echo    necessary for the launcher to work.
echo.
echo    To solve this, you have to download the files
echo    required, manually.
echo.
echo    The browser will open downloading a ZIP file.
echo    You will need to extract the ZIP file to the following folder:
echo    OptiData/Tools - located in this same folder
echo.
echo    Once that is done, you can continue.
echo.
echo    
echo.
pause > nul
start "" "https://github.com/TheAnx/OptiLauncherU/raw/main/Tools.zip"
mode con: cols=61 lines=13
cls
echo.
echo        _____     _   _ __                     _          
echo       /     /___/ /_/_/  /  ____ _ _ ___ ____/ /____ ___
echo      /  /  / . /  _/ /  /__/ . // / /   /  _/   / -_/ _/
echo     /_____/  _/_/ /_/_____/_/_//___/_/_/___/_/_/___/_/  
echo           /_/                                           
echo.
echo -------------------------------------------------------------
echo    Press any key when you have already extracted
echo    the file in the OptiData/Tools folder
echo.
pause > nul) else (goto menu)
if not exist "!OPTID!\Tools\wget.exe" (goto wincheck)


:menu
set choicemenu=
set choice2=
set choice3=
set choiceX=
set choiceU=
set num=
set num1=
set options=
set exists=
set filecount=
cls
if not exist "%~dp0OptiData" (mode con: cols=61 lines=26) else (mode con: cols=61 lines=21)
if not exist "%~dp0OptiData" mkdir "%~dp0OptiData"
if not exist "!OPTID!\Tools" mkdir "!OPTID!\Tools"
echo.
echo        _____     _   _ __                     _          
echo       /     /___/ /_/_/  /  ____ _ _ ___ ____/ /____ ___
echo      /  /  / . /  _/ /  /__/ . // / /   /  _/   / -_/ _/
echo     /_____/  _/_/ /_/_____/_/_//___/_/_/___/_/_/___/_/  
echo           /_/                                           
echo                               The Ultimate Edition - v2.1B
echo -------------------------------------------------------------
if !wver! == 10.0 (echo.)
echo    OptiJuegos - OptiCraft Developer
echo    javier_mileiok, FrAndroid - Launcher developers
echo    NobleEpuz - Translator on English
echo    FrAndroid, StarX006 - Design
echo.

:: Descargar archivos necesarios, como wget y archivos de 7-Zip
if not exist "!OPTID!\Tools\wget.exe" (
    echo    Descargando archivos necesarios 1/4...
    curl -s -L --connect-timeout 15 --retry-all-errors -o "!OPTID!\Tools\wget.exe" https://github.com/TheAnx/OptiLauncherU/raw/main/wget.exe)
if not exist "!OPTID!\Tools\7za.exe" (
        echo    Descargando archivos necesarios 2/4...
        "!OPTID!\Tools\wget" -q --connect-timeout=15 --tries=3 -O "!OPTID!\Tools\7za.exe" https://github.com/TheAnx/OptiLauncherU/raw/main/7za.exe) 
if not exist "!OPTID!\Tools\7zxa.dll" (
        echo    Descargando archivos necesarios 3/4...
        "!OPTID!\Tools\wget" -q --connect-timeout=15 --tries=3 -O  "!OPTID!\Tools\7zxa.dll" https://github.com/TheAnx/OptiLauncherU/raw/main/7zxa.dll) 
if not exist "!OPTID!\Tools\7za.dll" (
        echo    Descargando archivos necesarios 4/4...
        "!OPTID!\Tools\wget" -q --connect-timeout=15 --tries=3 -O "!OPTID!\Tools\7za.dll" https://github.com/TheAnx/OptiLauncherU/raw/main/7za.dll
        echo.) 

echo -------------------------------------------------------------
if !wver! == 10.0 (echo.)
echo    1. OptiCraft Bedrock
echo    2. OptiCraft Java
echo    3. Update versions
echo    4. Extras
echo.
set /p choicemenu=Select an option: 
echo.
echo -------------------------------------------------------------
echo.

if not defined choicemenu (set "choicemenu="
    goto menu
) else if !choicemenu!==1 (set "choicemenu="
    goto OpB
) else if !choicemenu!==2 (set "choicemenu="
    goto OpJ
) else if !choicemenu!==3 (set "choicemenu="
    goto OpU
) else if !choicemenu!==4 (set "choicemenu="
    goto OpE) else (goto menu)


:: ------------------------------------------------------------- BEDROCK -------------------------------------------------------------

:OpB
cls
mode con: cols=61 lines=22
echo.
echo        _____     _   _ __                     _          
echo       /     /___/ /_/_/  /  ____ _ _ ___ ____/ /____ ___
echo      /  /  / . /  _/ /  /__/ . // / /   /  _/   / -_/ _/
echo     /_____/  _/_/ /_/_____/_/_//___/_/_/___/_/_/___/_/  
echo           /_/                                           
echo.
echo -------------------------------------------------------------
if !wver! == 10.0 (echo.)
echo    0. Exit
echo.
echo    1. Run OptiCraft 1.7.3.1
echo    2. Run OptiCraft 1.9.1.0
echo    3. Run OptiCraft 1.12.0
echo    4. Run OptiCraft 1.14.31
echo    5. Run OptiCraft 1.16.12
echo    6. Run OptiCraft 1.17.30
echo    7. Run OptiCraft 1.18.31
echo    8. Run OptiCraft 1.19.52 
echo    9. Run OptiCraft 1.20.10
echo.
set /p choice2=Select an option: 
echo.
echo -------------------------------------------------------------
echo.

if !choice2! == 0 (mode con: cols=61 lines=20 && goto menu)

if !choice2! == 5 (set 5a= OpenGL 4.1
    set 5b= OpenGL 4.1\OptiCraft 1.16.12 By OptiJuegos) else (set 5a=
    set 5b=)

set 1=1.7.3.1
set 2=1.9.1.0
set 3=1.12.0
set 4=1.14.31
set 5=1.16.12
set 6=1.17.30
set 7=1.18.31
set 8=1.19.52
set 9=1.20.10

if exist "!OPTID!\OptiCraft !%choice2%! By OptiJuegos!5a!\" (
    start "" "!OPTID!\OptiCraft !%choice2%! By OptiJuegos!5b!\OptiCraft.exe"
    mode con: cols=61 lines=4
    cls
    echo.
    echo                      OptiCraft was run.
    echo                   You can close this window
    pause > nul
    goto menu
) else (
    mode con: cols=61 lines=4
    cls
    echo.
    echo               OptiCraft could not be found.
    echo               Press any key to download it...
    pause > nul
    cls
    echo.
    echo        Downloading... This may take several minutes
    echo.
    "!OPTID!\Tools\wget" -q --show-progress --connect-timeout=15 --tries=3 -O "!OPTID!\OptiCraft-!%choice2%!-By-OptiJuegos.7z" https://github.com/TheAnx/OptiCraft-Archive/releases/download/Bedrock/OptiCraft-!%choice2%!-By-OptiJuegos.7z
    mode con: cols=61 lines=1
    "!OPTID!\Tools\7za" x "!OPTID!\OptiCraft-!%choice2%!-By-OptiJuegos.7z" -o./OptiData
    del "!OPTID!\OptiCraft-!%choice2%!-By-OptiJuegos.7z"
    start "" "!OPTID!\OptiCraft !%choice2%! By OptiJuegos!5b!\OptiCraft.exe"
    mode con: cols=61 lines=4
    cls
    echo.
    echo                       OptiCraft was run.
    echo                    You can close this window
    pause > nul
    goto menu)
goto menu


:: --------------------------------------------------------------- JAVA ---------------------------------------------------------------

:OpJ
cls
mode con: cols=61 lines=18
echo.
echo        _____     _   _ __                     _          
echo       /     /___/ /_/_/  /  ____ _ _ ___ ____/ /____ ___
echo      /  /  / . /  _/ /  /__/ . // / /   /  _/   / -_/ _/
echo     /_____/  _/_/ /_/_____/_/_//___/_/_/___/_/_/___/_/  
echo           /_/                                           
echo.
echo -------------------------------------------------------------
if !wver! == 10.0 (echo.)
echo    0. Exit
echo.
echo    1. Run OptiCraft Java 1.7.10
echo    2. Run OptiCraft Java 1.8.9
echo    3. Run OptiCraft Java 1.12.2
echo    4. Run OptiCraft Java 1.16.5
echo    5. Run OptiCraft Java 1.20
echo.
set /p choice3=Seleccioná una opción: 
echo.
echo -------------------------------------------------------------
echo.

if !choice3! == 0 (goto menu)

:runjava

set 1=1.7.10
set 2=1.8.9
set 3=1.12.2 FORGE
set 4=1.16.5
set 5=1.20.0

if not !choice3! == 1 (set javaA=JAVA.)


if exist "!OPTID!\OptiCraft !%choice3%!\" (set exists=1)
if exist "!OPTID!\OptiCraft JAVA !%choice3%!\" (set exists=1)
if exist "!OPTID!\OptiCraft Java !%choice3%!\" (set exists=1)
if exist "!OPTID!\OptiCraft JAVA CLIENTS !%choice3%!\" (set exists=1)

if not !exists! == 1 (set 3=1.12.2.FORGE
    mode con: cols=61 lines=4
    cls
    echo.
    echo               OptiCraft could not be found.
    echo              Press any key to download it...
    pause > nul
    cls
    echo.
    echo        Downloading... This may take several minutes
    echo.
    "!OPTID!\Tools\wget" -q --show-progress --connect-timeout=15 --tries=3 -O "!OPTID!\OptiCraft.!javaA!!%choice3%!.7z" https://github.com/TheAnx/OptiCraft-Archive/releases/download/Java/OptiCraft.!javaA!!%choice3%!.7z
    mode con: cols=61 lines=1
    "!OPTID!\Tools\7za" x "!OPTID!\OptiCraft.!javaA!!%choice3%!.7z" -o./OptiData
    del "!OPTID!\OptiCraft.!javaA!!%choice3%!.7z"
    goto runjava)


if !exists! == 1 (cd "!OPTID!\OptiCraft !%choice3%!\"
    cd "!OPTID!\OptiCraft JAVA !%choice3%!\"
    cd "!OPTID!\OptiCraft JAVA CLIENTS !%choice3%!\"
    set filecount=11
    for %%A in (*) do set /a filecount+=1
    cls
    mode con: cols=61 lines=!filecount!
    echo.
    echo        _____     _   _ __                     _          
    echo       /     /___/ /_/_/  /  ____ _ _ ___ ____/ /____ ___
    echo      /  /  / . /  _/ /  /__/ . // / /   /  _/   / -_/ _/
    echo     /_____/  _/_/ /_/_____/_/_//___/_/_/___/_/_/___/_/  
    echo           /_/                                           
    echo.
    echo -------------------------------------------------------------
    for /f tokens^=* %%i in ('where .:*.bat') do (
    set /a num1=!num1!+1
    set options=%%~nxi
    echo    !num1!. !options:~2,-4!
    )
    echo.
    set /p num=Seleccioná una opción: 

    where !num!-* > tmp
    set /p batdir= < tmp
    del tmp
    start "New Window" cmd /c "!batdir!"

    cd ../..
    mode con: cols=61 lines=4
    cls
    echo.
    echo                       OptiCraft was run.
    echo                   You can close this window
    pause > nul
    goto menu)
goto menu


:: --------------------------------------------------------------- EXTRAS --------------------------------------------------------------

:OpE
chcp 65001 > nul
cls
mode con: cols=61 lines=19
echo.
echo        _____     _   _ __                     _          
echo       /     /___/ /_/_/  /  ____ _ _ ___ ____/ /____ ___
echo      /  /  / . /  _/ /  /__/ . // / /   /  _/   / -_/ _/
echo     /_____/  _/_/ /_/_____/_/_//___/_/_/___/_/_/___/_/  
echo           /_/                                           
echo.
echo -------------------------------------------------------------
if !wver! == 10.0 (echo.)
echo    0. Exit
echo.
echo    1. Run Craftsman
echo    2. Run DxCPL
echo    3. Download VC++ Installer
echo    4. Open GPL-license
echo    5. View GitHub of the launcher
echo    6. Update launcher
echo.
set /p choiceX=Select an option: 
echo.
echo -------------------------------------------------------------
echo.

if !choiceX! == 0 (goto menu)

if !choiceX! == 4 (start "" https://www.gnu.org/licenses/gpl-3.0.txt
    goto OpE)

if !choiceX! == 5 (start "" https://github.com/TheAnx/OptiLauncherU
    goto OpE)

:OpE2

set 1a="!OPTID!\Craftsman MOD PC PORT By OptiJuegos\"
set 1b=https://cdn.discordapp.com/attachments/1065489877497548861/1141132649067458690/Craftsman_MOD_PC_PORT_By_OptiJuegos.7z
set 1c="!OPTID!\Craftsman_MOD_PC_PORT_By_OptiJuegos.7z"
set 1d="!OPTID!\Craftsman MOD PC PORT By OptiJuegos\Craftsman.exe"

set 2a=!OPTID!\dxcpl.exe
set 2b=https://cdn.discordapp.com/attachments/1092536202814574733/1116460790334111904/dxcpl.zip
set 2c="!OPTID!\dxcpl.zip"
set 2d="!OPTID!\dxcpl.exe"

set 3a="!OPTID!\Tools\vsc"
set 3b=https://github.com/TheAnx/OptiCraft-Archive/releases/download/Misc/Visual-C-Runtimes-All-in-One-May-2023.zip
set 3c="!OPTID!\Tools\vsc\Visual-C-Runtimes-All-in-One-May-2023.zip"

if !choiceX! == 6 (
    for /f %%i in ('curl --connect-timeout 5 --max-time 5 -s !API_URL!') do set LAUNCHER_VERSION=%%i
    if "!BATCH_VERSION!" == "!LAUNCHER_VERSION!" (mode con: cols=61 lines=4
        cls
        echo.
        echo          The launcher is now in its latest version!           
        echo.
        pause > nul
        goto OpE
    ) else (mode con: cols=61 lines=5
        cls
        echo.
        echo                    An update was found.
        echo                Press any key to download it...
        echo.
        pause > nul
        cls
        echo.
        echo      Downloading... This may take a few seconds
        echo.
        "!OPTI_DATA_FOLDER!\Tools\wget.exe" -q --show-progress --connect-timeout=15 --tries=3 -O OptiLauncherU.exe  https://orl.theanx9.repl.co/OptiLauncherU.exe
        echo.
        echo                   The launcher has been updated.
        echo                       Close it and reopen it
        echo.
        pause > nul)
        goto menu) 

if exist !%choiceX%a! (
    if not !choiceX! == 3 (start "" "!%choiceX%d!") else (start "New Window" cmd /c "!OPTID!\Tools\vsc\install_all.bat")
    mode con: cols=61 lines=4
    cls
    echo.
    echo                           Executed.
    echo                   You can close this window
    pause > nul
    goto menu) else (mode con: cols=61 lines=4
    cls
    echo.
    echo                    Could not be found.
    echo               Press any key to download it...
    pause > nul
    echo.
    echo        Downloading... This may take several minutes
    echo.
    if !choiceX! == 3 (mkdir "!OPTID!/Tools/vsc")
    "!OPTID!\Tools\wget" -q --show-progress --connect-timeout=15 --tries=3 -O "!%choiceX%c!" "!%choiceX%b!"
    mode con: cols=61 lines=1
    if not !choiceX! == 3 ("!OPTID!\Tools\7za" x "!%choiceX%c!" -o./OptiData) else ("!OPTID!\Tools\7za" x "!%choiceX%c!" -o./OptiData/Tools/vsc)
    del "!%choiceX%c!"
    goto OpE2)
goto menu


:: ------------------------------------------------------------- UPDATER -------------------------------------------------------------

:OpU
chcp 65001 > nul
cls
mode con: cols=61 lines=25
echo.
echo        _____     _   _ __                     _          
echo       /     /___/ /_/_/  /  ____ _ _ ___ ____/ /____ ___
echo      /  /  / . /  _/ /  /__/ . // / /   /  _/   / -_/ _/
echo     /_____/  _/_/ /_/_____/_/_//___/_/_/___/_/_/___/_/  
echo           /_/                                           
echo.
echo -------------------------------------------------------------
if !wver! == 10.0 (echo.)
echo    Before proceeding, you should know that the updates are
echo    can take approximately 24 hours to upload.
echo.
echo    Yes OptiJuegos has just released an update,
echo    you will most likely have to wait before you can
echo    update the version using this launcher.
echo.
echo    Alternatively, you can extract the folder from a
echo    new version in the "OptiData" folder located in the 
echo    "OptiData" folder located in the "OptiData" folder in the
echo    folder where this launcher is located, although
echo    doing this may cause problems.
echo.
echo    Once that is understood,
echo    press any key to continue.
echo.
pause > nul

chcp 65001 > nul
cls
mode con: cols=61 lines=32
echo.
echo        _____     _   _ __                     _          
echo       /     /___/ /_/_/  /  ____ _ _ ___ ____/ /____ ___
echo      /  /  / . /  _/ /  /__/ . // / /   /  _/   / -_/ _/
echo     /_____/  _/_/ /_/_____/_/_//___/_/_/___/_/_/___/_/  
echo           /_/                                           
echo.
echo -------------------------------------------------------------
if !wver! == 10.0 (echo.)
echo                Which version do you want to upgrade?
echo.
echo    0. Exit
echo.
echo    1. OptiCraft Bedrock 1.7.3.1
echo    2. OptiCraft Bedrock 1.9.1.0
echo    3. OptiCraft Bedrock 1.12.0
echo    4. OptiCraft Bedrock 1.14.31
echo    5. OptiCraft Bedrock 1.16.12
echo    6. OptiCraft Bedrock 1.17.30
echo    7. OptiCraft Bedrock 1.18.31
echo    8. OptiCraft Bedrock 1.19.52
echo    9. OptiCraft Bedrock 1.20.10
echo.
echo --------------------------- JAVA ----------------------------
echo.
echo    10. OptiCraft Java 1.7.10
echo    11. OptiCraft Java 1.8.9
echo    12. OptiCraft Java 1.12.2
echo    13. OptiCraft Java 1.16.5
echo    14. OptiCraft Java 1.20.0
echo.
set /p choiceU=Select an option: 

if !choiceU! == 0 (goto menu)

:: Para descargas
set 1=-1.7.3.1-By-OptiJuegos
set 2=-1.9.1.0-By-OptiJuegos
set 3=-1.12.0-By-OptiJuegos
set 4=-1.14.31-By-OptiJuegos
set 5=-1.16.12-By-OptiJuegos
set 6=-1.17.30-By-OptiJuegos
set 7=-1.18.31-By-OptiJuegos
set 8=-1.19.52-By-OptiJuegos
set 9=-1.20.10-By-OptiJuegos

set 10=.1.7.10
set 11=1.8.9
set 12=1.12.2.FORGE
set 13=1.16.5
set 14=1.20.0

:: Para chequeo de instalación
set 1b= 1.7.3.1 By OptiJuegos
set 2b= 1.9.1.0 By OptiJuegos
set 3b= 1.12.0 By OptiJuegos
set 4b= 1.14.31 By OptiJuegos
set 5b= 1.16.12 By OptiJuegos
set 6b= 1.17.30 By OptiJuegos
set 7b= 1.18.31 By OptiJuegos
set 8b= 1.19.52 By OptiJuegos
set 9b= 1.20.10 By OptiJuegos

set 10b= 1.7.10
set 11b=1.8.9
set 12b=1.12.2.FORGE
set 13b=1.16.5
set 14b=1.20.0


if not !choiceU! LEQ 9 (set edition=Java) else (set edition=Bedrock)
if not !choiceU! LEQ 10 (set javaA=.JAVA.
    set javaB= Java ) else (set javaA=
    set javaB=)


if !choiceU! == 5 (set 5a= OpenGL 4.1) else (set 5a=)

:: Chequeo para ver si la versión ya está instalada
:: No se puede usar "if exists" ya que esta función es case sensitive
set exists=1
cd "!OPTID!\OptiCraft!javaB!!%choiceU%b!!5a!\" || set exists=0


if !exists! == 0 (mode con: cols=61 lines=4
    cls
    echo.
    echo                This version is not installed.
    echo          Version must be installed in order to update 
    pause > nul
    goto menu
) else (cd !OPTID!\..
    mode con: cols=61 lines=4
    cls
    echo.
    echo       Updating... This may take several minutes
    echo.
    rd "!OPTID!\OptiCraft!javaB!!%choiceU%b!!5a!\" /s /q
    "!OPTID!\Tools\wget" -q --show-progress --connect-timeout=15 --tries=3 -O "!OPTID!\OptiCraft-!javaA!!%choiceU%!.7z" https://github.com/TheAnx/OptiCraft-Archive/releases/download/!edition!/OptiCraft!javaA!!%choiceU%!.7z
    mode con: cols=61 lines=1
    "!OPTID!\Tools\7za" x "!OPTID!\OptiCraft-!javaA!!%choiceU%!.7z" -o./OptiData
    del "!OPTID!\OptiCraft-!javaA!!%choiceU%!.7z"
    mode con: cols=61 lines=4
    cls
    echo.
    echo                   OptiCraft was updated.
    echo               Press any key to go to the menu
    pause > nul
    goto menu)
goto menu