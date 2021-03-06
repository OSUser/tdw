DROP TABLE table1;
DROP TABLE table2;
DROP TABLE table3;
set tolerate.dataerror.write=tolerate;
set tolerate.dataerror.readext=tolerate;
set tolerate.numsplitechar.lessthan.numberfields.exread=tolerate;


CREATE TABLE table1 (a STRING, b STRING)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t' ESCAPED BY '\\'
STORED AS TEXTFILE;

DESCRIBE table1;
DESCRIBE EXTENDED table1;

INSERT OVERWRITE TABLE table1 SELECT key, '\\\t\\' FROM src WHERE key = 86;

SELECT * FROM table1;

DROP TABLE table1;
