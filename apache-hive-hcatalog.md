[Index](./index.md)
/
**Install Apache Hive and Apache HCatalog**

------

Install Apache Hive and Apache HCatalog
=====

Apache Hive and Apache HCatalog include a Metadata service and query platform.

* [Install Hive and HCatalog RPMs](#install-hive-and-hcatalog-rpms)
* [Set Directories and Permissions](#set-directories-and-permissions)
* [Download Configuration Files](#download-configuration-files)
* [Modify Configuration Files](#modify-configuration-files)
* [Download MySQL Connector](#download-mysql-connector)
* [Validate Installation](#validate-installation)


Install Hive and HCatalog RPMs
----

On all client/gateway nodes from where Hive programs will be executed, install the Hive RPMs.

    yum -y install hive hcatalog

Set Directories and Permissions
----

> For your convenience, we provide [directories.sh](./scripts/directories.sh) and [usersAndGroups.sh](./scripts/usersAndGroups.sh) scripts for setting
> environment parameters. We strongly suggest you edit and execute these scripts to prepare your environment.
> See [Prerequisites &gt; Set Environment Parameters](./prerequisites.md#set-environment-parameters) for more information.

### Create Log Directories

Execute these commands on all nodes:

    mkdir -p $HIVE_LOG_DIR;
    
    chown -R $HIVE_USER:$HADOOP_GROUP $HIVE_LOG_DIR;
    chmod -R 755 $HIVE_LOG_DIR;

Download Configuration Files
---

1. Download the Hive and HCatalog configuration files from [here](./conf/hive) to a temporary directory.

2. Modify the following parameters per your environment. Search for **TODO** in the configuration files for the properties to replace.

3. Refer to the (Prerequisites &gt; Installing MySQL](./prerequisites.md#installing-mysql-optional) section for information on configuring a MySQL instance.

Modify Configuration Files
---

#### hive-site.xml

| Parameter         | Example        | Description  |
|-------------------|----------------|------------------|
| javax.jdo.option.ConnectionURL        | jdbc:mysql://{mysql.full.hostname}:3306/{database.name}?createDatabaseIfNotExist=true | Enter your JDBC connection string.
| javax.jdo.option.ConnectionUserName	| MySQL username | Enter your MySQL username
| javax.jdo.option.ConnectionPassword   | MySQL password | Enter your MySQL password
| hive.metastore.uris               | thrift://{metastore.server.full.hostname}:9083 | Enter your Thrift server


On all Hive hosts create the config directory, copy the config files and set the permissions

    rm -r $HIVE_CONF_DIR ;
    mkdir -p $HIVE_CONF_DIR ;
    
    <copy the config files to $HIVE_CONF_DIR > 

    chown -R $HIVE_USER:$HADOOP_GROUP $HIVE_CONF_DIR/../ ;
    chmod -R 755 $HIVE_CONF_DIR/../ ;
   
Download MySQL Connector
---

1. Download MySQL connector JAR.

        http://public-repo-1.hortonworks.com/ARTIFACTS/mysql-connector-java-5.1.18.zip
    
2. Unzip the file and copy the JAR file

        unzip mysql-connector-java-5.1.18.zip
        cp ./mysql-connector-java-5.1.18/mysql-connector-java-5.1.18-bin.jar /usr/lib/hive/lib/.
        chmod 644 /usr/lib/hive/lib/*mysql*.jar

Validate Installation
----

### Start Metaservice

    <login as $HIVE_USER>
    /usr/lib/hive/bin/hive --service metastore

### Smoke Test Hive

    hive -e 'show databases'
    hive -e 'create table test(col1 int, col2 string)'


------

[Index](./index.md)
|
Prev: [Install Apache Pig](./apache-pig.md)
|
**Install Apache Hive and Apache HCatalog**
|
Next: [Install Apache Oozie](./apache-oozie.md)