CREATE DATABASE Auto_Press
use Auto_Press;


INSERT timeRecord(HorarioEntrada, HorarioSaida)
VALUES('2025-01-01 08:00:00','2025-01-01 08:00:00');

INSERT workTime(Dia,totalHora);
VALUES('2025-01-01 08:00:00','2025-01-01 08:00:00');

CREATE TABLE timeRecord(
	Id INT IDENTITY,
	HorarioEntrada DATE NOT NULL,
	HorarioSaida DATE
	CONSTRAINT data_atualpk PRIMARY KEY(Id)
);

CREATE TABLE workTime(
	Id INT IDENTITY,
	Dia DATE NOT NULL,
	totalHora HOUR NOT NULL
	CONSTRAINT work_timepk PRIMARY KEY(Id)
)

CREATE PROCEDURE time_record_entrada
AS 
	INSERT INTO timeRecord
	(HorarioEntrada)
	SELECT DATEADD(HOUR, -3, GETDATE())

END;
GO


CREATE PROCEDURE time_record_saida
AS 
	INSERT INTO timeRecord
	(HorarioSaida)
	SELECT DATEADD(HOUR, -3, GETDATE())

END;
GO

CREATE PROCEDURE work_time 
AS 
	INSERT INTO(Dia, totalHora)
	SELECT GETDATE() as Dia, CASE ISNULL(totalHora) = GETDATE DATEADD(HOUR, -3, GETDATE())


