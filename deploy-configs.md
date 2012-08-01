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

2. Modify the following parameters per your environment. Search for **TODO** in the configuration files for the properties to replace.


Modify Configuration Files
-----

### core-site.xml

| Parameter          | Example       | Description                                       |
|--------------------|---------------|-----------------------------|
| fs.default.name    | <code>hdfs://{namenode.full.hostname}:8020</code>  | Enter your NameNode hostname
| fs.checkpoint.dir  | <code>/grid/hadoop/hdfs/snn</code>  | Comma separated list of paths. Use the list of directories from <code>$FS_CHECKPOINT_DIR</code>

### hdfs-site.xml

| Parameter                          | Example          | Description                       |
|------------------------------------|------------------|-----------------------------------|
| dfs.name.dir                       | <code>/grid/hadoop/hdfs/nn,/grid1/hadoop/hdfs/nn</code> | Comma separated list of paths. Use the list of directories from <code>$DFS_NAME_DIR</code>
| dfs.data.dir                       | <code>/grid/hadoop/hdfs/dn,/grid1/hadoop/hdfs/dn</code> | Comma separated list of paths. Use the list of directories from <code>$DFS_DATA_DIR</code>
| dfs.http.address	                | <code>{namenode.full.hostname}:50070</code>   | Enter your NameNode hostname
| dfs.secondary.http.address         | <code>{secondary.namenode.full.hostname}:50090</code> | Enter your SecondaryNameNode hostname
| dfs.https.address                  | <code>{namenode.full.hostname}:50470</code>   | Enter your NameNode hostname

### mapred-site.xml

| Parameter                             | Example       | Description                         |
|---------------------------------------|---------------|---------------------------------------|
| mapred.job.tracker                    | <code>{jobtracker.full.hostname}:50300</code> | Enter your JobTracker hostname
| mapred.job.tracker.http.address       | <code>{jobtracker.full.hostname}:50030</code> | Enter your JobTracker hostname
| mapred.local.dir                       | <code>/grid/hadoop/mapred,/grid1/hadoop/mapred</code> | Comma separated list of paths. Use the list of directories from <code>$MAPREDUCE_LOCAL_DIR</code>
| mapreduce.tasktracker.group            | <code>hadoop</code> | Enter your group. Use the value of <code>$HADOOP_GROUP</code>
| mapreduce.history.server.http.address | <code>{jobtracker.full.hostname}:51111</code> | Enter your JobTracker hostname

### taskcontroller.cfg

| Parameter                             | Example        | Description                          |
|---------------------------------------|----------------|-------------------------------------|
| mapred.local.dir                         | <code>/grid/hadoop/mapred,/grid1/hadoop/mapred</code> | Comma separated list of paths. Use the list of directories from <code>$MAPREDUCE_LOCAL_DIR</code>


Copy Configuration Files
-----

On all hosts create the config directory, copy the config files and set the permissions.

    rm -r $HADOOP_CONF_DIR
    mkdir -p $HADOOP_CONF_DIR
    
    <copy the config files to $HADOOP_CONF_DIR>
    
    chmod a+x $HADOOP_CONF_DIR/health_check
    chown -R $HDFS_USER:$HADOOP_GROUP $HADOOP_CONF_DIR/..
    chmod -R 755 $HADOOP_CONF_DIR/..


------

[Index](./index.md)
|
Prev: [Install HDFS + MapReduce](./install-hdfs-mapreduce.md)
|
**Deploy Configurations**
|
Next: [Validate Installation](./validate-installation.md)