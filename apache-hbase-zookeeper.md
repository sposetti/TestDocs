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

### Create log directories

Execute these commands on all nodes:

    mkdir -p $HBASE_LOG_DIR;
    chown -R $HBASE_USER:$HADOOP_GROUP $HBASE_LOG_DIR;
    chmod 755 -R $HBASE_LOG_DIR;

    mkdir -p $ZOOKEEPER_LOG_DIR;
    chown -R $ZOOKEEPER_USER:$HADOOP_GROUP $ZOOKEEPER_LOG_DIR;
    chmod 755 -R $ZOOKEEPER_LOG_DIR;

    mkdir -p $HBASE_PID_DIR;
    chown -R $HBASE_USER:$HADOOP_GROUP $HBASE_PID_DIR;
    chmod 755 -R $HBASE_PID_DIR;

    mkdir -p $ZOOKEEPER_PID_DIR;
    chown -R $ZOOKEEPER_USER:$HADOOP_GROUP $ZOOKEEPER_PID_DIR;
    chmod 755 -R $ZOOKEEPER_PID_DIR;

    mkdir -p $ZOOKEEPER_DATA_DIR;
    chmod 755 -R $ZOOKEEPER_DATA_DIR;
    chown -R $ZOOKEEPER_USER:$HADOOP_GROUP $ZOOKEEPER_DATA_DIR

### Deploy the configurations

Download the pig configuration files from xxxx and change following parameters per your environment.
Look for all TODO’s in these files and change them to suit the environment

#### zoo.cfg

| Parameter         | Example        |
|-------------------|----------------|
| dataDir           | $ZOOKEEPER_DATA_DIR>
| server.1	        | zookeeper server 1 full host name>:2888:3888
| server.2          | zookeeper server 2 full host name>:2888:3888
| server.3          | zookeeper server 3 full host name>:2888:3888

#### zookeeper-env.sh

| Parameter         | Example        |
|-------------------|----------------|
| ZOO_LOG_DIR	    | $ZOOKEEPER_LOG_DIR
| ZOOPIDFILE	    | $ZOOKEEPER_PID_DIR/zookeeper_server.pid

#### hbase-site.xml

| Parameter         | Example        |
|-------------------|----------------|
| hbase.rootdir     | hdfs://{namenode.full.hostname}:8020/apps/hbase/data
| hbase.master.info.bindAddress | {hbase.master.full.hostname}
| hbase.zookeeper.quorum	    | Comma separated list of zookeeper servers (match to what is specified in zoo.cfg but without portnumbers)
| hbase.tmp.dir                 | $HBASE_LOG_DIR

#### hbase-env.sh

| Parameter         | Example        |
|-------------------|----------------|
| JAVA_HOME         | Point to 1.6.-0_31 Java Home
| HBASE_LOG_DIR     | $HBASE_LOG_DIR
| HBASE_PID_DIR     | $HBASE_PID_DIR


On all hosts create the config directory, copy the config files and set the permissions:

    mkdir -p $HBASE_CONF_DIR ;
    <copy the config files to $HBASE_CONF_DIR > 
    chmod a+x $HBASE_CONF_DIR/health_check ;
    chown -R $HBASE_USER:$HADOOP_GROUP $HBASE_CONF_DIR/../  ;
    chmod -R 755 $HBASE_CONF_DIR/../

    mkdir -p $ZOOKEEPER_CONF_DIR ;
    <copy the config files to $ZOOKEEPER_CONF_DIR > 
    chmod a+x $ZOOKEEPER_CONF_DIR/health_check ;
    chown -R $ZOOKEEPER_USER:$HADOOP_GROUP $ZOOKEEPER_CONF_DIR/../  ;
    chmod -R 755 $ZOOKEEPER_CONF_DIR/../
   

Validate Installation
----

### Start HBase and Zookeeper

Execute these commands from Zookeeper nodes:

    <login as $ZOOKEEPER_USER>
    /usr/lib/zookeeper/bin/zkServer.sh start $ZOOKEEPER_CONF_DIR/zoo.cfg

Execute these commands from HBase Master:

    <login as $HBASE_USER>
    /usr/lib/hbase/bin/hbase-daemon.sh --config $HBASE_CONF_DIR start master

Execute these commands from all region server nodes:

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
Next: [Install Apache Oozie](./apache-oozie.md)
|
**Install Apache HBase and Apache Zookeeper**
