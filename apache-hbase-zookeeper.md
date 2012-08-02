[Index](./index.md)
/
**Install Apache HBase and Apache Zookeeper**

------

Install Apache HBase and Apache Zookeeper
=====

Apache HBase is a NoSQL database and Apache Zookeeper performs cluster coordination.

* [Install RPMs](#install-rpms)
* [Set Directories and Permissions](#set-directories-and-permissions)
* [Validate Installation](#validate-installation)


Install RPMs
----

On all server nodes, install RPMs.

    yum -y install zookeeper hbase

Set Directories and Permissions
----

> For your convenience, we provide [directories.sh](./scripts/directories.sh) and [usersAndGroups.sh](./scripts/usersAndGroups.sh) scripts for setting
> environment parameters. We strongly suggest you edit and execute these scripts to prepare your environment.
> See [Prerequisites &gt; Set Environment Parameters](./prerequisites.md#set-environment-parameters) for more information.

### Create log directories

Execute these commands on all nodes:

    mkdir -p $HBASE_LOG_DIR;
    chown -R $HBASE_USER:$HADOOP_GROUP $HBASE_LOG_DIR;
    chmod -R 755 $HBASE_LOG_DIR;

    mkdir -p $HBASE_PID_DIR;
    chown -R $HBASE_USER:$HADOOP_GROUP $HBASE_PID_DIR;
    chmod -R 755 $HBASE_PID_DIR;

    mkdir -p $ZOOKEEPER_LOG_DIR;
    chown -R $ZOOKEEPER_USER:$HADOOP_GROUP $ZOOKEEPER_LOG_DIR;
    chmod -R 755 $ZOOKEEPER_LOG_DIR;

    mkdir -p $ZOOKEEPER_PID_DIR;
    chown -R $ZOOKEEPER_USER:$HADOOP_GROUP $ZOOKEEPER_PID_DIR;
    chmod -R 755 $ZOOKEEPER_PID_DIR;

    mkdir -p $ZOOKEEPER_DATA_DIR;
    chmod -R 755 $ZOOKEEPER_DATA_DIR;
    chown -R $ZOOKEEPER_USER:$HADOOP_GROUP $ZOOKEEPER_DATA_DIR

### Deploy the configurations

1. Download the HBase configuration files from [here](./conf/hbase) and the Zookepper configuration files from [here](./conf/zookeeper) to a temporary directory.

2. Modify the following parameters per your environment. Search for **TODO** in the configuration files for the properties to replace.

#### zoo.cfg

| Parameter         | Example        | Description |
|-------------------|----------------|-----------------------|
| server.1	        | <code>{zookeeper.server1.full.hostname}:2888:3888</code> | Server 1
| server.2          | <code>{zookeeper.server2.full.hostname}:2888:3888</code> | Server 2
| server.3          | <code>{zookeeper.server3.full.hostname}:2888:3888</code> | Server 3

#### hbase-site.xml

| Parameter         | Example        | Description |
|-------------------|----------------|------------------------|
| hbase.rootdir     | <code>hdfs://{hbase.namenode.full.hostname}:8020/apps/hbase/data</code> | HBase name node server
| hbase.master.info.bindAddress | {hbase.master.full.hostname} | HBase master server
| hbase.zookeeper.quorum	    | <code>server1.full.hostname,server1.full.hostname</code> | Comma separated list of Zookeeper servers (match to what is specified in <code>zoo.cfg</code> but without portnumbers)

On all hosts create the config directory, copy the config files and set the permissions:

    rm -r $HBASE_CONF_DIR ;
    mkdir -p $HBASE_CONF_DIR ;

    <copy the config files to $HBASE_CONF_DIR > 

    chmod a+x $HBASE_CONF_DIR/health_check ;
    chown -R $HBASE_USER:$HADOOP_GROUP $HBASE_CONF_DIR/../  ;
    chmod -R 755 $HBASE_CONF_DIR/../

    rm -r $$ZOOKEEPER_CONF_DIR ;
    mkdir -p $ZOOKEEPER_CONF_DIR ;
    
    <copy the config files to $ZOOKEEPER_CONF_DIR > 
    
    chmod a+x $ZOOKEEPER_CONF_DIR/health_check ;
    chown -R $ZOOKEEPER_USER:$HADOOP_GROUP $ZOOKEEPER_CONF_DIR/../  ;
    chmod -R 755 $ZOOKEEPER_CONF_DIR/../
   

Validate Installation
----

### Start HBase and Zookeeper

1. Execute these commands from Zookeeper nodes:

        <login as $ZOOKEEPER_USER>
        /usr/lib/zookeeper/bin/zkServer.sh start $ZOOKEEPER_CONF_DIR/zoo.cfg

2. Execute these commands from HBase Master:

        <login as $HBASE_USER>
        /usr/lib/hbase/bin/hbase-daemon.sh --config $HBASE_CONF_DIR start master

3. Execute these commands from all region server nodes:

        <login as $HBASE_USER>
        /usr/lib/hbase/bin/hbase-daemon.sh --config $HBASE_CONF_DIR start regionserver

### Smoke Test

    echo "echo status | hbase shell" > /tmp/hbasesmoke.sh 
    echo "echo disable \\'\''usertable\\'\'' | hbase shell" >> /tmp/hbasesmoke.sh
    echo "echo drop \\'\''usertable\\'\'' | hbase shell" >> /tmp/hbasesmoke.sh
    echo "echo create \\'\''usertable\\'\'', \\'\''family\\'\'' | hbase shell" >> /tmp/hbasesmoke.sh 
    echo "echo put \\'\''usertable\\'\'', \\'\''row01\\'\'', \\'\''family:col01\\'\'', \\'\''value1\\'\'' | hbase shell" >> /tmp/hbasesmoke.sh
    echo "echo scan \\'\''usertable\\'\'' | hbase shell" >> /tmp/hbasesmoke.sh 
    sh /tmp/hbasesmoke.sh

------

[Index](./index.md)
|
Prev: [Install Apache Oozie](./apache-oozie.md)
|
**Install Apache HBase and Apache Zookeeper**
|
Next: [Install Apache Sqoop](./apache-sqoop.md)
