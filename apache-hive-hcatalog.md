[Index](./index.md)
/
**Install Apache Hive and Apache HCatalog**

------

Install Apache Hive and Apache HCatalog
=====

Apache Hive and Apache HCatalog include a Metadata service and query platform.

* [Install Hive and HCatalog RPMs](#install-hive-and-hcatalog-rpms)
* [Set Directories and Permissions](#set-directories-and-permissions)
* [Download MySQL Connector](#download-mysql-connector)
* [Validate Installation](#validate-installation)


Install Hive and HCatalog RPMs
----

On all client/gateway nodes from where Hive programs will be executed, install Hive RPMs.

    yum -y install hive hcatalog

Set Directories and Permissions
----

### Create Log Directories

Execute these commands on all nodes

    mkdir -p $HIVE_LOG_DIR;
    chown -R $HIVE_USER:$HADOOP_GROUP $HIVE_LOG_DIR;
    chmod 755 -R $HIVE_LOG_DIR;

### Deploy the Configurations

Download the Hive configuration files from xxxx and change following parameters per your environment.
Look for all TODO’s in these files and change them to suit the environment.

#### hive-site.xml

| Parameter         | Example        |
|-------------------|----------------|
| javax.jdo.option.ConnectionURL        | jdbc:mysql://<mysql host name>:<port>/<database name>?createDatabaseIfNotExist=true
| javax.jdo.option.ConnectionUserName	| MySQL username
| javax.jdo.option.ConnectionPassword   | MySQL password
| hive.metastore.uris               | thrift://<metastore server full hostname>:9083


On all Hive hosts create the config directory, copy the config files and set the permissions

    mkdir -p $HIVE_CONF_DIR ;
    <copy the config files to $HIVE_CONF_DIR > 
    chown -R $HIVE_USER:$HADOOP_GROUP $HIVE_CONF_DIR/../  ;
    chmod -R 755 $HIVE_CONF_DIR/../
   
Download MySQL Connector
---

1. Download MySQL connector JAR.

    http://public-repo-1.hortonworks.com/HDP-1.0.0.12/repos/centos5/tars/mysql-connector-java-5.1.18.zip (for RHEL and CentOS 5)
    http://public-repo-1.hortonworks.com/HDP-1.0.0.12/repos/centos6/tars/mysql-connector-java-5.1.18.zip (for RHEL and CentOS 6)
    
2. Unzip the file.

3. Copy the JAR file

    <code>cp <download location>/mysql--connector--java--**--bin.jar /usr/lib/hive/lib/.</code>
    chmod 644 /usr/lib/hive/lib/*mysql*.jar


Validate Installation
----

### Start Metaservice

    /usr/lib/hive/bin/hive --service metastore

### Smoke Test Hive

    hive -e "show databases"
    hive -e "create table test(col1 int, col2 string)"
    hive -e "drop table test"


------

[Index](./index.md)
|
Prev: [Install Apache Pig](./apache-pig.md)
|
**Install Apache Hive and Apache HCatalog**
|
Next: [Install Apache Oozie](./apache-oozie.md)