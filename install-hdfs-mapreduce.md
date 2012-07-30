Back to [Index](./index.md)

Install HDFS + MapReduce
==========

The following instructions describe how to install the Hadoop Core components, which include HDFS and MapReduce.

Set Default File and Directory Permissions
-------

Set the default file and directory permissions to 0022 (022). This is typically the default for most Linux distributions.
Use the '''umask''' command to confirm and set as necessary. Be sure umask is set for all terminal session that you will use during installation.

Configure Repository
-------

HDP Repository

/etc/yum.repos.d/hdp.repo

<pre>
[HDP-1.0.0.12]
name=Hortonworks Data Platform Version - HDP-1.0.0.12
baseurl=http://public-repo-1.hortonworks.com/HDP-1.0.0.12/repos/centos5
gpgcheck=0
enabled=1
priority=1
</pre>

Configuring the Local Repository (optional)
---------
TBD – get from existing docs
http://docs.hortonworks.com/CURRENT/index.htm#Deploying_Hortonworks_Data_Platform/Using_HMC/Getting_Ready_To_Install/Optional_Configure_the_Local_yum_Repository.htm

Install Hadoop RPMs (All Nodes)
---------

<pre>
yum -y install hadoop hadoop-libhdfs hadoop-libhdfs.i386 hadoop-native hadoop-native.i386 hadoop-pipes hadoop-pipes.i386 hadoop-sbin.i386
</pre>


Install OpenSSL Libraries
---------

<pre>
yum -y install openssl openssl.i386
</pre>

Install Compression Libraries (All Nodes)
----------

### Install Snappy

1. Install Snappy compression/decompression library.

<pre>
yum -y install snappy snappy.i386
</pre>

2. Create symbolic links.

<pre>
ln -sf /usr/lib64/libsnappy.so.1 /usr/lib/hadoop/lib/native/Linux-amd64-64/.
ln -sf /usr/lib/libsnappy.so.1 /usr/lib/hadoop/lib/native/Linux-i386-32/.
</pre>

### Install LZO

1. Install LZO compression library.

<pre>
yum -y install lzo
</pre>

2. Download Hadoop LZO package to LZO_DIR

NEED INSTRUCTIONS

3. Copy LZO JAR to Hadoop.

<pre>
cp -f $LZO_DIR/hadoop-lzo-0.5.0.jar /usr/lib/hadoop/lib/.
</pre>

4. Replace Hadoop GPL compression with LZO library.

<pre>
rm –f /usr/lib/hadoop/lib/native/Linux-i386-32/libgplcompression*
rm –f /usr/lib/hadoop/lib/native/ Linux-amd64-64/libgplcompression*
mv $LZO_DIR/lib/native/Linux-i386-32/libgplcompression* /usr/lib/hadoop/lib/native/Linux-i386-32/.
mv $LZO_DIR/hadoop-lzo-0.5.0/lib/native/Linux-amd64-64/libgplcompression* /usr/lib/hadoop/lib/native/Linux-amd64-64/.
</pre>

Directories and Permissions
----------

Create directory and configure ownership and permissions on the appropriate hosts as described below.

<pre>
Note: if any of these directories exist, we recommend deleting and recreating.
</pre>

### Create NameNode directories

Execute these commands the Master Node host that will run the NameNode service.

<pre>
mkdir -p $DFS_NAME_DIR
chown -R $HDFS_USER:$HADOOP_GROUP $DFS_NAME_DIR
chmod -R 755 $DFS_NAME_DIR
</pre>

### Create SecondaryNameNode directories

Execute these commands on all nodes, which potentially can run the secondary name node service (Typically all master nodes)

<pre>
mkdir -p $FS_CHECKPOINT_DIR ;
chown -R $HDFS_USER:$HADOOP_GROUP $FS_CHECKPOINT_DIR;
chmod -R 755 $FS_CHECKPOINT_DIR
</pre>

### Create DataNode and MapReduce local directories

Execute these commands on all data nodes.

<pre>
mkdir -p $DFS_DATA_DIR ;
chown -R $HDFS_USER:$HADOOP_GROUP $DFS_DATA_DIR;
chmod -R 755 $DFS_DATA_DIR

mkdir -p $MAPREDUCE_LOCAL_DIR
chown -R $MAPRED_USER:$HADOOP_GROUP $MAPREDUCE_LOCAL_DIR
chmod -R 755 $MAPREDUCE_LOCAL_DIR
</pre>

### Create log and pid directories

Execute these commands on all nodes.

<pre>
mkdir -p $HDFS_LOG_DIR;
chown -R $HDFS_USER:$HADOOP_GROUP $HDFS_LOG_DIR;
chmod 755 -R $HDFS_LOG_DIR;

mkdir -p $MAPRED_LOG_DIR;
chown -R $MAPRED_USER:$HADOOP_GROUP $MAPRED_LOG_DIR;
chmod 755 -R $MAPRED_LOG_DIR;

mkdir -p $HDFS_PID_DIR ;
chown -R $HDFS_USER:$HADOOP_GROUP $HDFS_PID_DIR;
chmod 755 -R $HDFS_PID_DIR

mkdir -p $MAPRED_PID_DIR ;
chown -R $MAPRED_USER:$HADOOP_GROUP $MAPRED_PID_DIR;
chmod 755 -R $MAPRED_PID_DIR
</pre>
