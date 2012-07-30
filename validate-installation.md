[Index](./index.md) / **Validate Installation**

------

Validate Installation
==========


3.8.1.  Format and Start HDFS
Execute these commands on the NameNode:
<login as $HDFS_USER>
/usr/lib/hadoop/bin/hadoop namenode –format
/usr/lib/hadoop/bin/hadoop-daemon.sh --config $HADOOP_CONF_DIR start namenode
Execute these commands from SecondaryNameNode:
<login as $HDFS_USER>
/usr/lib/hadoop/bin/hadoop-daemon.sh --config $HADOOP_CONF_DIR start secondarynamenode
Execute these commands from all DataNodes:
<login as $HDFS_USER>
/usr/lib/hadoop/bin/hadoop-daemon.sh --config $HADOOP_CONF_DIR start datanode
3.8.2.	Smoke test HDFS
hadoop dfs -copyFromLocal /etc/passwd passwd-test
hadoop dfs -ls 

3.8.3.	Start MapReduce
Execute these commands from job tracker
<login as $MAPRED_USER>
/usr/lib/hadoop/bin/hadoop-daemon.sh --config $HADOOP_CONF_DIR start jobtracker
Execute these commands from job history server
<login as $MAPRED_USER>
/usr/lib/hadoop/bin/hadoop-daemon.sh --config $HADOOP_CONF_DIR start historyserver
Execute these commands from all task tracker nodes
<login as $MAPRED_USER>
/usr/lib/hadoop/bin/hadoop-daemon.sh --config $HADOOP_CONF_DIR start tasktracker
3.8.4.	Smoke test MapReduce
Smoke test using Terasort (but sort only 10G of data). Replace the placeholders for map tasks and reduce task to suit your cluster
  hadoop jar /usr/lib/hadoop/hadoop-examples.jar -Dmapred.map.tasks=<number of map slots in your cluster>
 teragen 100000000 /test/10gsort/input
  hadoop jar /usr/lib/hadoop/hadoop-examples.jar -Dmapred.reduce.tasks=<number of reduce slots in your cluster> terasort /test/10gsort/input /test/10gsort/output





------

[Index](./index.md)
|
Prev: [Deploy Configurations](./deploy-configs.md)
|
**Validate Installation**
|
next: [Essential Hadoop Projects](./essential-hadoop-projects.md)
