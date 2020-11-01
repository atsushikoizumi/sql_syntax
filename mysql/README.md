# mysql
mysql 向けの sql のサンプルを載せていく。<br>

0. 接続
```
mysql -h host -u user -p -P 3306 -D dbname
```

1. データベースの一覧
```
show databases;
```

2. ユーザー一覧
```
select User,Host from mysql.user;
```

