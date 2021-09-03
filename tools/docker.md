# mysql
```
docker volume create mysql-volume
docker run --name=mysql1 -p3306:3306 -v mysql-volume:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=123456 -d mysql/mysql-server:5.7

docker logs mysql1
docker exec -it mysql1 bash
docker exec -it mysql1 mysql -uroot -p
```

# docker volume create phpmyadmin-volume
```
docker volume create phpmyadmin-volume
docker run --name phpmyadmin1 -v phpmyadmin-volume:/etc/phpmyadmin/config.user.inc.php --link mysql1:db -p 82:80 -d phpmyadmin/phpmyadmin

```
