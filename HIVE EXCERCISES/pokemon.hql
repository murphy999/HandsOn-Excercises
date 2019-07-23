Set hive.exec.dynamic.partition=true;
Set hive.exec.dynamic.partition.mode = nonstrict;

Set hive.exec.max.dynamic.partitions=700;
Set hive.exec.max.dynamic.partitions.pernode=700;

CREATE TABLE Pokemon_Partition2 (
number INT,
name STRING,
total INT,
hp INT,
attack INT,
defense INT,
spl_atk INT,
sp_def INT,
speed INT )
PARTITIONED BY (type2 STRING, type1 STRING);

INSERT INTO TABLE Pokemon_Partition2 PARTITION(type2,type1)
SELECT * FROM Poke;

CREATE EXTERNAL TABLE Pokemon_Extn_Parti (
number INT,
name STRING,
total INT,
hp INT,
attack INT,
defense INT,
spl_atk INT,
sp_def INT,
speed INT )
PARTITIONED BY (type2 STRING, type1 STRING)
LOCATION '/user/hive/Pokemon_Extn_Parti';

INSERT INTO TABLE Pokemon_Extn_Parti PARTITION(type2,type1)
SELECT * FROM Poke;

DESCRIBE Pokemon_Partition2;
DESCRIBE Pokemon_Extn_Parti;



