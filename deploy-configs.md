[Index](./index.md) / **Deploy Configurations**

------

Deploy Configurations
==========

* [Download Configuration Files](#download-configuration-files)
* [Modify Configuration Files](#modify-configuration-files)
* [Copy Configuration Files](#copy-configuration-files)

Download Configuration Files
-----

1. Download the Hadoop configuration files from [here](./conf) to a temporary directory.

2. Modify the following parameters per your environment. You can search for *TODO* in the configuration files for the properties to replace.


Modify Configuration Files
-----

### core-site.xml

| Parameter          | Example       | Comments                                       |
|--------------------|---------------|-----------------------------|
| fs.default.name    | <code>hdfs://{namenode.full.hostname}:8020</code>  | Enter your NameNode hostname
| fs.checkpoint.dir  | <code>/grid/hadoop/hdfs/snn</code>  | this is <code>$FS_CHECKPOINT_DIR</code>

### hdfs-site.xml

| Parameter                          | Example                                              |
|------------------------------------|------------------------------------------------------|
| dfs.name.dir                       | Comma separated list of paths such as <code>/grid/hadoop/hdfs/nn</code>, <code>/grid1/hadoop/hdfs/nn</code>
| dfs.http.address	                | {namenode.full.hostname}:50070                       |
| dfs.secondary.http.address         | {secondary.namenode.full.hostname}:50090             |
| dfs.https.address                  | {namenode.full.hostname}:50470                       |
| dfs.data.dir                       | Comma separated list of paths such as /grid1/hadoop/hdfs/dn,/grid2/hadoop/hdfs/dn,/grid3/hadoop/hdfs/dn,/grid4/hadoop/hdfs/dn,/grid5/hadoop/hdfs/dn,/grid6/hadoop/hdfs/dn

### mapred-site.xml

| Parameter                             | Example                                              |
|---------------------------------------|------------------------------------------------------|
| mapred.job.tracker                    | {jobtracker.full.hostname}:50300
| mapred.job.tracker.http.address       | {jobtracker.full.hostname}:50030
| mapreduce.history.server.http.address | {jobtracker.full.hostname}:51111
| mapred.local.dir	                   | Comma separated list of paths such as /grid1/hadoop/mapred,/grid2/hadoop/mapred, /grid3/hadoop/mapred,/grid4/hadoop/mapred, /grid5/hadoop/mapred,/grid6/hadoop/mapred,

### hadoop-env.sh

| Parameter                             | Example                                              |
|---------------------------------------|------------------------------------------------------|
| JAVA_HOME                             | Point to 1.6.-0_31 java home
| HADOOP_LOG_DIR                        | $HADOOP_LOG_DIR/$USER
| HADOOP_PID_DIR                        | $HADOOP_PID_DIR/$USER


Copy Configuration Files
-----

On all hosts create the config directory, copy the config files and set the permissions.

    mkdir -p $HADOOP_CONF_DIR
    
    {copy the config xml files to $HADOOP_CONF_DIR}
    
    chmod a+x $HADOOP_CONF_DIR/health_check
    chown -R $HDFS_USER:$HADOOP_GROUP $HADOOP_CONF_DIR/../
    chmod -R 755 $HADOOP_CONF_DIR/../


------

[Index](./index.md)
|
Prev: [Install HDFS + MapReduce](./install-hdfs-mapreduce.md)
|
**Deploy Configurations**
|
Next: [Validate Installation](./validate-installation.md)