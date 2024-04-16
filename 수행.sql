CREATE DATABASE IF NOT EXISTS mydatabase;
USE mydatabase;

DROP TABLE IF EXISTS Music_TV_Awards;
DROP TABLE IF EXISTS Idol_Information;

CREATE TABLE Idol_Information (
  mem_name VARCHAR(20) PRIMARY KEY NOT NULL,
  mem_number TINYINT CHECK (mem_number >= 4) NOT NULL,
  mem_agency VARCHAR(30) DEFAULT '없음',
  debut_date DATE NOT NULL
);

CREATE TABLE Music_TV_Awards (
  mem_name VARCHAR(20) PRIMARY KEY NOT NULL,
  The_Show TINYINT,
  Show_Champion TINYINT,
  Count_Down TINYINT,
  Music_Bank TINYINT
);

INSERT INTO Idol_Information VALUES('NewJeans', '5', 'ADOR', '2022.7.22');
INSERT INTO Idol_Information VALUES('STAYC', '6', 'Highup Entertainment', '2020.11.12');
INSERT INTO Idol_Information VALUES('(G)I-DLE', '5', 'CUBE ENTERTAINMENT', '2018.5.2');
INSERT INTO Idol_Information VALUES('IVE', '6', 'Starship Entertainment', '2021.12.1');
INSERT INTO Idol_Information VALUES('LE SSERAFIM', '5', 'SOURCE MUSIC', '2022.5.2');
INSERT INTO Idol_Information VALUES('OH MY GIRL', '6', 'WM ENTERTAINMENT', '2015.4.21');
INSERT INTO Idol_Information VALUES('TWICE', '9', 'JYP Entertainment', '2015.10.20');
INSERT INTO Idol_Information VALUES('NMIXX', '6', 'JYP Entertainment', '2022.2.22');

INSERT INTO Music_TV_Awards VALUES('NewJeans', NULL,NULL , '3', '3');
INSERT INTO Music_TV_Awards VALUES('STAYC', '5','4' , '3', '3');
INSERT INTO Music_TV_Awards VALUES('(G)I-DLE', '8','9', '11', '3');
INSERT INTO Music_TV_Awards VALUES('IVE', '6','6' , '4', '11');
INSERT INTO Music_TV_Awards VALUES('LE SSERAFIM', '3','2' , '1', '4');
INSERT INTO Music_TV_Awards VALUES('OH MY GIRL', '9','4' , '3', '1');
INSERT INTO Music_TV_Awards VALUES('TWICE', '2','18' , '25', '29');
INSERT INTO Music_TV_Awards VALUES('NMIXX',NULL,'1' ,NULL,NULL);

ALTER TABLE Music_TV_Awards
ADD total_award TINYINT AS (COALESCE(The_Show, 0) + COALESCE(Show_Champion, 0) + COALESCE(Count_Down, 0) + COALESCE(Music_Bank, 0));

-- SELECT * FROM Music_TV_Awards ORDER BY mem_name ASC;
-- SELECT * FROM Idol_Information ORDER BY mem_name ASC;

-- SELECT *
-- FROM Idol_Information
-- 	INNER JOIN Music_TV_Awards
--    ON Idol_Information.mem_name = Music_TV_Awards.mem_name;

-- 2020-01-01 이상
-- SELECT mem_name, debut_date
-- FROM Idol_Information
-- WHERE debut_date >= '2020-01-01';

-- JYP Entertainment
SELECT mem_name, mem_agency
FROM Idol_Information
WHERE mem_agency = 'JYP Entertainment';

