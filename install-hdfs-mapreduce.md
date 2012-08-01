[Index](./index.md)
/
**Install HDFS + MapReduce**

------

Install HDFS + MapReduce
==========

The following instructions describe how to install the Hadoop Core components, which include HDFS and MapReduce.

* [Set Default File and Directory Permissions](#set-default-file-and-directory-permissions)
* [Configure HDP Repository](#configure-hdp-repository)
* [Install Hadoop RPMs (All Nodes)](#install-hadoop-repms-all-nodes)
* [Install OpenSSL Libraries](#install-openssl-libraries)
* [Install Compression Libraries (All Nodes)](#install-compression-libraries-all-nodes)
* [Create Directories](#create-directories)


Set Default File and Directory Permissions
-------

Set the default file and directory permissions to 0022 (022). This is typically the default for most Linux distributions.
Use the <code>umask</code> command to confirm and set as necessary. Be sure umask is set for all terminal session that you will use during installation.

Configure Repository
-------

The standard HDP install requires access to the Internet to fetch software from a remote repository. You can setup access to the [Remote Repository](#use-remote-repository).

In some cases, adequate bandwidth is not available and you want to prevent downloading from the remote repository over and over again. Other times, Internet access is not available at all from the hosts in your cluster. In these situations, you must set up a version of the repository that your hosts can access locally. This is called a [Local Yum Repository](#use-local-yum-repository-optional).

### Use Remote Repository

1. Download the yum repo configuration file <code>hdp.repo</code>.

        [For RHEL and CentOS 5]
        wget http://public-repo-1.hortonworks.com/HDP-1.0.1.14/repos/centos5/hdp.repo

        [For RHEL and CentOS 6]
        wget http://public-repo-1.hortonworks.com/HDP-1.0.1.14/repos/centos6/hdp.repo

2. On all hosts, copy the <code>hdp.repo</code> file you just downloaded to your yum repo list.

        cp ./hdp.repo /etc/yum.repos.d/hdp.repo

3. Confirm the HDP repository is configured, check the repo list.

        yum repolist
        
        Loaded plugins: fastestmirror, security
        Loading mirror speeds from cached hostfile
         * base: mirrors.cat.pdx.edu
         * extras: linux.mirrors.es.net
         * updates: mirrors.usc.edu
        repo id            repo name                                              status
        HDP-1.0.1.14       Hortonworks Data Platform Version - HDP-1.0.1.14          64
        HDP-UTILS-1.0.1.14 Hortonworks Data Platform Utils Version - HDP-UTILS-1.    51

### Use Local Yum Repository (optional)

Information on setting up the Local Yum Repository can be found in the [Hortonworks Documentaiton](http://docs.hortonworks.com/CURRENT/index.htm#Deploying_Hortonworks_Data_Platform/Using_HMC/Configuring_Local_Mirror_Repository/Configuring_a_Local_Mirror.htm).


Install Hadoop RPMs
---------

       yum -y install hadoop hadoop-libhdfs hadoop-libhdfs.i386 mysql-connector-java hadoop-native hadoop-native.i386 hadoop-pipes hadoop-pipes.i386 hadoop-sbin.i386


Install Compression Libraries
----------

### Install Snappy

1. Install Snappy compression/decompression library.

        yum -y install snappy snappy.i386

2. Create symbolic links.

        ln -sf /usr/lib64/libsnappy.so.1 /usr/lib/hadoop/lib/native/Linux-amd64-64/.
        ln -sf /usr/lib/libsnappy.so.1 /usr/lib/hadoop/lib/native/Linux-i386-32/.

### Install LZO

1. Install LZO compression library.

        yum -y install hadoop-lzo lzo

Create Directories
----------

Create directories and configure ownership + permissions on the appropriate hosts as described below.

<pre>
Note: if any of these directories exist, we recommend deleting and recreating.
</pre>

<pre>
For your convenience, we provide <a href="./scripts/directories.sh">directories.sh</a> and <a href="./scripts/directories.sh">usersAndGroups.sh</a> scripts for setting environment parameters.
We strongly suggest you edit and execute this script to fit your environment.
See <a href="./prerequisites.md#set-environment-parameters">Prerequisites &gt; Set Environment Parameters</a> for more information.
</pre>

### Create NameNode directories

Execute these commands the Master Node that will run the NameNode service.

        mkdir -p $DFS_NAME_DIR
        chown -R $HDFS_USER:$HADOOP_GROUP $DFS_NAME_DIR
        chmod -R 755 $DFS_NAME_DIR

### Create SecondaryNameNode directories

Execute these commands on all nodes, which potentially can run the SecondaryNameNode service. Typically all Master Nodes.

        mkdir -p $FS_CHECKPOINT_DIR
        chown -R $HDFS_USER:$HADOOP_GROUP $FS_CHECKPOINT_DIR
        chmod -R 755 $FS_CHECKPOINT_DIR

### Create DataNode and MapReduce local directories

Execute these commands on all DataNodes.

        mkdir -p $DFS_DATA_DIR;
        chown -R $HDFS_USER:$HADOOP_GROUP $DFS_DATA_DIR;
        chmod -R 755 $DFS_DATA_DIR;

        mkdir -p $MAPREDUCE_LOCAL_DIR;
        chown -R $MAPRED_USER:$HADOOP_GROUP $MAPREDUCE_LOCAL_DIR;
        chmod -R 755 $MAPREDUCE_LOCAL_DIR;

### Create log and pid directories

Execute these commands on all nodes.

        mkdir -p $HDFS_LOG_DIR;
        chown -R $HDFS_USER:$HADOOP_GROUP $HDFS_LOG_DIR;
        chmod -R 755 $HDFS_LOG_DIR;

        mkdir -p $MAPRED_LOG_DIR;
        chown -R $MAPRED_USER:$HADOOP_GROUP $MAPRED_LOG_DIR;
        chmod -R 755 $MAPRED_LOG_DIR;

        mkdir -p $HDFS_PID_DIR;
        chown -R $HDFS_USER:$HADOOP_GROUP $HDFS_PID_DIR;
        chmod -R 755 $HDFS_PID_DIR

        mkdir -p $MAPRED_PID_DIR;
        chown -R $MAPRED_USER:$HADOOP_GROUP $MAPRED_PID_DIR;
        chmod -R 755 $MAPRED_PID_DIR;




------

[Index](./index.md)
|
Prev: [Prerequisites](./prerequisites.md)
|
**Install HDFS + MapReduce**
|
Next: [Deploy Configurations](./deploy-configs.md)