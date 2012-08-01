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

        hadoop dfs -copyFromLocal /etc/passwd passwd-test
        hadoop dfs -ls 

Start MapReduce
----

1. Execute these commands from job tracker

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

Smoke test using Terasort and sort only 10GB of data. Replace the placeholders for map tasks and reduce task to suit your cluster

        hadoop jar /usr/lib/hadoop/hadoop-examples.jar -Dmapred.map.tasks=<number of map slots in your cluster> teragen 100000000 /test/10gsort/input
        hadoop jar /usr/lib/hadoop/hadoop-examples.jar -Dmapred.reduce.tasks=<number of reduce slots in your cluster> terasort /test/10gsort/input /test/10gsort/output


------

[Index](./index.md)
|
Prev: [Deploy Configurations](./deploy-configs.md)
|
**Validate Installation**
