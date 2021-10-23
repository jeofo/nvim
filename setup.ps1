if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Start-Process PowerShell -Verb RunAs "-NoProfile -ExecutionPolicy Bypass -Command `"cd '$pwd'; & '$PSCommandPath';`"";
    exit;
}

Write-Output "let g:python3_host_prog='C:/Users/tydin/AppData/Local/Programs/Python/Python39/python.exe'" | out-file "_machine_specific.vim" -encoding utf8
mkdir autoload
Set-Location ./autoload
Invoke-WebRequest https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim -O plug.vim
Set-Location ..
mkdir plugged
mkdir tmp
Set-Location tmp
mkdir backup
mkdir undo
New-Item -ItemType Directory -Force -Path $HOME\.config
cmd /c "mklink /D  %HOMEPATH%\.config\nvim %HOMEPATH%\AppData\Local\nvim"