[Index](./index.md)
/
**Install Apache Pig**

------

Install Apache Pig
=====

Apache Pig is a scripting platform for writing MapReduce applications.

* [Install Pig RPMs](#install-pig-rpms)
* [Set Directories and Permissions](#set-directories-and-permissions)
* [Copy Configuration Files](#copy-configuration-files)
* [Validate Installation](#validate-installation)


Install Pig RPMs
----

On all hosts from where Pig programs will be executed, install RPMs.

    yum -y install pig

Set Directories and Permissions
----

### Create Log Directories

Execute these commands on all nodes:

    mkdir -p $PIG_LOG_DIR;
    chown -R $PIG_USER:$HADOOP_GROUP $PIG_LOG_DIR;
    chmod 755 -R $PIG_LOG_DIR;

Copy Configuration Files
----

On all Pig hosts, create the config directory, copy the config files and set the permissions:

    mkdir -p $PIG_CONF_DIR ;

    <copy the config files to $PIG_CONF_DIR > 

    chown -R $PIG_USER:$HADOOP_GROUP $PIG_CONF_DIR ;
    chmod -R 755 $PIG_CONF_DIR
   

Validate Installation
----

### Smoke Test Pig

    hadoop dfs -rmr passwd
    hadoop dfs -copyFromLocal /etc/passwd passwd 
    hadoop dfs -ls 

    echo "A = load 'passwd' using PigStorage(':'); " > /tmp/id.pig
    echo "B = foreach A generate \$0 as id; store B into '/tmp/id.out'; " >> /tmp/id.pig

    pig -l /tmp/pig.log /tmp/id.pig



------

[Index](./index.md)
|
**Install Apache Pig**
|
Next: [Install Apache Hive and Apache HCatalog](./apache-hive-hcatalog.md)