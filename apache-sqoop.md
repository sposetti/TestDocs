[Index](./index.md)
/
**Install Apache Sqoop**

------

Install Apache Sqoop
=====

TBD

yum -y install sqoop




Download MySQL Connector
---

1. Download MySQL connector JAR.

        http://public-repo-1.hortonworks.com/ARTIFACTS/mysql-connector-java-5.1.18.zip
    
2. Unzip the file.

3. Copy the JAR file

        cp ./mysql-connector-java-5.1.18-bin.jar /usr/lib/hive/lib/.
        chmod 644 /usr/lib/sqoop/lib/*mysql*.jar


sqoop version | grep 'Sqoop [0-9].*

------

[Index](./index.md)
|
Prev: [Install Apache HBase and Apache Zookeeper](./apache-hbase-zookeeper.md)
|
**Install Apache Sqoop**