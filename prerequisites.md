back to [Index](./index.md)

Introduction
============
This guide is intended for IT Operators and Administrators who need to install the Hortonworks Data Platform.

Prerequisites
-------------

Confirm you meet the system requirements and perform the following tasks before you install the Hortonworks Data Platform.

### System Requirements

<table>
	<tr>
		<td>
		<strong>Operating System</strong>
		</td>
		<td>
<ul>
<li>Red Hat Enterprise Linux – RHEL 5 (64-bit)</li>
<li>Red Hat Enterprise Linux – RHEL 6 (64-bit)</li>
<li>CentOS 5 (64-bit)</li>
<li>CentOS 6 (64-bit)</li>
<li>SUSE Linux Enterprise Server – SLES 11, SP1 (64-bit)</li>
</ul>
		</td>
	</tr>
	<tr>
		<td>
		<strong>Hardware</strong>
		</td>
		<td>
<ul>
<li>64-bit hardware</li>
<li>Note: DataNodes and TaskTrackers are configured to run 32-bit JVM to conserve memory</li>
<li>For a Single Node Cluster, refer to the Hortonworks Documentation.</li>
<li>For a Multi-Node Cluster, refer to the Hortonworks Documentation.</li>
</ul>
		</td>
	</tr>
	<tr>
		<td>
		Software
		</td>
		<td>
<strong>Java Development Kit (JDK):</strong>
<ul>
<li>JDK 1.6 update 31</li>
<li>See Installing the Java Development Kit (JDK)</li>
</ul>

<strong>Binaries:</strong>
<ul>
<li><code>yum</code> (on RHEL and CentOS)</li>
<li><code>zypper</code> (on SLES)
<li><code>rpm, scp, curl, wget, unzip, tar, pdsh</code></li>
</ul>

