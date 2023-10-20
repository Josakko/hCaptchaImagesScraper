@echo off


cd src\

mkdir build\assets\
copy assets build\assets\

:: --windows-icon-from-ico=assets\JK.ico
:: --follow-imports

nuitka main.py --clang --onefile  --enable-plugins=tk-inter --standalone --disable-console --clean-cache=all --remove-output --output-dir=build --windows-icon-from-ico=assets\JK.png

:: rm -rf build\assets\icon.png

echo Compiling finished!
pause