#!/bin/sh

#
# Direcories Script
#
# 1. To use this script, you must edit the TODO variables below for your environment.
#
# 2. Warning: Leave the other parameters as the default values. Changing these default values will require you to
#    change values in other configuration files.
#

#
# Hadoop Service - HDFS
#

# Space separated list of directories where NameNode will store file system image.
DFS_NAME_DIR="TODO-LIST-OF-NAMENODE-DIRS" ;

# Space separated list of directories where DataNodes will store the blocks.
DFS_DATA_DIR="TODO-LIST-OF-DATA-DIRS" ;

# Space separated list of directories where SecondaryNameNode will store checkpoint image.
FS_CHECKPOINT_DIR="TODO-LIST-OF-SECONDARY-NAMENODE-DIRS" ;

# Directory to store the Hadoop configuration files.
HADOOP_CONF_DIR="/etc/hadoop/conf" ;

# Directory to store the HDFS logs.
HDFS_LOG_DIR="/var/log/hadoop/hdfs" ;

# Directory to store the HDFS process ID.
HDFS_PID_DIR="/var/run/hadoop/hdfs" ;

#
# Hadoop Service - MapReduce
#

# Space separated list of directories where MapReduce will store temporary data.
MAPREDUCE_LOCAL_DIR="TODO-LIST-OF-MAPRED-DIRS" ;

# Directory to store the MapReduce logs.
MAPRED_LOG_DIR="/var/log/hadoop/mapred" ;

# Directory to store the MapReduce process ID.
MAPRED_PID_DIR="/var/run/hadoop/mapred" ;

#
# Hadoop Service - Hive
#

# Directory to store the Hive configuration files.
HIVE_CONF_DIR="/etc/hive/conf" ;

# Directory to store the Hive logs.
HIVE_LOG_DIR="/var/log/hive" ;

# Directory to store the Hive process ID.
HIVE_PID_DIR="/var/run/hive" ;

#
# Hadoop Service - HBase
#

# Directory to store the HBase configuration files.
HBASE_CONF_DIR="/etc/hbase/conf" ;

# Directory to store the HBase logs.
HBASE_LOG_DIR="/var/log/hbase" ;

#
# Hadoop Service - Zookeeper
#

# Directory where Zookeeper will store data.
ZOOKEEPER_DATA_DIR="TODO-ZOOKEPPER-DATA-DIR" ;

# Directory to store the ZooKeeper configuration files.
ZOOKEEPER_CONF_DIR="/etc/zookeeper/conf" ;

# Directory to store the ZooKeeper logs.
ZOOKEEPER_LOG_DIR="/var/log/zookeeper" ;

# Directory to store the ZooKeeper process ID.
ZOOKEEPER_PID_DIR="/var/run/zookeeper" ;

#
# Hadoop Service - Pig
#

# Directory to store the Pig configuration files.
PIG_CONF_DIR="/etc/pig/conf" ;

# Directory to store the Pig logs.
PIG_LOG_DIR="/var/log/pig" ;

# Directory to store the Pig process ID.
PIG_PID_DIR="/var/run/pig" ;

#
# Hadoop Service - Oozie
#

# Directory to store the Oozie configuration files.
OOZIE_CONF_DIR="/etc/oozie/conf" ;

# Directory to store the Oozie logs.
OOZIE_LOG_DIR="/var/log/oozie" ;

# Directory to store the Oozie process ID.
OOZIE_PID_DIR="/var/run/oozie" ;

# Directory to store the Oozie temporary files.
OOZIE_TMP_DIR="/var/tmp/oozie" ;
