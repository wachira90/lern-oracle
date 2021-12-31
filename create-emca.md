# create EMCA
````
[oracle@oracle11gr2 ~]$ emca -repos create

STARTED EMCA at Dec 22, 2021 12:12:53 PM
EM Configuration Assistant, Version 11.2.0.0.2 Production
Copyright (c) 2003, 2005, Oracle.  All rights reserved.

Enter the following information:
Database SID: ORCL
Listener port number: 1521
Password for SYS user:
Password for SYSMAN user:

Do you wish to continue? [yes(Y)/no(N)]: y
Dec 22, 2021 12:13:49 PM oracle.sysman.emcp.EMConfig perform
INFO: This operation is being logged at /u01/app/oracle/cfgtoollogs/emca/ORCL/emca_2021_12_22_12_12_53.log.
Dec 22, 2021 12:13:49 PM oracle.sysman.emcp.EMReposConfig createRepository
INFO: Creating the EM repository (this may take a while) ...
Dec 22, 2021 12:13:49 PM oracle.sysman.emcp.EMReposConfig invoke
SEVERE: Error creating the repository
Dec 22, 2021 12:13:49 PM oracle.sysman.emcp.EMReposConfig invoke
INFO: Refer to the log file at /u01/app/oracle/cfgtoollogs/emca/ORCL/emca_repos_create_<date>.log for more details.
Dec 22, 2021 12:13:49 PM oracle.sysman.emcp.EMConfig perform
SEVERE: Error creating the repository
Refer to the log file at /u01/app/oracle/cfgtoollogs/emca/ORCL/emca_2021_12_22_12_12_53.log for more details.
Could not complete the configuration. Refer to the log file at /u01/app/oracle/cfgtoollogs/emca/ORCL/emca_2021_12_22_12_12_53.log for more details.
[oracle@oracle11gr2 ~]$ emca -config dbcontrol db

STARTED EMCA at Dec 22, 2021 12:14:04 PM
EM Configuration Assistant, Version 11.2.0.0.2 Production
Copyright (c) 2003, 2005, Oracle.  All rights reserved.

Enter the following information:
Database SID: ORCL
Database Control is already configured for the database ORCL
You have chosen to configure Database Control for managing the database ORCL
This will remove the existing configuration and the default settings and perform a fresh configuration
Do you wish to continue? [yes(Y)/no(N)]: Y
Listener ORACLE_HOME [ /u01/app/oracle/product/11.2.0.1/db_1 ]:
Password for SYS user:
Password for DBSNMP user:
Password for SYSMAN user:
Email address for notifications (optional): wachira@example.com
Outgoing Mail (SMTP) server for notifications (optional):
-----------------------------------------------------------------

You have specified the following settings

Database ORACLE_HOME ................ /u01/app/oracle/product/11.2.0.1/db_1

Local hostname ................ oracle11gr2.example.com
Listener ORACLE_HOME ................ /u01/app/oracle/product/11.2.0.1/db_1
Listener port number ................ 1521
Database SID ................ ORCL
Email address for notifications ............... wachira@example.com
Outgoing Mail (SMTP) server for notifications ...............

