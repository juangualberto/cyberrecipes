
apt update
apt upgrade

# FUENTE: https://www.elastic.co/guide/en/elasticsearch/reference/current/deb.html

wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
sudo apt-get install apt-transport-https
echo "deb https://artifacts.elastic.co/packages/8.x/apt stable main" | sudo tee /etc/apt/sources.list.d/elastic-8.x.list

echo "IMPORTANTE: APUNTA EL PASSWORD QUE ES COMUNICADO A CONTINUACION"

sudo apt-get update
sudo apt-get install elasticsearch
sudo apt-get install kibana
sudo apt-get install logstash

sudo /bin/systemctl daemon-reload
sudo /bin/systemctl enable elasticsearch.service
sudo /bin/systemctl enable kibana.service

sudo systemctl start elasticsearch.service
sudo systemctl start kibana.service

Para resetear la contraseña del superusuario elastic hacemos:

sudo /usr/share/elasticsearch/bin/elasticsearch-reset-password -a -u elastic

Para generar un token para hacer el enrolment de kibana a elastic:

sudo /usr/share/elasticsearch/bin/elasticsearch-create-enrollment-token -s kibana

Para conectar vía túnel SSH:

ssh -L 5601:localhost:5601  usuario@192.168.19.XXX
