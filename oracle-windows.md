C:\app\admin\product\12.2.0\dbhome_1\network\admin



SQL> SHOW USER;

````
COLUMN name FORMAT a20;

SELECT name, con_id FROM v$pdbs;
ORCLPDB
=================

SQL> SELECT name, con_id FROM v$pdbs;

NAME
---------------------------------------

    CON_ID
----------
PDB$SEED
         2

ORCLPDB
         3
````

````
SQL> select name as "Service Name" from v$active_services where con_id = 3;
Service Name
----------------------------------------------------------------
orclpdb
SQL> cl scr
````

netca

3. local net servi
1. add  ==> ORCLPDB

test =>  system/Mst001Admin

C:\app\Administrator\product\12.2.0\dbhome_1\network\admin


=================

SQL> ALTER PLUGGABLE DATABASE ORCLPDB OPEN;

ALTER DATABASE OPEN;   => 


ALTER SESSION SET CONTAINER = ORCLPDB;

SHOW con_name;






````
CREATE USER OT IDENTIFIED BY 1234;

ALTER USER OT IDENTIFIED BY admin;

SELECT table_name FROM user_tables ORDER BY table_name;

GRANT CONNECT, RESOURCE, DBA TO OT;
````



@c:\dbsample\ot_schema.sql


@c:\dbsample\ot_data.sql


````
SELECT COUNT(*) FROM contacts;

SELECT * FROM contacts;

run {
shutdown immediate;
startup mount;
backup database plus archivelog;
}



SQL> CONNECT ot@ORCLPDB

SQL> CONNECT ot@orclpdb


SELECT
    name,
    address,
    credit_limit
FROM
    customers
ORDER BY
    name ASC;
````










## rman

RMAN> run {
2> shutdown immediate;
3> startup mount;
4> backup database plus archivelog;
5> }

````
database closed
database dismounted
Oracle instance shut down

connected to target database (not started)
Oracle instance started
database mounted

Total System Global Area    2566914048 bytes

Fixed Size                     8922184 bytes
Variable Size                687868856 bytes
Database Buffers            1862270976 bytes
Redo Buffers                   7852032 bytes


Starting backup at 24-SEP-20
allocated channel: ORA_DISK_1
channel ORA_DISK_1: SID=261 device type=DISK
specification does not match any archived log in the repository
backup cancelled because there are no files to backup
Finished backup at 24-SEP-20

Starting backup at 24-SEP-20
using channel ORA_DISK_1
channel ORA_DISK_1: starting full datafile backup set
channel ORA_DISK_1: specifying datafile(s) in backup set
input datafile file number=00001 name=C:\APP\ADMIN\ORADATA\ORCL\SYSTEM01.DBF
input datafile file number=00005 name=C:\APP\ADMIN\ORADATA\ORCL\UNDOTBS01.DBF
input datafile file number=00003 name=C:\APP\ADMIN\ORADATA\ORCL\SYSAUX01.DBF
input datafile file number=00007 name=C:\APP\ADMIN\ORADATA\ORCL\USERS01.DBF
channel ORA_DISK_1: starting piece 1 at 24-SEP-20
channel ORA_DISK_1: finished piece 1 at 24-SEP-20
piece handle=C:\APP\ADMIN\PRODUCT\12.2.0\DBHOME_1\DATABASE\01VB66S5_1_1 tag=TAG20200924T012940 comment=NONE
channel ORA_DISK_1: backup set complete, elapsed time: 00:00:15
channel ORA_DISK_1: starting full datafile backup set
channel ORA_DISK_1: specifying datafile(s) in backup set
input datafile file number=00009 name=C:\APP\ADMIN\ORADATA\ORCL\ORCLPDB\SYSAUX01.DBF
input datafile file number=00008 name=C:\APP\ADMIN\ORADATA\ORCL\ORCLPDB\SYSTEM01.DBF
input datafile file number=00010 name=C:\APP\ADMIN\ORADATA\ORCL\ORCLPDB\UNDOTBS01.DBF
input datafile file number=00011 name=C:\APP\ADMIN\ORADATA\ORCL\ORCLPDB\USERS01.DBF
channel ORA_DISK_1: starting piece 1 at 24-SEP-20
channel ORA_DISK_1: finished piece 1 at 24-SEP-20
piece handle=C:\APP\ADMIN\PRODUCT\12.2.0\DBHOME_1\DATABASE\02VB66SK_1_1 tag=TAG20200924T012940 comment=NONE
channel ORA_DISK_1: backup set complete, elapsed time: 00:00:03
channel ORA_DISK_1: starting full datafile backup set
channel ORA_DISK_1: specifying datafile(s) in backup set
input datafile file number=00004 name=C:\APP\ADMIN\ORADATA\ORCL\PDBSEED\SYSAUX01.DBF
input datafile file number=00002 name=C:\APP\ADMIN\ORADATA\ORCL\PDBSEED\SYSTEM01.DBF
input datafile file number=00006 name=C:\APP\ADMIN\ORADATA\ORCL\PDBSEED\UNDOTBS01.DBF
channel ORA_DISK_1: starting piece 1 at 24-SEP-20
channel ORA_DISK_1: finished piece 1 at 24-SEP-20
piece handle=C:\APP\ADMIN\PRODUCT\12.2.0\DBHOME_1\DATABASE\03VB66SN_1_1 tag=TAG20200924T012940 comment=NONE
channel ORA_DISK_1: backup set complete, elapsed time: 00:00:07
Finished backup at 24-SEP-20

Starting backup at 24-SEP-20
using channel ORA_DISK_1
specification does not match any archived log in the repository
backup cancelled because there are no files to backup
Finished backup at 24-SEP-20

Starting Control File and SPFILE Autobackup at 24-SEP-20
piece handle=C:\APP\ADMIN\PRODUCT\12.2.0\DBHOME_1\DATABASE\C-1579616761-20200924-00 comment=NONE
Finished Control File and SPFILE Autobackup at 24-SEP-20

RMAN>
````




ORCLPDB

system


## cmd run as admin

sqlplus / as sysdba

SQL> SHUTDOWN IMMEDIATE
