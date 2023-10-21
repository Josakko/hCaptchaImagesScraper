#!/bin/bash


cd src/ || exit

mkdir build/
cd build/ || exit
mkdir assets/
cp ../assets/icon.png assets/icon.png
cd ..

rm -rf venv
python3 -m venv venv
source venv/bin/activate

curl -o req.txt https://raw.githubusercontent.com/Josakko/hCaptchaImagesScraper/main/requirements.txt
pip3 install -r req.txt

python3 -m nuitka main.py --clang --disable-console --clean-cache=all --remove-output --output-dir=build --onefile --standalone --enable-plugins=tk-inter # --follow-imports

deactivate
rm -rf venv
rm -rf req.txt

mv build/main.bin build/hChaptchaImageScraper
touch build/questions.txt
mkdir build/images

echo "Compiling finished!"
