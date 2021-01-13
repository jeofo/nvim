cmd /c "mklink /D  %HOMEPATH%\.config\nvim %HOMEPATH%\AppData\Local\nvim"
cd $HOME/.config/nvim
mkdir autoload
mkdir plugged
mkdir tmp
cd tmp
mkdir backup
mkdir undo
cd ../autoload
wget https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim -O p
cd ..
Write-Output "let g:python_host_prog='C:/Users/tydin/AppData/Local/Programs/Python/Python39/python.exe'" | out-file "_machine_specific.vim" -encoding utf8

