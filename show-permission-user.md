To show permissions for a user named "wachira" in an Oracle database, you can use the following SQL commands:

1. To view system privileges granted to the user:

```sql
SELECT * FROM DBA_SYS_PRIVS WHERE GRANTEE = 'WACHIRA';
```

This query will display all system privileges granted directly to the user "wachira".

2. To view roles granted to the user:

```sql
SELECT * FROM DBA_ROLE_PRIVS WHERE GRANTEE = 'WACHIRA';
```

This query will display all roles granted directly to the user "wachira".

3. To view object privileges granted to the user:

```sql
SELECT * FROM DBA_TAB_PRIVS WHERE GRANTEE = 'WACHIRA';
```

This query will display all object privileges (such as SELECT, INSERT, UPDATE, DELETE) granted directly to the user "wachira" on various objects (tables, views, sequences, etc.).

You can also use the `GRANT` and `REVOKE` commands to grant or revoke privileges to/from the user, respectively. For example:

```sql
GRANT CREATE SESSION TO WACHIRA; -- Grants the CREATE SESSION system privilege
GRANT SELECT ON HR.EMPLOYEES TO WACHIRA; -- Grants SELECT privilege on the EMPLOYEES table in the HR schema
```

Note that you need to have the appropriate privileges (e.g., be a DBA or have the necessary system privileges) to query and modify user privileges.
