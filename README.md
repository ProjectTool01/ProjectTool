# Installation
* sudo apt-get install -y nginx postgresql default-jdk
    * java --version ***(optional)***

* sudo -u postgres psql
    * alter user postgres with password '123';
    * create database "ProjectTool";
    * \q
---
Добавляем редирект в nginx:
* sudo nano /etc/nginx/sites-enabled/default

```
location / {
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_pass http://localhost:8080;
}

location /img/ {
        alias /home/roman/uploads/;
}
```

* sudo nginx -s reload
    * cd ~
    * mkdir uploads

* sudo apt install maven
* mvn install

Убиваем предыдущий процесс java, если таковой присутствует:
* pgrep java | xargs kill -9

Выпускаем бычка:
* nohup java -jar WorkPix-1.0-SNAPSHOT.jar > log.txt &