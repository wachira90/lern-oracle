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

In Oracle Database 11g, when exporting a database using Data Pump Export (`expdp`), the `SYS_EXPORT_SCHEMA_01` is the **default name** of a master table that is created and used internally by the Data Pump Export process. Here's what it is and how it functions:

### **What is `SYS_EXPORT_SCHEMA_01`?**
- **Master Table:** The `SYS_EXPORT_SCHEMA_01` is the master table for the export job. It contains the metadata and job information for the export operation.
- **Default Naming Convention:** If you do not specify a custom name for the export job, Oracle assigns a default name following the format `SYS_EXPORT_<MODE>_<NUMBER>`. In this case:
  - `SCHEMA`: Indicates the export mode (Schema mode).
  - `01`: A unique identifier (sequence number) for the job.

### **Purpose of the Master Table**
1. **Metadata Storage:** The master table stores information about the objects being exported, such as their definitions and status.
2. **Restartability:** The information in the master table allows an export job to be restarted if it is interrupted.
3. **Job Coordination:** It keeps track of the progress of the job, including worker processes, and ensures that all data is correctly exported.

### **When is `SYS_EXPORT_SCHEMA_01` Created?**
- It is created in the schema of the user performing the export when you start a Data Pump Export job.
- For example, if the export command is:
  ```sql
  expdp user/password schemas=SCOTT
  ```
  The table `SYS_EXPORT_SCHEMA_01` will be created in the `USER` schema.

### **What Happens to the Master Table?**
- **During Export:** It exists only while the export job is running. It coordinates the export and stores progress and metadata.
- **After Export Completion:** By default, the master table is automatically dropped when the export job completes successfully.

### **Customizing the Master Table**
If you want to name the export job or master table explicitly, you can use the `JOB_NAME` parameter in the `expdp` command. For example:
```sql
expdp user/password schemas=SCOTT job_name=my_export_job
```
In this case, the master table will be named `MY_EXPORT_JOB`.

### **Example Scenario**
```bash
$ expdp scott/tiger schemas=SCOTT
```
- This creates a master table `SYS_EXPORT_SCHEMA_01` in the `SCOTT` schema.
- The table is automatically dropped once the export finishes successfully.
- If the export job fails or is interrupted, you can restart it using the information in this master table.

### **Key Considerations**
- If a previous export job fails and the master table (`SYS_EXPORT_SCHEMA_01`) is left behind, you must drop it manually before starting a new job with the same name.
  ```sql
  DROP TABLE SYS_EXPORT_SCHEMA_01;
  ```
- It is good practice to name export jobs explicitly using the `JOB_NAME` parameter for better management and troubleshooting.

==========

ใน Oracle Database 11g เมื่อมีการทำการส่งออกข้อมูล (Export) ด้วย Data Pump Export (`expdp`), ชื่อ `SYS_EXPORT_SCHEMA_01` เป็นชื่อ **ตารางมาสเตอร์ (Master Table)** ที่ถูกสร้างขึ้นและใช้งานภายในโดยกระบวนการ Data Pump Export โดยมีรายละเอียดดังนี้:

### **`SYS_EXPORT_SCHEMA_01` คืออะไร?**
- **ตารางมาสเตอร์:** `SYS_EXPORT_SCHEMA_01` เป็นตารางมาสเตอร์ที่ใช้เก็บข้อมูลเมตาดาต้า (Metadata) และข้อมูลของงานส่งออก (Export Job)
- **ชื่อเริ่มต้นโดยระบบ:** หากคุณไม่ได้ระบุชื่อของงาน (Job) เอง Oracle จะตั้งชื่อให้อัตโนมัติโดยใช้รูปแบบ `SYS_EXPORT_<MODE>_<NUMBER>` เช่นในกรณีนี้:
  - `SCHEMA`: ระบุว่าเป็นโหมด Schema
  - `01`: หมายเลขที่ระบุความเป็นเอกลักษณ์ของงาน (Job)

### **หน้าที่ของตารางมาสเตอร์**
1. **เก็บข้อมูลเมตาดาต้า:** ตารางนี้จะเก็บข้อมูลเกี่ยวกับวัตถุ (Objects) ที่ถูกส่งออก เช่น คำจำกัดความของตารางและสถานะของแต่ละวัตถุ
2. **รองรับการเริ่มใหม่ (Restartability):** หากงานส่งออกถูกหยุดชั่วคราว ข้อมูลในตารางนี้จะช่วยให้คุณสามารถเริ่มงานต่อจากจุดเดิมได้
3. **ประสานงาน:** ใช้ติดตามความคืบหน้าของงานและกระบวนการย่อย (Worker Processes) เพื่อให้การส่งออกสมบูรณ์

### **`SYS_EXPORT_SCHEMA_01` ถูกสร้างขึ้นเมื่อใด?**
- ตารางนี้จะถูกสร้างใน **Schema** ของผู้ใช้ที่ทำการส่งออกข้อมูลในขณะที่เริ่มต้นงานส่งออก
- ตัวอย่างเช่น หากคุณรันคำสั่ง:
  ```sql
  expdp user/password schemas=SCOTT
  ```
  ตาราง `SYS_EXPORT_SCHEMA_01` จะถูกสร้างใน **SCOTT Schema**

### **ชะตากรรมของตารางมาสเตอร์**
- **ระหว่างการส่งออก:** ตารางนี้จะถูกสร้างและใช้งานในระหว่างที่งานส่งออกกำลังทำงาน
- **หลังการส่งออกเสร็จสมบูรณ์:** โดยค่าเริ่มต้น ตารางมาสเตอร์จะถูกลบทันทีเมื่อการส่งออกเสร็จสมบูรณ์

### **การตั้งชื่อตารางมาสเตอร์เอง**
หากต้องการตั้งชื่อของงานหรือชื่อตารางมาสเตอร์เอง คุณสามารถใช้พารามิเตอร์ `JOB_NAME` ในคำสั่ง `expdp` ได้ เช่น:
```sql
expdp user/password schemas=SCOTT job_name=my_export_job
```
ในกรณีนี้ ตารางมาสเตอร์จะถูกตั้งชื่อว่า `MY_EXPORT_JOB`

### **ตัวอย่างสถานการณ์**
```bash
$ expdp scott/tiger schemas=SCOTT
```
- จะสร้างตารางมาสเตอร์ชื่อ `SYS_EXPORT_SCHEMA_01` ใน **SCOTT Schema**
- ตารางจะถูกลบอัตโนมัติหลังจากการส่งออกเสร็จสมบูรณ์
- หากงานส่งออกล้มเหลวหรือหยุดกลางคัน คุณสามารถเริ่มงานต่อโดยใช้ข้อมูลในตารางมาสเตอร์นี้

### **ข้อควรระวัง**
- หากงานส่งออกก่อนหน้านี้ล้มเหลวและตารางมาสเตอร์ (`SYS_EXPORT_SCHEMA_01`) ยังคงหลงเหลืออยู่ คุณต้องลบมันออกด้วยตนเองก่อนเริ่มงานใหม่ด้วยชื่อเดิม
  ```sql
  DROP TABLE SYS_EXPORT_SCHEMA_01;
  ```
- เป็นแนวทางที่ดีในการตั้งชื่อให้กับงานส่งออกเองด้วยพารามิเตอร์ `JOB_NAME` เพื่อความสะดวกในการจัดการและแก้ปัญหาในภายหลัง
