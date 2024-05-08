echo "########## Installing Docker #########"
# Checking for update
sudo apt update

#installing curl package if its not present in ubuntu system
sudo apt install curl
sudo apt install apt-transport-https ca-certificates curl software-properties-common
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"

sudo apt-get install docker-ce=5:19.03.15~3-0~ubuntu-bionic docker-ce-cli=5:19.03.15~3-0~ubuntu-bionic containerd.io
#Executing/Running get-docker.sh file
sh get-docker.sh
echo "######### Docker Installation complete #######"
echo "######### Installing docker compose ########"

#Downloading/Getting Docker-compose
curl -L https://github.com/docker/compose/releases/download/1.25.4/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose

#Changing permission of docker compose
chmod +x /usr/local/bin/docker-compose
echo "######### Installing docker compose complete ########"
echo "######### Installing docker machine ##############"

#Downloading/Getting docker-machine
curl -L https://github.com/docker/machine/releases/download/v0.16.2/docker-machine-`uname -s`-`uname -m` >/tmp/docker-machine &&
    chmod +x /tmp/docker-machine &&
    sudo cp /tmp/docker-machine /usr/local/bin/docker-machine
echo "######### Instaling docker machine complete ############"
#Adding docker as group in ubuntu system
sudo groupadd docker
sudo usermod -aG docker $USER

