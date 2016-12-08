APT_LISTCHANGES_FRONTEND=none
sudo apt update -y
sudo apt full-upgrade -y

sudo apt-get install arduino -y

echo -e"\n-- Removing the older version of node --\n"
sudo apt-get remove nodered -y
sudo apt-get remove nodejs nodejs-legacy -y
sudo apt-get remove npm  -y # if you installed npm

# Thanks to https://github.com/elgervb/raspberrypi/blob/master/install/nodejs.sh
echo -e "\n--- Installing NodeJS & NPM ---\n"

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.0/install.sh | bash > /dev/null 2>&1
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
source ~/.bashrc > /dev/null 2>&1

nvm install node
nvm alias default node

nvm ls