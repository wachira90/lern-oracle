
# Using Thai Support Features in Oracle Database

ข้อแนะนำในการใช้ความสามารถทางด้านภาษาไทยจาก Oracle Database

Prerequisites: (Software Requirements)
Oracle Software ซึ่งสามารถ Download ได้จาก  http://otn.oracle.com

Assumption: -

Notation: -

Attendees:
Oracle DBA, Oracle Developer

Purpose:
อธิบายการใช้งานความสามารถด้านภาษาไทยของ Oracle Database

Introduction:
เอกสารฉบับนี้ได้อธิบายลำดับขั้นตอนที่สำคัญในการใช้งาน ความสามารถด้านภาษาไทย ของ Oracle Database ดังรายละเอียดต่อไปนี้

Planning and selecting appropriated database character set

ก่อนอื่นDBA ควรวางแผนและกำหนด Character Set ของ Oracle Database ให้เหมาะสมกับลักษณะงานที่พัฒนา ในกรณีที่เราวางแผนที่จะจัดเก็บข้อมูลที่เป็นภาษาไทย และภาษาอังกฤษใน Database เดียวกัน Character Set ที่เหมาะสมควรเป็น TH8TISASCII

ถ้าเรากำหนดเป็น US7ASCII หรือ WE8ISO8859P1 เราก็สามารถที่จัดเก็บ ดึงข้อมูล และเรียงลำดับข้อมูลที่เป็นภาษาไทยได้เช่นกัน เพียงแต่ในการทำงานของ Oracle Database อาจจะต้องเพิ่มขั้นตอนในการ Encoding กลับไป กลับมาหลายตลบ ซึ่งมีผลโดยตรงต่อ Performance

แต่ถ้าเราวางแผนให้ Database ของเรารองรับหลายภาษา การเลือก Character Set เป็น Unicode ก็จะเหมาะสมอย่างยิ่งกับระบบงานเช่นนี้ Character Set ที่เหมาะสมก็จะเป็น UTF8 หรือ UTF16 (เริ่มมีใช้ใน Oracle Database 9.0.1) ก็ได้

# Server Side

ข้อแนะนำฝั่ง Database Server

## 1. Creating new Database

เราอาจสร้าง Database ได้โดยใช้ Database Configuration Assistant – DBCA ซึ่งเป็น GUI หรือ อาจสร้างโดยใช้คำสั่ง Create Database จาก SQL*Plus ก็ได้

ในการสร้าง Database นั้น ต้องมีการระบุ Character Set ที่ต้องการใช้ โดย Character Set นี้ จะมีผลกับ Datatype อย่างเช่น char, varchar2 เป็นต้น ส่วน National Character Set จะมีผลกับ Datatype อย่างเช่น nchar, nvarchar2 เป็นต้น

```sql
CREATE DATABASE "viper"
   maxdatafiles 254
   maxinstances 8
   maxlogfiles 32
   character set TH8TISASCII
   national character set UTF8

DATAFILE
  '/u01/oradata/viper/system01.dbf' SIZE 100M AUTOEXTEND ON NEXT 640K

Logfile

  '/u01/oradata/viper/redo01.log' SIZE 500K,
  '/u01/oradata/viper/redo02.log' SIZE 500K,
  '/u01/oradata/viper/redo03.log' SIZE 500K;
```

จากตัวอย่างข้างบน จะเป็นการสร้าง Database ชื่อ "viper" โดยใช้ Character Set เป็น "TH8TISASCII" ซึ่งก็คือ ข้อมูลที่ถูกจัดเก็บเป็นข้อมูลภาษาไทย ตามรหัส สมอ (TIS) มีวิธีการเก็บแบบ Single Byte 8 Bits และข้อมูลนี้ถูกจัดเก็บในลักษณะ ASCII Code

และ Database "viper" สามารถที่จะจัดเก็บข้อมูลที่มี Datatype ที่เป็น National Character Set เช่น nchar, nvarchar2 โดยการ Encode ในรูปแบบ UTF8

## 2. How to check current database character set  **

เราสามารถตรวจสอบ Database Character Set ที่เรากำลังใช้งานอยู่ ได้โดยใช้คำสั่งข้างล่างนี้

```sql
select * from nls_database_parameters;
```

## 3. How to change database character set **

การเปลี่ยน Database Character Set  สามารถทำได้ในกรณีที่ Character Set ที่เรากำหนดไว้ จะต้องการมีขนาดเล็กกว่า Character Set ที่เราจะเปลี่ยนใหม่เท่านั้น ตัวอย่างเช่น เปลี่ยน US7ASCII ให้เป็น TH8TISASCII ได้ แต่ไม่สามารถเปลี่ยน TH8TISASCII เป็น US7ASCII ได้

ดังนั้นในการออกแบบ Database Character Set ควรจะมีการไตร่ตรอง ปรึกษา และตกลงเรื่องการกำหนด Database Character Set ให้ดีก่อน เพราะ Database Character Set มีผลต่อ Performance อย่างมาก และการเปลี่ยนแปลงภายหลังก็ไม่สามารถทำได้ทุกกรณี

