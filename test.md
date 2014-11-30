<!---
Licensed to the Apache Software Foundation (ASF) under one or more
contributor license agreements.  See the NOTICE file distributed with
this work for additional information regarding copyright ownership.
The ASF licenses this file to You under the Apache License, Version 2.0
(the "License"); you may not use this file except in compliance with
the License.  You may obtain a copy of the License at [http://www.apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0)

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
-->

Pig View
============

Description
-----
This View provides a UI to create, save and run pig scripts. You can browse the list of pig scripts you have created and saved.
You can see the history of runs of the pig scripts, view the logs and download the results. You can also upload and use
UDFs with your pig scripts.

Requirements
-----

- Ambari 1.7.0
- HDFS with WebHDFS configured
- WebHCat with Pig configured

Build
-----

The view can be built as a maven project.

    mvn clean install

The build will produce the view archive.

    target/pig-0.1.0-SNAPSHOT.jar

Place the view archive on the Ambari Server and restart to deploy.    

    cp pig-0.1.0-SNAPSHOT.jar /var/lib/ambari-server/resources/views/
    ambari-server restart

View Definition
-----

    <!-- HDFS Configs -->
    <parameter>
        <name>webhdfs.url</name>
        <description>WebHDFS FileSystem URI (example: webhdfs://namenode:50070)</description>
        <required>true</required>
    </parameter>

    <parameter>
        <name>webhdfs.username</name>
        <description>User and doAs for proxy user for HDFS</description>
        <required>false</required>
    </parameter>

    <!-- WebHCat Configs -->
    <parameter>
        <name>webhcat.url</name>
        <description>WebHCat URL (example: http://webhcat.host:50111/templeton/v1)</description>
        <required>true</required>
    </parameter>

    <parameter>
        <name>webhcat.username</name>
        <description>User and doAs for proxy user for WebHCat</description>
        <required>false</required>
    </parameter>

    <!-- General Configs -->
    <parameter>
        <name>dataworker.username</name>
        <description>The username (defaults to ViewContext username)</description>
        <required>false</required>
    </parameter>

    <parameter>
        <name>scripts.dir</name>
        <description>HDFS directory path to store Pig scripts (example: /user/${username}/scripts)</description>
        <required>true</required>
    </parameter>

    <parameter>
        <name>jobs.dir</name>
        <description>HDFS directory path to store Pig job status (example: /user/${username}/jobs)</description>
        <required>true</required>
    </parameter>

    <parameter>
        <name>store.dir</name>
        <description>HDFS directory to store meta information about Pig scripts and jobs (example: /user/${username}/store)</description>
        <required>false</required>
    </parameter>

Cluster Configuration
-----
1. HDFS core-site

    hadoop.proxyuser.root.hosts=*
    hadoop.proxyuser.root.groups=*
    hadoop.proxyuser.hcat.hosts=*
    hadoop.proxyuser.hcat.groups=*

2. WebHCat webhcat-site

    webhcat.proxyuser.hcat.hosts=*
    webhcat.proxyuser.hcat.groups=*

3. Create users.

    useradd -G hdfs admin
    usermod -a -G users admin
    usermod -a -G hadoop admin

4. Check user.

    id admin
    uid=1002(admin) gid=1002(admin) groups=1002(admin),100(users),503(hadoop),498(hdfs)


Single Node Cluster
-----

#Install Ambari Server and Ambari Agent
#Manually register Ambari Agent with Server
#Setup and Start Ambari Server
#Create Blueprint

POST
http://c6403.ambari.apache.org:8080/api/v1/blueprints/pig-view

blueprint.json

#Create Cluster
http://c6403.ambari.apache.org:8080/api/v1/clusters/PigView

clustertemplate.json

#Deploy view
#Create instance

| Details: Instance Name | PIG_1 |
| Details: Display Name | Pig |
| Properties: webhdfs.url | webhdfs://c6403.ambari.apache.org:50070 |
| Properties: webhcat.url | http://c6403.ambari.apache.org:50111/templeton/v1 |
| Properties: scripts.dir | /tmp/${username}/scripts |
| Properties: jobs.dir | /tmp/${username}/jobs |
