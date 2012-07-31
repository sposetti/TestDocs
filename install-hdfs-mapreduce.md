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

Configure HDP Repository
-------

### Use Hosted HDP Repository

<pre>/etc/yum.repos.d/hdp.repo</pre>

<pre>
[HDP-1.0.0.12]
name=Hortonworks Data Platform Version - HDP-1.0.0.12
baseurl=http://public-repo-1.hortonworks.com/HDP-1.0.0.12/repos/centos5
gpgcheck=0
enabled=1
priority=1
</pre>

### Use Local HDP Repository (optional)
TBD – get from existing docs
http://docs.hortonworks.com/CURRENT/index.htm#Deploying_Hortonworks_Data_Platform/Using_HMC/Getting_Ready_To_Install/Optional_Configure_the_Local_yum_Repository.htm

Install Hadoop RPMs (All Nodes)
---------

       yum -y install hadoop hadoop-libhdfs hadoop-libhdfs.i386 hadoop-native hadoop-native.i386 hadoop-pipes hadoop-pipes.i386 hadoop-sbin.i386


Install OpenSSL Libraries
---------

       yum -y install openssl

Install Compression Libraries (All Nodes)
----------

### Install Snappy

1. Install Snappy compression/decompression library.

        yum -y install snappy snappy.i386

2. Create symbolic links.

        ln -sf /usr/lib64/libsnappy.so.1 /usr/lib/hadoop/lib/native/Linux-amd64-64/.
        ln -sf /usr/lib/libsnappy.so.1 /usr/lib/hadoop/lib/native/Linux-i386-32/.

### Install LZO

1. Install LZO compression library.

        yum -y install lzo

2. Download Hadoop LZO package

    <code>http://public-repo-1.hortonworks.com/HDP-1.0.0.12/repos/centos5/tars/hadoop-lzo-0.5.0.tar.gz</code> (for RHEL / CentOS 5)
    <code>http://public-repo-1.hortonworks.com/HDP-1.0.0.12/repos/centos6/tars/hadoop-lzo-0.5.0.tar.gz</code> (for RHEL / CentOS 6)

3. Extract the LZO package. This will be the <code>$LZO_DIR</code> directory.

        tar zxvf hadoop-lzo-0.5.0.tar.gz

4. Copy LZO JAR to Hadoop.

        cp -f $LZO_DIR/hadoop-lzo-0.5.0.jar /usr/lib/hadoop/lib/.

5. Replace Hadoop GPL compression with LZO library.

        rm -f /usr/lib/hadoop/lib/native/Linux-i386-32/libgplcompression*
        rm -f /usr/lib/hadoop/lib/native/Linux-amd64-64/libgplcompression*
        mv $LZO_DIR/lib/native/Linux-i386-32/libgplcompression* /usr/lib/hadoop/lib/native/Linux-i386-32/.
        mv $LZO_DIR/lib/native/Linux-amd64-64/libgplcompression* /usr/lib/hadoop/lib/native/Linux-amd64-64/.

Create Directories
----------

Create directories and configure ownership + permissions on the appropriate hosts as described below.

<pre>
Note: if any of these directories exist, we recommend deleting and recreating.
</pre>

### Create NameNode directories

Execute these commands the Master Node host that will run the NameNode service.

        mkdir -p $DFS_NAME_DIR
        chown -R $HDFS_USER:$HADOOP_GROUP $DFS_NAME_DIR
        chmod -R 755 $DFS_NAME_DIR

### Create SecondaryNameNode directories

Execute these commands on all nodes, which potentially can run the secondary name node service (Typically all master nodes)

        mkdir -p $FS_CHECKPOINT_DIR
        chown -R $HDFS_USER:$HADOOP_GROUP $FS_CHECKPOINT_DIR
        chmod -R 755 $FS_CHECKPOINT_DIR

### Create DataNode and MapReduce local directories

Execute these commands on all data nodes.

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
        chmod 755 -R $HDFS_LOG_DIR;

        mkdir -p $MAPRED_LOG_DIR;
        chown -R $MAPRED_USER:$HADOOP_GROUP $MAPRED_LOG_DIR;
        chmod 755 -R $MAPRED_LOG_DIR;

        mkdir -p $HDFS_PID_DIR;
        chown -R $HDFS_USER:$HADOOP_GROUP $HDFS_PID_DIR;
        chmod 755 -R $HDFS_PID_DIR

        mkdir -p $MAPRED_PID_DIR;
        chown -R $MAPRED_USER:$HADOOP_GROUP $MAPRED_PID_DIR;
        chmod 755 -R $MAPRED_PID_DIR;




------

[Index](./index.md)
|
Prev: [Prerequisites](./prerequisites.md)
|
**Install HDFS + MapReduce**
|
Next: [Deploy Configurations](./deploy-configs.md)