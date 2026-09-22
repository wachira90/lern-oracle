# Oracle Database Non-CDB กับ CDB/PDB

คำนี้พูดถึง **สถาปัตยกรรม (Architecture)** ของ Oracle Database ว่าเป็นแบบไหน ระหว่าง Non-CDB กับ CDB/PDB ซึ่งเป็นแนวคิดที่ Oracle เริ่มใช้ตั้งแต่เวอร์ชัน 12c เป็นต้นมา

## ความหมายของแต่ละแบบ

**Non-CDB (Non-Container Database)**
- สถาปัตยกรรมแบบดั้งเดิม (traditional) ที่ใช้มาก่อน Oracle 12c
- 1 instance = 1 database เดียว ๆ ไม่มีการแบ่งเป็น container ย่อย
- แบบนี้ถูกประกาศ deprecated ตั้งแต่ 12c และถูกยกเลิก (desupported) ในเวอร์ชันใหม่ ๆ (ตั้งแต่ 21c เป็นต้นไปต้องเป็น CDB เท่านั้น)

**CDB (Container Database) / PDB (Pluggable Database)**
- สถาปัตยกรรมแบบ Multitenant ที่ Oracle แนะนำให้ใช้
- **CDB** = ตัว container หลักที่ครอบอยู่ ประกอบด้วย
  - **CDB$ROOT** — root container เก็บ metadata และ common objects
  - **PDB$SEED** — template สำหรับสร้าง PDB ใหม่
- **PDB** = ฐานข้อมูลย่อยที่ "เสียบ" (plug) เข้าไปใน CDB ได้หลายตัว แต่ละ PDB ทำงานเหมือนเป็น database อิสระ
- ข้อดี: จัดการง่าย ประหยัดทรัพยากร ย้าย/สำรอง (clone, unplug/plug) สะดวก

## ทำไมต้องรู้ว่าเป็นแบบไหน

ประโยคที่ว่า "ไม่ทราบว่าเป็น Non-CDB หรือ CDB/PDB" มักเจอในบริบทของการ **ติดตั้ง monitoring, backup, migration หรือ connection** เพราะวิธีเชื่อมต่อและคำสั่งจัดการต่างกัน เช่น การ connect เข้า PDB ต้องใช้ service name ไม่ใช่แค่ SID

## วิธีเช็คว่า database ของคุณเป็นแบบไหน

รันคำสั่งนี้ (ต้อง login ด้วยสิทธิ์ที่เหมาะสม เช่น SYS/SYSTEM):

```sql
SELECT NAME, CDB, CON_ID FROM V$DATABASE;
```

- ถ้า `CDB = YES` → เป็น CDB (แบบ Multitenant)
- ถ้า `CDB = NO`  → เป็น Non-CDB

ถ้าอยากดูรายชื่อ PDB ทั้งหมดที่อยู่ใน CDB:

```sql
SELECT NAME, OPEN_MODE FROM V$PDBS;
```

และเช็คว่าตอนนี้ session ของคุณอยู่ใน container ไหน:

```sql
SHOW CON_NAME;
-- หรือ
SELECT SYS_CONTEXT('USERENV', 'CON_NAME') FROM DUAL;
```

สรุปสั้น ๆ: ประโยคนี้กำลังบอกว่ายังไม่ทราบว่าฐานข้อมูล Oracle ที่กำลังพูดถึงใช้สถาปัตยกรรมแบบเก่า (Non-CDB) หรือแบบใหม่ (CDB/PDB) ซึ่งใช้คำสั่ง `SELECT CDB FROM V$DATABASE;` ตรวจสอบได้เลยครับ
