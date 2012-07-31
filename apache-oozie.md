[Index](./index.md)
/
**Install Apache Oozie**

------

Install Apache Oozie
=====

Apache Oozie is workflow scheduler.

* [Install Oozie RPMs](#install-oozie-rpms)
* [Validate Installation](#validate-installation)


Install Oozie RPMs
----

On all Oozie servers, install Oozie RPMs.

    yum -y install oozie

Set Directories and Permissions
----

### Create Log Directories

Execute these commands on all nodes

    mkdir -p $OOZIE_LOG_DIR;
    chown -R $OOZIE_USER:$HADOOP_GROUP $OOZIE_LOG_DIR;
    chmod 755 -R $OOZIE_LOG_DIR;

#### Deploy Configurations

Download the Oozie configuration files from xxxx and change following parameters per your environment.
Look for all TODO’s in these files and change them to suit the environment

oozie-site.xml

| Parameter         | Example        |
|-------------------|----------------|
| oozie.base.url    | http://{oozie.server.host.name}:11000/oozie
| oozie.service.StoreService.jdbc.url | jdbc:derby:<$OOZIE_DB_DIR>/${oozie.db.schema.name}-db;create=true


oozie-env.sh

| Parameter         | Example        |
|-------------------|----------------|
| JAVA_HOME	        | Point to 1.6.0_31 Java Home
| OOZIE_LOG         | $OOZIE_LOG_DIR
| OOZIE_DATA	    | $OOZIE_DATA_DIR

   

Validate Installation
----

### Smoke Test Oozie

TBD


------

[Index](./index.md)
|
Next: [Install Apache Hive and Apache HCatalog](./apache-hive-hcatalog.md)
|
**Install Apache Oozie**
|
Next: [Install Apache HBase and Apache Zookeeper](./apache-hbase-zookeeper.md)