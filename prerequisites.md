[Index](./index.md) / **Prerequisites**

------

Prerequisites
-------------
This guide is intended for IT Operators and Administrators who need to install the Hortonworks Data Platform.

Before you install the Hortonworks Data Platform, confirm you meet the system requirements and perform the following tasks.

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
<li>See <a href="#installing-the-java-development-kit-jdk">Installing the Java Development Kit (JDK)</a></li>
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
<li>See <a href="#installing-mysql-optional">Installing MySQL</a></li>
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

* Confirm the Fully Qualified Domain Name (FQDN) for each host using the command <code>hostname -f</code>.
<pre>
	Note: if deploying your cluster to Amazon EC2, be sure to use the Private DNS host name.
</pre>
* Confirm all the host machines in your cluster are configured for DNS and Reverse DNS.
* Disable SELinux.
* Enable Network Time Protocol (NTP) for your cluster. In environments with no access to the Internet, ensure that you make one of your master nodes as NTP server.

Collect Cluster Information
------

TBD
http://docs.hortonworks.com/CURRENT/index.htm#Deploying_Hortonworks_Data_Platform/Using_HMC/Getting_Ready_To_Install/Collect_Information.htm

Create System Users and Groups
------
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
------
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
<code>HDFS_USER</code>
		</td>
		<td>
User which will own the HDFS services. For example, <code>hdfs</code>.
		</td>
	</tr>
	<tr>
		<td>
<code>MAPRED_USER</code>
		</td>
		<td>
User which will own the MapReduce services. For example, <code>mapred</code>.
		</td>
	</tr>
	<tr>
		<td>
<code>ZOOKEEPER_USER</code>
		</td>
		<td>
User which will own the ZooKeeper services. For example, <code>zookeeper</code>.
		</td>
	</tr>
	<tr>
		<td>
<code>HIVE_USER</code>
		</td>
		<td>
User which will own the Hive services. For example, <code>hive</code>.
		</td>
	</tr>
	<tr>
		<td>
<code>HBASE_USER</code>
		</td>
		<td>
User which will own the HBase services. For example, <code>hbase</code>.
		</td>
	</tr>
	<tr>
		<td>
<code>OOZIE_USER</code>
		</td>
		<td>
User which will own the Oozie services. For example, <code>oozie</code>.
		</td>
	</tr>
	<tr>
		<td>
<code>PIG_USER</code>
		</td>
		<td>
User which will own the Pig services. For example, <code>pig</code>.
		</td>
	</tr>
	<tr>
		<td>
<code>HADOOP_GROUP</code>
		</td>
		<td>
A common group shared by services. For example, <code>hadoop</code>.
		</td>
	</tr>
</table>



The following table describes the directories for install, configuration, data, processes and logs.

Link to [directories.sh](./scripts/directories.sh) script


<table>
   <tr>
	<th>
Parameter
	</th>
   </tr>
   <tr>
	<th>
   Definition
	</th>
   </tr>
   <tr>
	<td>
<code>DFS_NAME_DIR</code>
	</td>
	<td>
Space separated list of directories where NameNode will store file system image.
For example, <code>"/grid/hadoop/hdfs/nn /grid1/hadoop/hdfs/nn"</code>
	</td>
   </tr>
   <tr>
	<td>
<code>DFS_DATA_DIR</code>
	</td>
	<td>
Space separated list of directories where DataNodes will store the blocks.
For example, <code>"/grid/hadoop/hdfs/dn /grid1/hadoop/hdfs/dn /grid2/hadoop/hdfs/dn"</code>
       </td>
   </tr>
   <tr>
	<td>
<code>ZOOKEEPER_DATA_DIR</code>
	</td>
	<td>
Directory where ZooKeeper will store data. For example, <code>/grid1/hadoop/zookeeper/data</code>
</td>
   </tr>
   <tr>
	<td>
<code>FS_CHECKPOINT_DIR</code>
	</td>
	<td>
Space separated list of directories where SecondaryNameNode will store checkpoint image. For example, <code>"/grid/hadoop/hdfs/snn /grid1/hadoop/hdfs/snn /grid2/hadoop/hdfs/snn"</code>
</td>
   </tr>
   <tr>
	<td>
<code>MAPREDUCE_LOCAL_DIR</code>
	</td>
	<td>
Space separated list of directories where MapReduce will store temporary data. For example, <code>"/grid/hadoop/hdfs/mapred /grid1/hadoop/hdfs/mapred /grid2/hadoop/hdfs/mapred"</code>
</td>
   </tr>
   <tr>
	<td>