<strong>MySQL 5:</strong>
<ul>
<li>Optional: for use with Hive and HCatalog</li>
<li>See [Installing MySQL](./prerequisites.md#installing-mysql-optional)</li>
</ul>
		</td>
	</tr>
</table>

Installing the Java Development Kit (JDK)
------
TBD – get from existing docs 

Installing MySQL (optional)
------
TBD – get from existing docs

Preparing
======

* Confirm the Fully Qualified Domain Name (FQDN) for each host using the command '''hostname -f'''.
<pre>
	Note: if deploying your cluster to Amazon EC2, be sure to use the Private DNS host name.
</pre>
* Confirm all the host machines in your cluster are configured for DNS and Reverse DNS.
* Disable SELinux.
* Enable Network Time Protocol (NTP) for your cluster. In environments with no access to the Internet, ensure that you make one of your master nodes as NTP server.

Collect Cluster Information
======
TBD
http://docs.hortonworks.com/CURRENT/index.htm#Deploying_Hortonworks_Data_Platform/Using_HMC/Getting_Ready_To_Install/Collect_Information.htm

Create System Users and Groups
======
It is recommended that Hadoop services be owned by specific users and not by root or application users. In the table below are the typical users for Hadoop services. Identify the users that you want for your Hadoop services and the common group.

<table>
	<tr>
		<th>
Hadoop Service
		</th>
		<th>
User
		</th>
		<th>
Group
		</th>
	</tr>
	<tr>
		<td>
HDFS
		</td>
		<td>
hdfs
		</td>
		<td>
hadoop
		</td>
	</tr>
	<tr>
		<td>
MapReduce
		</td>
		<td>
mapred
		</td>
		<td>
hadoop
		</td>
	</tr>
	<tr>
		<td>
Hive
		</td>
		<td>
hive
		</td>
		<td>
hadoop
		</td>
	</tr>
	<tr>
		<td>
Pig
		</td>
		<td>
pig
		</td>
		<td>
hadoop
		</td>
	</tr>
	<tr>
		<td>
HCatalog
		</td>
		<td>
hcat
		</td>
		<td>
hadoop
		</td>
	</tr>
	<tr>
		<td>
Templeton
		</td>
		<td>
templeton
		</td>
		<td>
hadoop
		</td>
	</tr>
	<tr>
		<td>
HBase
		</td>
		<td>
hbase
		</td>
		<td>
hadoop
		</td>
	</tr>
	<tr>
		<td>
Zookeeper
		</td>
		<td>
zookeeper
		</td>
		<td>
hadoop
		</td>
	</tr>
	<tr>
		<td>
Oozie
		</td>
		<td>
oozie
		</td>
		<td>
hadoop
		</td>
	</tr>
</table>

Environment Parameters
======
The following table describes system user account and groups.

Link to [usersAndGroups.sh](./scripts/usersAndGroups.sh) script

<table>
	<tr>
		<th>
Parameter
		</th>
		<th>
Definition
		</th>
	</tr>
	<tr>
		<td>
'''HDFS_USER'''
		</td>
		<td>
User which will own the HDFS services. For example, '''hdfs'''.
		</td>
	</tr>
	<tr>
		<td>
'''MAPRED_USER'''
		</td>
		<td>
User which will own the MapReduce services. For example, mapred.
		</td>
	</tr>
	<tr>
		<td>
ZOOKEEPER_USER
		</td>
		<td>
User which will own the ZooKeeper services. For example, zookeeper.
		</td>
	</tr>
	<tr>
		<td>
HIVE_USER
		</td>
		<td>
User which will own the Hive services. For example, hive.
		</td>
	</tr>
	<tr>
		<td>
HBASE_USER
		</td>
		<td>
User which will own the HBase services. For example, hbase.
		</td>
	</tr>
	<tr>
		<td>
OOZIE_USER
		</td>
		<td>
User which will own the Oozie services. For example, oozie.
		</td>
	</tr>
	<tr>
		<td>
PIG_USER
		</td>
		<td>
User which will own the Pig services. For example, pig.
		</td>
	</tr>
	<tr>
		<td>
HADOOP_GROUP
		</td>
		<td>
A common group shared by services. For example, hadoop.
		</td>
	</tr>
</table>




The following table describes the directories for install, configuration, data, processes and logs.


scripts/directories.sh


Parameter	Definition
DFS_NAME_DIR	Space separated list of directories where NameNode will store file system image. For example, “/grid/hadoop/hdfs/nn /grid1/hadoop/hdfs/nn”
DFS_DATA_DIR	Space separated list of directories where DataNodes will store the blocks. For example, "/grid/hadoop/hdfs/dn /grid1/hadoop/hdfs/dn /grid2/hadoop/hdfs/dn "
ZOOKEEPER_DATA_DIR	Directory where ZooKeeper will store data. For example, /grid1/hadoop/zookeeper/data
FS_CHECKPOINT_DIR	Space separated list of directories where SecondaryNameNode will store checkpoint image. For example, "/grid/hadoop/hdfs/snn /grid1/hadoop/hdfs/snn /grid2/hadoop/hdfs/snn "
MAPREDUCE_LOCAL_DIR	Space separated list of directories where MapReduce will store temporary data. For example, "/grid/hadoop/hdfs/mapred /grid1/hadoop/hdfs/mapred /grid2/hadoop/hdfs/mapred "
HADOOP_CONF_DIR	Directory to store the Hadoop configuration files. For example, /etc/hadoop/conf
HIVE_CONF_DIR	Directory to store the Hive configuration files. For example, /etc/hive/conf
HBASE_CONF_DIR	Directory to store the HBase configuration files. For example, /etc/hbase/conf
PIG_CONF_DIR	Directory to store the Pig configuration files. For example, /etc/pig/conf
ZOOKEEPER_CONF_DIR	Directory to store the ZooKeeper configuration files. For example, /etc/zookeeper/conf
OOZIE_CONF_DIR	Directory to store the Oozie configuration files. For example, /etc/oozie/conf
HDFS_LOG_DIR	Directory to store the HDFS logs. For example, /var/log/hadoop/hdfs
MAPRED_LOG_DIR	Directory to store the HDFS logs. For example, /var/log/hadoop/mapred
HIVE_LOG_DIR	Directory to store the Hive logs. For example, /var/log/hive
HBASE_LOG_DIR	Directory to store the HBase logs. For example, /var/log/hbase
PIG_LOG_DIR	Directory to store the Pig logs. For example, /var/log/pig
ZOOKEEPER_LOG_DIR	Directory to store the ZooKeeper logs. For example, /var/log/zookeeper
OOZIE_LOG_DIR	Directory to store the Oozie logs. For example, /var/log/oozie
HDFS_PID_DIR	Directory to store the HDFS process ID. For example, /var/run/hadoop/hdfs
MAPRED_PID_DIR	Directory to store the MapReduce process ID. For example, /var/run/hadoop/mapred
HIVE_PID_DIR	Directory to store the Hive process ID. For example, /var/run/hive
PIG_PID_DIR	Directory to store the Pig process ID. For example, /var/run/pig
ZOOKEEPER_PID_DIR	Directory to store the ZooKeeper process ID. For example, /var/run/zookeeper
OOZIE_PID_DIR	Directory to store the Oozie process ID. For example, /var/run/oozie
