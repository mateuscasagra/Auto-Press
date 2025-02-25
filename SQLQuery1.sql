CREATE DATABASE Auto_Press;
USE Auto_Press;

CREATE TABLE TimeRecord(
    Dia DATE PRIMARY KEY,
<<<<<<< HEAD
    HoraEntrada TIME(0),
    HoraSaida TIME(0),
    TotalHora TIME(0)
=======
    TempoEntrada DATETIME,
    TempoSaida DATETIME,
    TotalHora DECIMAL(4,2)
>>>>>>> 7e294d0380d0c06424b1c558b169196e845a0a84
);

CREATE TABLE Tasks(
    Id INT PRIMARY KEY IDENTITY NOT NULL,
    Nome VARCHAR(100) NOT NULL,
    Descricao VARCHAR(500),
<<<<<<< HEAD
	[Status] BIT
=======
    [Status] BIT
>>>>>>> 7e294d0380d0c06424b1c558b169196e845a0a84
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
<<<<<<< HEAD
    INSERT INTO TimeRecord(Dia, HoraEntrada)
    SELECT GETDATE() as Dia, FORMAT(GETDATE(), 'HH:mm:ss') as HoraEntrada
END;


EXEC AddTime

SELECT * FROM TimeRecord
SELECT * FROM TasksDay
delete from TimeRecord
delete from TasksDay
drop table TimeRecord
=======
    INSERT INTO TimeRecord(Dia, TempoEntrada)
    SELECT GETDATE() as Dia, DATEADD(HOUR, -3, GETDATE()) as TempoEntrada
END;
>>>>>>> 7e294d0380d0c06424b1c558b169196e845a0a84
