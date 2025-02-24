CREATE DATABASE Auto_Press
use Auto_Press;


CREATE TABLE TimeRecord(
	Dia DATE PRIMARY KEY,
	TempoEntrada DATETIME,
	TempoSaida DATETIME,
	TotalHora DECIMAL(4,2)
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

