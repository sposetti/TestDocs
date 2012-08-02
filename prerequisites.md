[Index](./index.md) / **Prerequisites**

------

Prerequisites
====

Before you install the Hortonworks Data Platform, confirm you meet the system requirements and perform the following tasks.

* [System Requirements](#system-requirements)
* [Preparing Your Cluster](#preparing-your-cluster)
* [Installing the Java Development Kit (JDK)](#installing-the-java-development-kit)
* [Installing MySQL (optional)](#installing-mysql-optional)
* [Set Environment Parameters](#set-environment-parameters)

System Requirements
---

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

<strong>MySQL 5 (optional):</strong>
<ul>
<li>For use with Hive and HCatalog services.</li>
<li>See <a href="#installing-mysql-optional">Installing MySQL</a></li>
</ul>
		</td>
	</tr>
</table>

Preparing Your Cluster
-----

* Confirm the Fully Qualified Domain Name (FQDN) for each host using the command <code>hostname -f</code>.
<pre>
	Note: if deploying your cluster to Amazon EC2, be sure to use the Private DNS host name.
</pre>
* Confirm all the host machines in your cluster are configured for DNS and Reverse DNS.
* Disable SELinux.
* Enable Network Time Protocol (NTP) for your cluster. In environments with no access to the Internet, ensure that you make one of your master nodes as NTP server.


Installing the Java Development Kit (JDK)
---

The Java Development Kit (JDK) must be installed on all the nodes in your cluster.
Follow the instructions listed below to manually deploy JDK:

1. Verify the existing version of Java meets the [System Requirements](#system-requirements).

        java -version

2. (Optional) Uninstall the Java package if JDK version is less than v1.6 update 31.

        rpm -qa | grep java
        yum remove java-x.xx-gcj-compat-x.x.x.x-xxjpp_xxrh

3. (Optional) Verify that the default Java package is uninstalled.

        which java

4. Download the Oracle 64-bit JDK [jdk-6u31-linux-x64.bin](http://www.oracle.com/technetwork/java/javase/downloads/jdk-6u31-download-1501634.html) from the Oracle download site.

    <pre>
    Optional: Download the Oracle 32-bit JDK (<code>jdk-6u31-linux-i586.bin</code>). You can install 32-bit JDK only on DataNodes and TaskTrackers.
    </pre>
    
5. Change directory to the location where you downloaded the 64-bit JDK and run the install.

        cd /usr/jdk1.6.0_31
        ./jdk-6u31-linux-x64.bin -noregister

6. (Optional) Install 32-bit JDK on DataNodes and TaskTrackers by executing the following com­mand:

        ./jdk-6u31-linux-i586.bin -noregister

7. Create symbolic links (symlinks) to the JDK.

        mkdir /usr/java
        ln -s /usr/jdk1.6.0_31/jdk1.6.0_31 /usr/java/default
        ln -s /usr/java/default/bin/java /usr/bin/java

6. Set up your environment to define <code>JAVA_HOME</code> to put the Java Virtual Machine and the Java compiler on your path:

        export JAVA_HOME=/usr/java/default
        export PATH=$JAVA_HOME/bin:$PATH


Installing MySQL (optional)
---

If you will install Hive and HCatalog services, you need a MySQL database instance to store metadata information. You can either use an existing MySQL instance or install a new instance of MySQL manually.

<pre>
NOTE: If you are using an existing MySQL instance, the database user you create for HDP must have adequate privileges to create a database and tables in that database.
</pre>

To install the instance manually, use the following instructions:

1. Connect to the host machine you plan to use for Hive and HCatalog.

2. Install MySQL server.

        [For RHEL and CentOS]
        yum install mysql-server

        [For SLES]
        zypper install mysql

3. Start the instance.

        [For RHEL and CentOS]
        /etc/init.d/mysqld start

        [For SLES]
        /etc/init.d/mysql start [for SLES]

4. Remove unnecessary information from log and STDOUT.

        mysqladmin -u root 2>&1 >/dev/null

5. As <code>root</code>, use mysql (or other client tool) to create the “hive” user and grant it all the privi­leges.

        CREATE USER 'hcat'@'%' IDENTIFIED BY 'hive';
        GRANT ALL PRIVILEGES ON *.* TO 'hive'@'%';
        flush privileges;

Create System Users and Groups
---

It is recommended that Hadoop services be owned by specific users and not by <code>root</code> or application users. In the table below are the typical users for Hadoop services. Identify the users that you want for your Hadoop services and the common group and create these accounts on your system.

| Hadoop Service | User | Group |
|----------------|------|-------|
| HDFS | hdfs | hadoop |
| MapReduce | mapred | hadoop |
| Hive | hive | hadoop |
| Pig | pig | hadoop |
| HCatalog | hcat | hadoop |
| Templeton | templeton | hadoop |
| HBase | hbase | hadoop |
| Zookeeper | zookeeper | hadoop |
| Oozie | oozie | hadoop |


Set Environment Parameters
---

### Users and Groups

The following table describes system user account and groups. These users and groups should reflect the accounts you created in [Create System Users and Groups](#create-system-users-and-groups)

> For your convenience, we provide <a href="./scripts/usersAndGroups.sh">usersAndGroups.sh</a> script for setting user and
> group environment parameters. We strongly suggest you edit and execute this script to fit your environment.

| Parameter | Definition |
|----------------|------|
| <code>HDFS_USER</code> | User which will own the HDFS services. For example, <code>hdfs</code>.
| <code>MAPRED_USER</code> | User which will own the MapReduce services. For example, <code>mapred</code>.
| <code>ZOOKEEPER_USER</code> | User which will own the ZooKeeper services. For example, <code>zookeeper</code>.
| <code>HIVE_USER</code> | User which will own the Hive services. For example, <code>hive</code>.
| <code>HBASE_USER</code> | User which will own the HBase services. For example, <code>hbase</code>.
| <code>OOZIE_USER</code> | User which will own the Oozie services. For example, <code>oozie</code>.
| <code>PIG_USER</code> | User which will own the Pig services. For example, <code>pig</code>.
| <code>HADOOP_GROUP</code> | A common group shared by services. For example, <code>hadoop</code>.

### Directories

The following table describes the directories for install, configuration, data, process IDs and logs based on the Hadoop Services you plan to install.

> For your convenience, we provide <a href="./scripts/directories.sh">directories.sh</a> script for setting directory
> environment parameters. We strongly suggest you edit and execute this script to fit your environment.

| Hadoop Serivce | Parameter | Definition |
|----------------|------|---------|
| HDFS | <code>DFS_NAME_DIR</code> | Space separated list of directories where NameNode will store file system image. For example, <code>"/grid/hadoop/hdfs/nn /grid1/hadoop/hdfs/nn"</code>
| HDFS | <code>FS_CHECKPOINT_DIR</code> | Space separated list of directories where SecondaryNameNode will store checkpoint image. For example, <code>"/grid/hadoop/hdfs/snn /grid1/hadoop/hdfs/snn /grid2/hadoop/hdfs/snn"</code>
| HDFS | <code>DFS_DATA_DIR</code> | Space separated list of directories where DataNodes will store the blocks. For example, <code>"/grid/hadoop/hdfs/dn /grid1/hadoop/hdfs/dn /grid2/hadoop/hdfs/dn"</code>
| HDFS | <code>HDFS_LOG_DIR</code> | Directory to store the HDFS logs. This directory name is a combination of a directory and the <code>$HDFS_USER</code>. For example, <code>"/var/log/hadoop/hdfs"</code> where <code>hdfs</code> is the <code>$HDFS_USER</code>
| HDFS | <code>HDFS_PID_DIR</code> | Directory to store the HDFS process ID. This directory name is a combination of a directory and the <code>$HDFS_USER</code>. For example, <code>"/var/run/hadoop/hdfs"</code> where <code>hdfs</code> is the <code>$HDFS_USER</code>
| HDFS | <code>HADOOP_CONF_DIR</code> | Directory to store the Hadoop configuration files. For example, <code>"/etc/hadoop/conf"</code>
| MapReduce | <code>MAPREDUCE_LOCAL_DIR</code> | Space separated list of directories where MapReduce will store temporary data. For example, <code>"/grid/hadoop/mapred /grid1/hadoop/mapred /grid2/hadoop/mapred"</code>.
| MapReduce | <code>MAPRED_LOG_DIR</code> | Directory to store the HDFS logs. For example, <code>"/var/log/hadoop/mapred"</code>. This directory name is a combination of a directory and the <code>$MAPRED_USER</code>. For example, <code>"/log/hadoop/mapred"</code> where <code>mapred</code> is the <code>$MAPRED_USER</code>
| MapReduce | <code>MAPRED_PID_DIR</code> | Directory to store the MapReduce process ID. For example, <code>"/var/run/hadoop/mapred"</code>. This directory name is a combination of a directory and the <code>$MAPRED_USER</code>. For example, <code>"/var/run/hadoop/mapred"</code> where <code>mapred</code> is the <code>$MAPRED_USER</code>
| Pig | <code>PIG_CONF_DIR</code> | Directory to store the Pig configuration files. For example, <code>"/etc/pig/conf"</code>
| Pig | <code>PIG_LOG_DIR</code> | Directory to store the Pig logs. For example, <code>"/var/log/pig"</code>
| Pig | <code>PIG_PID_DIR</code> | Directory to store the Pig process ID. For example, <code>"/var/run/pig"</code>
| Oozie | <code>OOZIE_CONF_DIR</code> | Directory to store the Oozie configuration files. For example, <code>"/etc/oozie/conf"</code>
| Oozie | <code>OOZIE_DATA_DIR</code> | Directory to store the Oozie data. For example, <code>"/var/db/oozie"</code>
| Oozie | <code>OOZIE_LOG_DIR</code> | Directory to store the Oozie logs. For example, <code>"/var/log/oozie"</code>
| Oozie | <code>OOZIE_PID_DIR</code> | Directory to store the Oozie process ID. For example, <code>"/var/run/oozie"</code>
| Oozie | <code>OOZIE_TMP_DIR</code> | Directory to store the Oozie temporary files. For example, <code>"/var/tmp/oozie"</code>
| Hive | <code>HIVE_CONF_DIR</code> | Directory to store the Hive configuration files. For example, <code>"/etc/hive/conf"</code>
| Hive | <code>HIVE_LOG_DIR</code> | Directory to store the Hive logs. For example, <code>"/var/log/hive"</code>
| Hive | <code>HIVE_PID_DIR</code> | Directory to store the Hive process ID. For example, <code>"/var/run/hive"</code>
| HBase | <code>HBASE_CONF_DIR</code> | Directory to store the HBase configuration files. For example, <code>"/etc/hbase/conf"</code>
| HBase | <code>HBASE_LOG_DIR</code> | Directory to store the HBase logs. For example, <code>"/var/log/hbase"</code>
| Zookeeper | <code>ZOOKEEPER_DATA_DIR</code> | Directory where ZooKeeper will store data. For example, <code>/grid1/hadoop/zookeeper/data</code>
| Zookeeper | <code>ZOOKEEPER_CONF_DIR</code> | Directory to store the Zookeeper configuration files. For example, <code>"/etc/zookeeper/conf"</code>
| Zookeeper | <code>ZOOKEEPER_LOG_DIR</code> | Directory to store the ZooKeeper logs. For example, <code>"/var/log/zookeeper"</code>
| Zookepper | <code>ZOOKEEPER_PID_DIR</code> | Directory to store the ZooKeeper process ID. For example, <code>"/var/run/zookeeper"</code>


------

[Index](./index.md)
|
**Prerequisites**
|
Next: [Install HDFS + MapReduce](./install-hdfs-mapreduce.md)

