set hive.mapjoin.numrows = 2;

drop table dest_j1;

CREATE TABLE dest_j1(key INT, value STRING, val2 STRING) STORED AS TEXTFILE;

EXPLAIN
INSERT OVERWRITE TABLE dest_j1 
SELECT /*+ MAPJOIN(X) */ x.key, x.value, y.value
FROM src1 x JOIN src y ON (x.key = y.key);

INSERT OVERWRITE TABLE dest_j1 
SELECT /*+ MAPJOIN(X) */ x.key, x.value, y.value
FROM src1 x JOIN src y ON (x.key = y.key);

select * from dest_j1 x order by x.key;

drop table dest_j1;