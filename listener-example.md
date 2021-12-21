## listener.ora and tnsnames.ora 

### /u01/app/oracle/product/11.2.0.4/db_1/network/admin/listener.ora

````
LISTENER =
  (DESCRIPTION_LIST =
    (DESCRIPTION =
      (ADDRESS = (PROTOCOL = IPC)(KEY = EXTPROC1521))
      (ADDRESS = (PROTOCOL = TCP)(HOST = oracle11gr2.example.com)(PORT = 1521))
    )
  )

ADR_BASE_LISTENER = /u01/app/oracle
````

### /u01/app/oracle/product/11.2.0.4/db_1/network/admin/tnsnames.ora

````
ORCL=
  (DESCRIPTION =
    (ADDRESS = (PROTOCOL = TCP)(HOST = oracle11gr2.example.com)(PORT = 1521))
    (CONNECT_DATA =
      (SERVER = DEDICATED)
      (SERVICE_NAME = ORCL)
    )
  )
````
