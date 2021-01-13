cmd /c "mklink /D  %HOMEPATH%\.config\nvim %HOMEPATH%\AppData\Local\nvim"
Set-Location $HOME/.config/nvim
mkdir autoload
mkdir plugged
mkdir tmp
Set-Location tmp
mkdir backup
mkdir undo
Set-Location ../autoload
Invoke-WebRequest https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim -O plug.vim
Set-Location ..
Write-Output "let g:python_host_prog='C:/Users/tydin/AppData/Local/Programs/Python/Python39/python.exe'" | out-file "_machine_specific.vim" -encoding utf8
