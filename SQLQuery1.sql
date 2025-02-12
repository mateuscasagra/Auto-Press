CREATE DATABASE Auto_Press
use Auto_Press;

CREATE TABLE timeRecord(
HorarioEntrada DATE NOT NULL,
HorarioSaida DATE NOT NULL
CONSTRAINT data_atualpk PRIMARY KEY(HorarioEntrada)

);

CREATE PROCEDURE insere_horario
AS 
	INSERT INTO timeRecord
	(HorarioEntrada, HorarioSaida)
	
	SELECT DATEADD(HOUR, -3, GETDATE())



GO;