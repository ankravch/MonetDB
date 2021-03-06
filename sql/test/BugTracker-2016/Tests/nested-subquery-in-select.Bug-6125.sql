START TRANSACTION;

CREATE TABLE t0 (a1 INT, a2 INT, a3 INT);
CREATE TABLE t1 (b1 INT, b2 INT);
CREATE TABLE t2 (c1 INT, c2 INT);

SELECT
  a1,
  (
    SELECT COUNT(*) FROM t1
  ) AS score
FROM t0;

SELECT
  a1,
  (
    SELECT COUNT(*) FROM t1 WHERE a1 = b1 AND EXISTS ( SELECT 1 FROM t2 WHERE c1 = a2 AND c2 IN (SELECT a1 FROM t0) )
  ) AS score
FROM t0;

SELECT
  a1,
  (
    SELECT COUNT(*) FROM t1 WHERE a1 = b1 AND EXISTS ( SELECT 1 FROM t2 WHERE c1 = B2 AND c2 IN (SELECT a1 FROM t0) )
  ) AS score
FROM t0;

SELECT
  a1,
  (
    SELECT COUNT(*) FROM t1 WHERE a1 = b1 AND EXISTS ( SELECT 1 FROM t2 WHERE c1 = B2 AND c2 IN (SELECT a1 FROM t0) )
  ) AS score
FROM t0
WHERE a2 OR a3;

ROLLBACK;

