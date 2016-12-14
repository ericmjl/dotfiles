# This script installs the `wget` program, which can be used in place of `curl`.

cd ~

curl -O http://ftp.gnu.org/gnu/wget/wget-1.18.tar.xz
tar -xzf wget-1.18.tar.xz

cd wget-1.18/
./configure --with-ssl=openssl
make
sudo make install
wget --help

cd ..
rm -rf wget*