ตัวอย่างคำสั่งในการเปลี่ยน Database Character Set

```sql
alter database fujudb character set TH8TISASCII;
```

# Client Side **

ข้อแนะนำที่ฝั่ง Client

เพื่อให้การ Encode ข้อมูลที่ฝั่ง Client ทำงานได้อย่างถูกต้อง และตรงกันกับ Database Character Set ที่กำหนดไว้ที่ฝั่ง Server เราสามารถกำหนด NLS Parameter ได้ 3 ระดับด้วยกัน คือ

- **Database Level** เราสามารถกำหนดค่า NLS parameter ที่ init.ora ซึ่งอยู่ที่ฝั่ง Server ให้เป็นค่า default ซึ่งการกำหนดเช่นนี้ จะมีผลกับทุกๆ Client ที่ไม่ได้กำหนดค่า NLS Parameter ไว้

- **Environment Level** จะเป็นการกำหนด NLS Parameter ไว้ที่ Environment Variable ซึ่งจะมีผลเมื่อ Client Program ทำการเรียกใช้

- **Session Level** เป็นการกำหนด NLS Parameter หลังจากที่มีการ Connect และ Create Session กับ Database Server เรียบร้อยแล้ว

ตัวอย่าง

จาก SQL*Plus เราต้องการให้ Current Date แสดงในรูปแบบดังต่อไปนี้

```sql
SQL> select sysdate from dual;
SYSDATE
-----------
30-MAR-2002
```

วิธีการบังคับรูปแบบการแสดงผลใน Level ต่างๆ สามารถทำได้ดังนี้

# Database Level

เพิ่มบรรทัดข้างล่างนี้ ใน Init.ora และทำการ Restart Database Server ใหม่

```sh
NLS_DATE_FORMAT=DD-MON-YYYY
```

# Environment Level

ในกรณีที่เป็น Unix กำหนดในระดับตัวแปรของ Shell

```sh
$ NLS_DATE_FORMAT=DD-MON-YYYY;export NLS_DATE_FORMAT
```

# Session level

ใช้คำสั่ง

```sql
alter session set NLS_DATE_FORMAT='DD-MON-YYYY';
```

## 4. Set Client Environment for Thai Support **

### 4.1 NLS_LANG - Basic theory (should be the same character set as Server side)

ตัวแปร NLS_LANG ประกอบด้วย 3 ส่วนด้วยกัน คือ Language, Territory และ Character Set ซึ่งอยู่ในรูปแบบ

```
NLS_LANG = language_territory.charset
```

กติกาง่ายๆ คือ กำหนดส่วนของ Character Set ในตัวแปร NLS_LANG ให้ตรงกับ Database Character Set ปัจจุบัน เพื่อป้องกันปัญหาการ Encode ข้อมูลผิด อย่างเช่น แสดงข้อมูลออกมาเป็น '??????' หรือ 'ฟฟฟฟฟ'

ตัวอย่างเช่น ถ้า Database ที่เราสร้างขึ้นมามี Character Set เป็น TH8TISASCII ดังนั้นการกำหนดค่า NLS_LANG ของ Client ก็อาจจะกำหนดได้ดังตัวอย่างข้างล่างนี้ ซึ่งผลที่ได้จะทำให้ไม่มีปัญหาเกี่ยวกับการ Encode ข้อมูลผิดเป็น  '??????' หรือ 'ฟฟฟฟฟ'

```
NLS_LANG=THAI_THAILAND.TH8TISASCII
or
NLS_LANG=AMERICAN_AMERICA.TH8TISASCII
or
NLS_LANG=THAI_AMERICA.TH8TISASCII
```

### 4.2 Thai Sorting

เราสามารถกำหนดการ Sort ของภาษาไทยได้ที่ระดับ NLS Parameter โดยใช้คำสั่ง

```sql
alter session set NLS_SORT=THAI_DICTIONARY;
```

นอกจากนี้ เรายังสามารถที่จะระบุ Dictionary สำหรับการ Sort ในระดับ SQL Command ได้โดยใช้ Function NLSSORT

ตัวอย่างเช่น

```sql
SQL>SELECT * FROM myTable ORDER BY NLSSORT(name, 'NLS_SORT = THAI_DICTIONARY');
```

Sample Client Programs for using Thai Support Features

Multi-tier

1. PHP via OCI8 extension => http://www.exzilla.net/tips/php/php-oracle-nls.php

2. JSP via JDBC => http://www.exzilla.net/docs/javathai/MS874Streams01.php

Two-tier

3. ODBC => http://www.exzilla.net/docs/nls/win2k-nls-lang01.php

Using Oracle Client Program/Utility

1. Imp/Exp utility => http://www.exzilla.net/docs/impExp/import_export_oracle_817.php

2. SQL*Plus => http://www.exzilla.net/docs/nls/thai-sorting.sql.txt
