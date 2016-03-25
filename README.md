# docker-tomcat7
Basic tomcat container

```yaml

CMD $CATALINA_HOME/bin/catalina.sh run  ## Dont work as array

$ ls
Dockerfile  README.md  webapps
$ cd webapps ; wget https://tomcat.apache.org/tomcat-6.0-doc/appdev/sample/sample.war

$ sudo docker build -t kmcnally26/tomcat7 .

$ sudo docker run -d -p 8080 --name website3 -v $PWD/webapps:/opt/tomcat/webapps kmcnally26/tomcat7

$ sudo docker ps
CONTAINER ID        IMAGE               COMMAND                  PORTS                     NAMES
a4eb7428f6ad        kmcnally/tomcat7    "/bin/sh -c '$CATALIN"   0.0.0.0:32788->8080/tcp   website3

$ sudo docker exec -it website3 bash
[root@916b31c91133 /]# service tomcat status
tomcat (pid 1) is running..
$exit

$ firefox localhost:32788/sample

$ cat /etc/systemd/system/docker-website3.service
[Unit]
Description=Docker Website 3
Requires=docker.service
After=docker.service

[Service]
Restart=always
ExecStart=/usr/bin/docker start -a website3
ExecStop=/usr/bin/docker stop -t 2 website3

[Install]
WantedBy=local.target





```
