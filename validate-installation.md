[Index](./index.md) / **Validate Installation**

------

Validate Installation
==========

* [Format and Start HDFS](#format-and-start-hdfs)
* [Smoke Test HDFS](#smoke-test-hdfs)
* [Start MapReduce](#start-mapreduce)
* [Smoke Test MapReduce](#smoke-test-mapreduce)


Format and Start HDFS
-----

1. Execute these commands on the NameNode:

        <login as $HDFS_USER>
        /usr/lib/hadoop/bin/hadoop namenode -format
        /usr/lib/hadoop/bin/hadoop-daemon.sh --config $HADOOP_CONF_DIR start namenode

2. Execute these commands from SecondaryNameNode:

        <login as $HDFS_USER>
        /usr/lib/hadoop/bin/hadoop-daemon.sh --config $HADOOP_CONF_DIR start secondarynamenode

3. Execute these commands from all DataNodes:

        <login as $HDFS_USER>
        /usr/lib/hadoop/bin/hadoop-daemon.sh --config $HADOOP_CONF_DIR start datanode

Smoke Test HDFS
----

1. Test you can reach the NameNode server with your browser.

        http://{your.namenode.server}:50070
        
2. Test you can list the files

        <login as $HDFS_USER>
        /usr/lib/hadoop/bin/hadoop dfs -ls 

3. Test copying a file into HDFS.

        <login as $HDFS_USER>
        /usr/lib/hadoop/bin/hadoop dfs -copyFromLocal /etc/passwd passwd-test
        /usr/lib/hadoop/bin/hadoop dfs -ls 

4. Test you can browse HDFS.

        http://{your.datanode.server}:50075/browseDirectory.jsp?dir=/


Start MapReduce
----

1. Execute these commands from job tracker

        <login as HDFS user>
        /usr/lib/hadoop/bin/hadoop fs -mkdir /mapred
        /usr/lib/hadoop/bin/hadoop fs -chown -R mapred /mapred

        <login as $MAPRED_USER>
        /usr/lib/hadoop/bin/hadoop-daemon.sh --config $HADOOP_CONF_DIR start jobtracker

2. Execute these commands from job history server

        <login as $MAPRED_USER>
        /usr/lib/hadoop/bin/hadoop-daemon.sh --config $HADOOP_CONF_DIR start historyserver

3. Execute these commands from all task tracker nodes

        <login as $MAPRED_USER>
        /usr/lib/hadoop/bin/hadoop-daemon.sh --config $HADOOP_CONF_DIR start tasktracker

Smoke Test MapReduce
----

1. Test you can browse your Job Tracker.

        http://{your.jobtracker.server}:50030/

2. Smoke test using Terasort and sort 10GB of data.

        <login as $HDFS_USER>
        /usr/lib/hadoop/bin/hadoop jar /usr/lib/hadoop/hadoop-examples.jar teragen 100000000 /test/10gsort/input
        /usr/lib/hadoop/bin/hadoop jar /usr/lib/hadoop/hadoop-examples.jar terasort /test/10gsort/input /test/10gsort/output

------

[Index](./index.md)
|
Prev: [Deploy Configurations](./deploy-configs.md)
|
**Validate Installation**
