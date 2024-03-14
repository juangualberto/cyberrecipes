Ponemos la red del equipo virtualizado en modo "bridge"

En el equipo virtualizado:
sudo apt update 
sudo apt install openssh-server
sudo su
systemctl enable ssh
systemctl start ssh

En el equipo real:
ssh-keygen
ssh-copy-id kali@192.168.24.XX

En el equipo virtualizado:
nano /etc/ssh/sshd_config
PubkeyAuthentication yes
UsePAM yes

# añadimos al final:
AuthenticationMethods publickey,password

systemctl restart ssh