-----------------------------------------------------------------
Do you wish to continue? [yes(Y)/no(N)]: y
Dec 22, 2021 12:15:04 PM oracle.sysman.emcp.EMConfig perform
INFO: This operation is being logged at /u01/app/oracle/cfgtoollogs/emca/ORCL/emca_2021_12_22_12_14_04.log.
Dec 22, 2021 12:15:05 PM oracle.sysman.emcp.util.DBControlUtil stopOMS
INFO: Stopping Database Control (this may take a while) ...
Dec 22, 2021 12:15:07 PM oracle.sysman.emcp.EMReposConfig uploadConfigDataToRepository
INFO: Uploading configuration data to EM repository (this may take a while) ...
Dec 22, 2021 12:16:05 PM oracle.sysman.emcp.EMReposConfig invoke
INFO: Uploaded configuration data successfully
Dec 22, 2021 12:16:08 PM oracle.sysman.emcp.util.DBControlUtil configureSoftwareLib
INFO: Software library is already configured.
Dec 22, 2021 12:16:08 PM oracle.sysman.emcp.util.DBControlUtil configureSoftwareLib
INFO:  EM_SWLIB_STAGE_LOC (value) will be ignored.
Dec 22, 2021 12:16:08 PM oracle.sysman.emcp.EMDBPostConfig configureSoftwareLibrary
INFO: Deploying Provisioning archives ...
Dec 22, 2021 12:16:37 PM oracle.sysman.emcp.EMDBPostConfig configureSoftwareLibrary
INFO: Provisioning archives deployed successfully.
Dec 22, 2021 12:16:37 PM oracle.sysman.emcp.util.DBControlUtil secureDBConsole
INFO: Securing Database Control (this may take a while) ...
Dec 22, 2021 12:16:39 PM oracle.sysman.emcp.util.PlatformInterface executeCommand
WARNING: Error executing /u01/app/oracle/product/11.2.0.1/db_1/bin/emctl config emkey -repos
Dec 22, 2021 12:16:39 PM oracle.sysman.emcp.util.DBControlUtil secureDBConsole
WARNING: Configuring EM-Key failed.
Dec 22, 2021 12:16:39 PM oracle.sysman.emcp.EMDBPostConfig performConfiguration
WARNING: Error securing Database control.
Dec 22, 2021 12:16:39 PM oracle.sysman.emcp.EMDBPostConfig setWarnMsg
INFO: Error securing Database Control, Database Control has been brought up in non-secure mode. To secure the Database Control execute the following                                                                                         command(s):

 1) Set the environment variable ORACLE_SID to ORCL
 2) /u01/app/oracle/product/11.2.0.1/db_1/bin/emctl stop dbconsole
 3) /u01/app/oracle/product/11.2.0.1/db_1/bin/emctl config emkey -repos -sysman_pwd < Password for SYSMAN user >
 4) /u01/app/oracle/product/11.2.0.1/db_1/bin/emctl secure dbconsole -sysman_pwd < Password for SYSMAN user >
 5) /u01/app/oracle/product/11.2.0.1/db_1/bin/emctl start dbconsole

 To secure Em Key, run /u01/app/oracle/product/11.2.0.1/db_1/bin/emctl config emkey -remove_from_repos -sysman_pwd < Password for SYSMAN user >
Dec 22, 2021 12:16:39 PM oracle.sysman.emcp.util.DBControlUtil startOMS
INFO: Starting Database Control (this may take a while) ...
Dec 22, 2021 12:16:58 PM oracle.sysman.emcp.EMDBPostConfig performConfiguration
INFO: Database Control started successfully
Dec 22, 2021 12:16:58 PM oracle.sysman.emcp.EMDBPostConfig performConfiguration
INFO: >>>>>>>>>>> The Database Control URL is http://oracle11gr2.example.com:1158/em <<<<<<<<<<<


Error securing Database Control, Database Control has been brought up in non-secure mode. To secure the Database Control execute the following comman                                                                                        d(s):

 1) Set the environment variable ORACLE_SID to ORCL
 2) /u01/app/oracle/product/11.2.0.1/db_1/bin/emctl stop dbconsole
 3) /u01/app/oracle/product/11.2.0.1/db_1/bin/emctl config emkey -repos -sysman_pwd < Password for SYSMAN user >
 4) /u01/app/oracle/product/11.2.0.1/db_1/bin/emctl secure dbconsole -sysman_pwd < Password for SYSMAN user >
 5) /u01/app/oracle/product/11.2.0.1/db_1/bin/emctl start dbconsole

 To secure Em Key, run /u01/app/oracle/product/11.2.0.1/db_1/bin/emctl config emkey -remove_from_repos -sysman_pwd < Password for SYSMAN user >
[oracle@oracle11gr2 ~]$



[oracle@oracle11gr2 ~]$  emctl status emkey
Oracle Enterprise Manager 11g Database Control Release 11.2.0.1.0
Copyright (c) 1996, 2009 Oracle Corporation.  All rights reserved.
Please enter repository password:

The Em Key is not configured properly or is corrupted in the file system and does not exist in the Management Repository. To correct the problem:
1) Copy the emkey.ora file from another OMS or backup machine to the OH/sysman/config directory.
2) Configure the emkey.ora file by running "emctl config emkey -emkeyfile <emkey.ora file location>".
[oracle@oracle11gr2 ~]$
````
