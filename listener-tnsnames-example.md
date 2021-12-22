## listener.ora and tnsnames.ora 

### /u01/app/oracle/product/11.2.0.1/db_1/network/admin/listener.ora

````
LISTENER =
  (DESCRIPTION_LIST =
    (DESCRIPTION =
      (ADDRESS = (PROTOCOL = IPC)(KEY = EXTPROC_FOR_LISTENER))
      (ADDRESS = (PROTOCOL = TCP)(HOST = 172.16.1.159)(PORT = 1521))
    )
  )

ADR_BASE_LISTENER = /u01/app/oracle
DEFAULT_SERVICE_LISTENER = (LISTENER)
````

### /u01/app/oracle/product/11.2.0.1/db_1/network/admin/tnsnames.ora

````
ORCL=
  (DESCRIPTION =
    (ADDRESS = (PROTOCOL = TCP)(HOST = 172.16.1.159)(PORT = 1521))
    (CONNECT_DATA =
      (SERVER = DEDICATED)
      (SERVICE_NAME = LISTENER)
    )
  )
````
