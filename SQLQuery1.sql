CREATE DATABASE Auto_Press;
USE Auto_Press;

CREATE TABLE TimeRecord(
    Dia DATE PRIMARY KEY,
    HoraEntrada TIME(0),
    HoraSaida TIME(0),
    TotalHora TIME(0)
);

CREATE TABLE Tasks(
    Id INT PRIMARY KEY IDENTITY NOT NULL,
    Nome VARCHAR(100) NOT NULL,
    Descricao VARCHAR(500),
	[Status] BIT
);

CREATE TABLE TasksDay (
    TaskId INT,
    Dia DATE,
    PRIMARY KEY (TaskId, Dia),
    FOREIGN KEY (TaskId) REFERENCES Tasks(Id),
    FOREIGN KEY (Dia) REFERENCES TimeRecord(Dia)
);

GO

CREATE PROCEDURE AddTime
AS
BEGIN
    INSERT INTO TimeRecord(Dia, HoraEntrada)
    SELECT GETDATE() as Dia, FORMAT(GETDATE(), 'HH:mm:ss') as HoraEntrada
END;


EXEC AddTime

SELECT * FROM TimeRecord
SELECT * FROM TasksDay
delete from TimeRecord
delete from TasksDay
drop table TimeRecord