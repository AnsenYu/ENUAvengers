cd
git clone https://github.com/enumivo/enumivo.git
cd enumivo
git pull
git checkout 1.0.1
git submodule update --init --recursive
sed -i 's/7000/3000/' `grep -l 7000 scripts/*.sh`
./enumivo_build.sh
cd build
make install