<code>HADOOP_CONF_DIR</code>
	</td>
	<td>
Directory to store the Hadoop configuration files. For example, <code>"/etc/hadoop/conf"</code>
</td>
   </tr>
   <tr>
	<td>
<code>HIVE_CONF_DIR</code>
	</td>
	<td>
Directory to store the Hive configuration files. For example, <code>"/etc/hive/conf"</code>
</td>
   </tr>
   <tr>
	<td>
<code>HBASE_CONF_DIR</code>
	</td>
	<td>
Directory to store the HBase configuration files. For example, <code>"/etc/hbase/conf"</code>
</td>
   </tr>
   <tr>
	<td>
<code>PIG_CONF_DIR</code>
	</td>
	<td>
Directory to store the Pig configuration files. For example, <code>"/etc/pig/conf"</code>
</td>
   </tr>
   <tr>
	<td>
<code>ZOOKEEPER_CONF_DIR</code>
	</td>
	<td>
Directory to store the Zookeeper configuration files. For example, <code>"/etc/zookeeper/conf"</code>
</td>
   </tr>
   <tr>
	<td>
<code>OOZIE_CONF_DIR</code>
	</td>
	<td>
Directory to store the Oozie configuration files. For example, <code>"/etc/oozie/conf"</code>
</td>
   </tr>
   <tr>
	<td>
<code>HDFS_LOG_DIR</code>
	</td>
	<td>
Directory to store the HDFS logs. For example, <code>"/var/log/hadoop/hdfs"</code>
</td>
   </tr>
   <tr>
	<td>
<code>MAPRED_LOG_DIR</code>
	</td>
	<td>
Directory to store the HDFS logs. For example, <code>"/var/log/hadoop/mapred"</code>
</td>
   </tr>
   <tr>
	<td>
<code>HIVE_LOG_DIR</code>
	</td>
	<td>
Directory to store the Hive logs. For example, <code>"/var/log/hive"</code>
</td>
   </tr>
   <tr>
	<td>
<code>HBASE_LOG_DIR</code>
	</td>
	<td>
Directory to store the HBase logs. For example, <code>"/var/log/hbase"</code>
</td>
   </tr>
   <tr>
	<td>
<code>PIG_LOG_DIR</code>
	</td>
	<td>
Directory to store the Pig logs. For example, <code>"/var/log/pig"</code>
</td>
   </tr>
   <tr>
	<td>
<code>ZOOKEEPER_LOG_DIR</code>
	</td>
	<td>
Directory to store the ZooKeeper logs. For example, <code>"/var/log/zookeeper"</code>
</td>
   </tr>
   <tr>
	<td>
<code>OOZIE_LOG_DIR</code>
	</td>
	<td>
Directory to store the Oozie logs. For example, <code>"/var/log/oozie"</code>
</td>
   </tr>
   <tr>
	<td>
<code>HDFS_PID_DIR</code>
	</td>
	<td>
Directory to store the HDFS process ID. For example, <code>"/var/run/hadoop/hdfs"</code>
</td>
   </tr>
   <tr>
	<td>
<code>MAPRED_PID_DIR</code>
	</td>
	<td>
Directory to store the MapReduce process ID. For example, <code>"/var/run/hadoop/mapred"</code>
</td>
   </tr>
   <tr>
	<td>
<code>HIVE_PID_DIR</code>
	</td>
	<td>
Directory to store the Hive process ID. For example, <code>"/var/run/hive"</code>
</td>
   </tr>
   <tr>
	<td>
<code>PIG_PID_DIR</code>
	</td>
	<td>
Directory to store the Pig process ID. For example, <code>"/var/run/pig"</code>
</td>
   </tr>
   <tr>
	<td>
<code>ZOOKEEPER_PID_DIR</code>
	</td>
	<td>
Directory to store the ZooKeeper process ID. For example, <code>"/var/run/zookeeper"</code>
</td>
   </tr>
   <tr>
	<td>
<code>OOZIE_PID_DIR</code>
	</td>
	<td>
Directory to store the Oozie process ID. For example, <code>"/var/run/oozie"</code>
</td>
   </tr>

</table>




------

[Index](./index.md)
/
**[Prerequisites](./prequisites.md)**
/
Next Step: [Install HDFS + MapReduce](./install-hdfs-mapreduce.md)
