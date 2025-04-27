CREATE TABLE maszkos(
    [LOGIN] NVARCHAR(255) MASKED WITH (Function = 'partial(1,"XXX",1)') NOT NULL,
    EMAIL NVARCHAR(255) MASKED WITH (function = 'email()') NOT NULL,
    NEV NVARCHAR(255) MASKED WITH (Function = 'default()') NOT NULL,
    SZULEV int MASKED WITH (FUNCTION = 'random(1,5)') NULL,
    NEM NVARCHAR(1) NULL,
    CIM NVARCHAR(255) NULL,
    PRIMARY KEY([LOGIN])
)

INSERT INTO maszkos ([LOGIN],EMAIL,NEV, SZULEV, NEM, CIM)
SELECT [LOGIN], EMAIL, NEV, SZULEV, NEM, CIM
FROM Ugyfel;

CREATE USER  maszkosfelhasznalo WITHOUT LOGIN;

GRANT SELECT ON maszkos TO maszkosfelhasznalo;


EXECUTE AS USER ='maszkosfelhasznalo';
SELECT * FROM maszkos;
REVERT;