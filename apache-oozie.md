[Index](./index.md)
/
**Install Apache Oozie**

------

Install Apache Oozie
=====

Apache Oozie is workflow scheduler.

* [Install Oozie RPMs](#install-oozie-rpms)
* [Set Directories and Permissions](#set-directories-and-permissions)
* [Modify Configuration Files](#modify-configuration-files)
* [Copy Configuration Files](#copy-configuration-files)
* [Validate Installation](#validate-installation)


Install Oozie RPMs
----

1. On Oozie server, install the necessary RPMs.

        yum -y install oozie extjs

2. Add the ExtJS library to the Oozie application.

        /usr/lib/oozie/bin/oozie-setup.sh -hadoop 0.20.200  /usr/lib/hadoop -extjs /tmp/HDP-oozie/ext-2.2.zip

Set Directories and Permissions
----

> For your convenience, we provide [directories.sh](./scripts/directories.sh) and [usersAndGroups.sh](./scripts/usersAndGroups.sh) scripts for setting
> environment parameters. We strongly suggest you edit and execute these scripts to prepare your environment.
> See [Prerequisites &gt; Set Environment Parameters](./prerequisites.md#set-environment-parameters) for more information.

### Create Log Directories

Execute these commands on your Oozie server.

    mkdir -p $OOZIE_LOG_DIR;
    chown -R $OOZIE_USER:$HADOOP_GROUP $OOZIE_LOG_DIR;
    chmod -R 755 $OOZIE_LOG_DIR;

    mkdir -p $OOZIE_PID_DIR;
    chown -R $OOZIE_USER:$HADOOP_GROUP $OOZIE_PID_DIR;
    chmod -R 755 $OOZIE_PID_DIR;

    mkdir -p $OOZIE_TMP_DIR;
    chown -R $OOZIE_USER:$HADOOP_GROUP $OOZIE_TMP_DIR;
    chmod -R 755 $OOZIE_TMP_DIR;

Modify Configuration Files
----

1. Download the Hadoop configuration files from [here](./conf/oozie) to a temporary directory.

2. Modify the following parameters per your environment. Search for **TODO** in the configuration files for the properties to replace.

#### oozie-site.xml

| Parameter         | Example        | Description            |
|-------------------|----------------|-------------------- 
| oozie.base.url    | <code>http://{oozie.full.hostname}:11000/oozie</code> | Enter your Oozie server hostname
| oozie.service.StoreService.jdbc.url | <code>jdbc:derby:/var/db/oozie/${oozie.db.schema.name}-db;create=true</code> | Use value from <code>$OOZIE_DATA_DIR</code>


#### oozie-env.sh

| Parameter         | Example        | Description            |
|-------------------|----------------|---------------------------|
| OOZIE_LOG_DIR     | <code>/var/log/oozie</code> | Use value from <code>$OOZIE_LOG_DIR</code>
| OOZIE_PID_DIR     | <code>/var/run/oozie</code> | Use value from <code>$OOZIE_PID_DIR</code>
| OOZIE_DATA_DIR    | <code>/var/db/oozie</code> | Use value from <Code>$OOZIE_DATA_DIR</code>

Copy Configuration Files
----

On your Oozie server, create the config directory, copy the config files and set the permissions:

    rm -r $OOZIE_CONF_DIR ;
    mkdir -p $OOZIE_CONF_DIR ;

    <copy the config files to $OOZIE_CONF_DIR>

    chown -R $OOZIE_USER:$HADOOP_GROUP $OOZIE_CONF_DIR/../ ;
    chmod -R 755 $OOZIE_CONF_DIR/../ ;


Validate Installation
----

### Start Oozie

1. Run the following command to start the Oozie server.

        <login as $OOZIE_USER>
        /usr/lib/oozie/bin/oozie-start.sh

### Stop Oozie

1. Run the following command to stop the Oozie server.

        <login as $OOZIE_USER>
        /usr/lib/oozie/bin/oozie-stop.sh

### Smoke Test Oozie

1. Confirm you can browse to the Oozie server.

        http://{oozie.full.hostname}:11000/oozie

------

[Index](./index.md)
|
Next: [Install Apache Hive and Apache HCatalog](./apache-hive-hcatalog.md)
|
**Install Apache Oozie**
|
Next: [Install Apache HBase and Apache Zookeeper](./apache-hbase-zookeeper.md)