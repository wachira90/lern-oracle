# Starting and Stopping the Oracle Enterprise Manager Console

## Starting dbconsole in Linux

To access the Oracle Enterprise Manager Console from a client browser, the dbconsole process needs to be running on the server. The dbconsole process is automatically started after installation.

However, in the event of a system restart, you can start it manually at the command line or start it as a service in Windows.

### To start the dbconsole process from the command line:

1. Navigate into your ORACLE_HOME/bin directory.

2. Run the following statement:
````
./emctl start dbconsole
````
Additionally, you can stop the process and view its status.

To stop the dbconsole process:
````
./emctl stop dbconsole
````
To view the status of the dbconsole process:
````
./emctl status dbconsole
````
### Starting dbconsole in Windows

In Windows, in addition to using the command line, you can start the dbconsole process as a service.

To start dbconsole as a service:

1.From the main menu, click Start, Control Panel, Administrative Tools, Services. The Services page appears.

2.Oracle services begin with Oracle. The dbconsole service is listed as OracleDBConsoleORACLE_SID, where ORACLE_SID is your SID. The status of this process is listed in the Status column, either Started or Stopped.

Double click the service. The property page appears.

3.In the properties page, ensure that the Startup Type is either Manual or Automatic and not Disabled. Click Start, if the process is not already started. Click OK.

You can also use the Services page to stop the process.
