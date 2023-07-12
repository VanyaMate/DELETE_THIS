-- online: https://onecompiler.com/mysql/3zebdr2u9

-- create users
CREATE TABLE users (
  phone   VARCHAR(16)   PRIMARY KEY,
  name    VARCHAR(32)   NOT NULL,
  level   INTEGER       NOT NULL
);

-- create reservations
CREATE TABLE reservations (
  user        VARCHAR(16) NOT NULL,
  time_start  TIMESTAMP   NOT NULL,
  time_end    TIMESTAMP   NOT NULL
);

-- insert users
INSERT INTO users VALUES ('111', 'Vanya', 0);
INSERT INTO users VALUES ('222', 'Admin', 1);
INSERT INTO users VALUES ('333', 'Mate', 0);
INSERT INTO users VALUES ('444', 'Root', 2);

-- insert reservations

-- Vanya - 3 + 4 = 7 
INSERT INTO reservations VALUES ('111', '2023-01-02 10:00:00', '2023-01-02 13:00:00');
INSERT INTO reservations VALUES ('111', '2023-01-02 14:00:00', '2023-01-02 18:00:15');

-- Admin - 3 + 3 + 3 = 9 
INSERT INTO reservations VALUES ('222', '2023-01-02 10:00:00', '2023-01-02 13:00:00');
INSERT INTO reservations VALUES ('222', '2023-01-03 10:00:00', '2023-01-03 13:00:01');
INSERT INTO reservations VALUES ('222', '2023-01-04 10:00:00', '2023-01-04 13:00:00');

-- Mate - 3 
INSERT INTO reservations VALUES ('333', '2023-01-02 10:00:00', '2023-01-02 13:00:00');

-- Root - 3 + 6 + 7 = 16
INSERT INTO reservations VALUES ('444', '2023-01-03 10:00:00', '2023-01-03 13:00:00');
INSERT INTO reservations VALUES ('444', '2023-01-04 10:00:00', '2023-01-04 16:30:02');
INSERT INTO reservations VALUES ('444', '2023-01-05 10:00:00', '2023-01-05 17:30:00');

-- query 
SELECT    users.name, 
          SUM(TIMESTAMPDIFF(HOUR, reservations.time_start, reservations.time_end)) AS hours
FROM      users
JOIN      reservations
ON        users.phone = reservations.user
WHERE     users.level > 0
GROUP BY  users.name