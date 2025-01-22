# EXPORT IMPORT

```
Microsoft Windows [Version 10.0.19045.5371]
(c) Microsoft Corporation. All rights reserved.

C:\Users\admin>sqlplus / as sysdba

SQL*Plus: Release 11.2.0.2.0 Production on Thu Jan 23 00:29:08 2025

Copyright (c) 1982, 2014, Oracle.  All rights reserved.


Connected to:
Oracle Database 11g Express Edition Release 11.2.0.2.0 - 64bit Production

SQL> CREATE OR REPLACE DIRECTORY dpump_dir AS 'D:\export\';

Directory created.

SQL> GRANT READ, WRITE ON DIRECTORY dpump_dir TO HR;

Grant succeeded.

SQL> exit
Disconnected from Oracle Database 11g Express Edition Release 11.2.0.2.0 - 64bit Production

C:\Users\admin>expdp HR/1234567 SCHEMAS=HR DIRECTORY=dpump_dir DUMPFILE=hr.dmp LOGFILE=hr-export.log

Export: Release 11.2.0.2.0 - Production on Thu Jan 23 00:31:08 2025

Copyright (c) 1982, 2009, Oracle and/or its affiliates.  All rights reserved.

Connected to: Oracle Database 11g Express Edition Release 11.2.0.2.0 - 64bit Production
Starting "HR"."SYS_EXPORT_SCHEMA_01":  HR/******** SCHEMAS=HR DIRECTORY=dpump_dir DUMPFILE=hr.dmp LOGFILE=hr-export.log
Estimate in progress using BLOCKS method...
Processing object type SCHEMA_EXPORT/TABLE/TABLE_DATA
Total estimation using BLOCKS method: 448 KB
Processing object type SCHEMA_EXPORT/PRE_SCHEMA/PROCACT_SCHEMA
Processing object type SCHEMA_EXPORT/SEQUENCE/SEQUENCE
Processing object type SCHEMA_EXPORT/TABLE/TABLE
Processing object type SCHEMA_EXPORT/TABLE/INDEX/INDEX
Processing object type SCHEMA_EXPORT/TABLE/CONSTRAINT/CONSTRAINT
Processing object type SCHEMA_EXPORT/TABLE/INDEX/STATISTICS/INDEX_STATISTICS
Processing object type SCHEMA_EXPORT/TABLE/COMMENT
Processing object type SCHEMA_EXPORT/PROCEDURE/PROCEDURE
Processing object type SCHEMA_EXPORT/PROCEDURE/ALTER_PROCEDURE
Processing object type SCHEMA_EXPORT/VIEW/VIEW
Processing object type SCHEMA_EXPORT/TABLE/CONSTRAINT/REF_CONSTRAINT
Processing object type SCHEMA_EXPORT/TABLE/TRIGGER
Processing object type SCHEMA_EXPORT/TABLE/STATISTICS/TABLE_STATISTICS
. . exported "HR"."COUNTRIES"                            6.367 KB      25 rows
. . exported "HR"."DEPARTMENTS"                          7.007 KB      27 rows
. . exported "HR"."EMPLOYEES"                            16.80 KB     107 rows
. . exported "HR"."JOBS"                                 6.992 KB      19 rows
. . exported "HR"."JOB_HISTORY"                          7.054 KB      10 rows
. . exported "HR"."LOCATIONS"                            8.273 KB      23 rows
. . exported "HR"."REGIONS"                              5.476 KB       4 rows
Master table "HR"."SYS_EXPORT_SCHEMA_01" successfully loaded/unloaded
******************************************************************************
Dump file set for HR.SYS_EXPORT_SCHEMA_01 is:
  D:\EXPORT\HR.DMP
Job "HR"."SYS_EXPORT_SCHEMA_01" successfully completed at 00:31:49

C:\Users\admin>
```
