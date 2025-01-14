@echo off
set p4port=10.72.34.202:1666
set p4user=limenghui
set p4client=limenghui_cnshaw2609_9721
p4 -ztag describe -S %1 >output.txt

setlocal enabledelayedexpansion
set "connector=@="
if exist "fliter.txt" (
    del "fliter.txt"    
) 
for /f "delims=" %%a in ('type output.txt ^| findstr /i /c:"... depotFile"') do (   
    set "line=%%a"
    set src=!line:~14!!connector!%1
    set dst=!line:~14!
    set dst=!dst://TestStream/Main=D:\jenkins_node\workspace\limenghui_cnshaw2609_9721!
    p4 print -o !dst! -q !src!
    echo !line:~14!>>fliter.txt
    
    
)

endlocal
