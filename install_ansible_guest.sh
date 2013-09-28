sudo apt-get update -q
sudo apt-get install -qy python-software-properties

sudo add-apt-repository -y ppa:rquillo/ansible
sudo apt-get update -q
sudo apt-get install -y ansible

echo localhost > /etc/ansible/hosts

# Enable live updating of Ansible play
echo "export PYTHONUNBUFFERED=1" > /root/.bashrc
