# Neotestovano, pouze poskladano z historie
# Take by to chtelo udelat service pro Web (run_linux.sh)
sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y install build-essential
sudo apt-get -y install cmake
sudo apt-get -y install pkg-config
sudo apt-get -y install libcurl4-openssl-dev
sudo apt-get -y install libboost-all-dev
sudo apt-get -y install libpng-dev libjpeg-dev
sudo apt-get -y install libfreetype6-dev

cd /vagrant/app/Tag-Print/install_dependencies/linux/
tar -xf ImageMagick-6.9.6-8.tar.xz ImageMagick-6.9.6-8/
cd ImageMagick-6.9.6-8/
./configure
check
make
sudo make install
sudo ldconfig

cd /vagrant/app/Tag-Print/cxx/
mkdir build
cd build/
cmake ..
make

sudo apt-get -y install libfreetype6-dev
sudo apt-get -y install mongodb

sudo apt-get -y install python-pip
pip install setuptools
pip install pymongo
cd /vagrant/app/Tag-Print/web/nekofeed/
pip install .
sudo apt-get -y install python-pastescript
paster make-config nekofeed config.ini
paster setup-app config.ini

# Create service and log for this
# cd /vagrant/app/Tag-Print/web/nekofeed/
# ./run_linux.sh
