# FIX ALL ERROR OF ORACLE

## Error in invoking target 'install' of makefile ins_ctx.mk
````
rm -rf $ORACLE_HOME/lib/stubs/* 
cp $ORACLE_HOME/ctx/lib/env_ctx.mk $ORACLE_HOME/ctx/lib/env_ctx.mk.orig
````

## Perform the following modifications to the "$ORACLE_HOME/ctx/lib/env_ctx.mk" file.
````
# Line 154 # FROM: LINK=$(LDCCOM) # TO  : LINK=$(LDCCOM) --Wl,--no-as-needed
````

=================================

## error in invoking target 'agent nmhs' of makefile ins_emagent.mk
````
nano /u01/app/oracle/product/11.2.0.1/db_1/sysman/lib/ins_emagent.mk
````
add "-lnnz11" to file 
````
$(MK_EMAGENT_NMECTL) -lnnz11
````
====================================
