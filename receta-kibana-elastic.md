
Creamos una máquina virtual:

* 30 GB de disco dinámico
* 8192 MB de RAM
* 4 hilos de ejecución
* Habilitar PAE
* Habilitar VT-x
* Habilitar paginación anidada
* En medios añadimos el CD-ROM de Ubuntu Server (ISO)

```bash
apt update
apt upgrade
```

FUENTE: <https://www.elastic.co/guide/en/elasticsearch/reference/current/deb.html>

```bash

wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo gpg --dearmor -o /usr/share/keyrings/elasticsearch-keyring.gpg

sudo apt-get install apt-transport-https

echo "deb [signed-by=/usr/share/keyrings/elasticsearch-keyring.gpg] https://artifacts.elastic.co/packages/8.x/apt stable main" | sudo tee /etc/apt/sources.list.d/elastic-8.x.list


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
```

Ahora ya podemos ver elastic en el puerto 9200 y kibana en el 5601. 

El usuario será **elastic** y la contraseña la que se generó.

Para conectar vía túnel SSH:

```bash
ssh -L 5601:localhost:5601  usuario@192.168.19.XXX
```

**Para resetear la contraseña del superusuario elastic hacemos:**

```bash
sudo /usr/share/elasticsearch/bin/elasticsearch-reset-password -a -u elastic
```


Para **generar un token para hacer el enrolment de kibana a elastic**:

```bash
sudo /usr/share/elasticsearch/bin/elasticsearch-create-enrollment-token -s kibana
```

Para obtener el código por el que me pregunta kibana:

```bash
sudo /usr/share/kibana/bin/kibana-verification-code
```

