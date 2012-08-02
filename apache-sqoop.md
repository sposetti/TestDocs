[Index](./index.md)
/
**Install Apache Sqoop**

------

Install Apache Sqoop
=====

Apache Sqoop is a NoSQL database and Apache Zookeeper performs cluster coordination.

* [Install RPMs](#install-rpms)
* [Download MySQL Connector](#download-mysql-connector)
* [Deploy Configurations](#deploy-configurations)
* [Validate Installation](#validate-installation)

Install RPMs
----

On all nodes where you plan to use the Sqoop client, install RPMs.

        yum -y install sqoop

Download MySQL Connector
---

1. Download MySQL connector JAR.

        http://public-repo-1.hortonworks.com/ARTIFACTS/mysql-connector-java-5.1.18.zip
    
2. Unzip the file.

3. Copy the JAR file

        cp ./mysql-connector-java-5.1.18-bin.jar /usr/lib/sqoop/lib/.
        chmod 644 /usr/lib/sqoop/lib/*mysql*.jar

### Deploy Configurations

1. Download the Sqoop configuration files from [here](./conf/sqoop) to a temporary directory.

2. Copy the config files to the Sqoop conf dir.

        <copy the config files to $SQOOP_CONF_DIR >    

Validate Installation
----

### Smoke Test

1. Execute the following command. You should see the Sqoop version information displayed.

        sqoop version | grep 'Sqoop [0-9].*'

------

[Index](./index.md)
|
Prev: [Install Apache HBase and Apache Zookeeper](./apache-hbase-zookeeper.md)
|
**Install Apache Sqoop**