# lern-oracle
lern-oracle

## SQLPLUS connect
````
sqlplus "/ AS SYSDBA"
````

## SQLPLUS connect from out side
````
sqlplus "USER1/pass1@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=db1.example.com)(Port=1521))(CONNECT_DATA=(SID=ORCL)))"
````

## START OSRACLE
````
SQL> STARTUP MOUNT;
````

## STOP OSRACLE
````
SQL> SHUTDOWN IMMEDIATE;
````
