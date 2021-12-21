## /u01/app/oracle/product/11.2.0.1/db_1/dbs/initORCL.ora

````
db_name='ORCL'
memory_target=3G
processes = 150
audit_file_dest='/u01/app/oracle/admin/orcl/adump'
audit_trail ='db'
db_block_size=8192
db_domain=''
db_recovery_file_dest='/u01/app/oracle/flash_recovery_area'
db_recovery_file_dest_size=2G
diagnostic_dest='/u01/app/oracle'
dispatchers='(PROTOCOL=TCP) (SERVICE=ORCL)'
open_cursors=300
remote_login_passwordfile='EXCLUSIVE'
undo_tablespace='UNDOTBS1'
# You may want to ensure that control files are created on separate physical
# devices
#control_files = (ora_control1, ora_control2)
control_files = (/u01/app/oracle/oradata/ORCL/control01.ctl, /u01/app/oracle/flash_recovery_area/ORCL/control02.ctl)
compatible ='11.2.0'
````

## if change "memory_target=3G"  will size up partition
````
[oracle@oracle11gr2 ~]$ df -h /dev/shm/
Filesystem      Size  Used Avail Use% Mounted on
tmpfs           3.9G     0  3.9G   0% /dev/shm
````
