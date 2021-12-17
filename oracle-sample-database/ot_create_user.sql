-- create new user
CREATE USER OT IDENTIFIED BY example1234;

-- grant priviledges
GRANT CONNECT, RESOURCE, DBA TO OT;
