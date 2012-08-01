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

On Oozie server, install the necessary RPMs.

    yum -y install oozie

Set Directories and Permissions
----

### Create Log Directories

Execute these commands on your Oozie server.

    mkdir -p $OOZIE_LOG_DIR;
    chown -R $OOZIE_USER:$HADOOP_GROUP $OOZIE_LOG_DIR;
    chmod 755 -R $OOZIE_LOG_DIR;

#### Deploy Configurations

Download the Oozie configuration files from xxxx and change following parameters per your environment.
Look for all TODO’s in these files and change them to suit the environment

#### oozie-site.xml

| Parameter         | Example        | Description            |
|-------------------|----------------|-------------------- 
| oozie.base.url    | <code>http://{oozie.full.hostname}:11000/oozie</code> | Enter your Oozie server hostname
| oozie.service.StoreService.jdbc.url | <code>jdbc:derby:/var/db/oozie/${oozie.db.schema.name}-db;create=true</code> | Use value from <code>$OOZIE_DATA_DIR</code>


#### oozie-env.sh

| Parameter         | Example        | Description            |
|-------------------|----------------|---------------------------|
| JAVA_HOME         | <code>/usr/java/default</code> | Location of JDK 1.6 update 31 Java Home
| OOZIE_LOG_DIR     | <code>/var/log/oozie</code> | Use value from <code>$OOZIE_LOG_DIR</code>
| OOZIE_PID_DIR     | <code>/var/run/oozie</code> | Use value from <code>$OOZIE_PID_DIR</code>
| OOZIE_DATA_DIR    | <code>/var/db/oozie</code> | Use value from <Code>$OOZIE_DATA_DIR</code>

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