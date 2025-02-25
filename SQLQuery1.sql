CREATE DATABASE Auto_Press;
USE Auto_Press;

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

GO

CREATE PROCEDURE AddTime
AS
BEGIN
    INSERT INTO TimeRecord(Dia, TempoEntrada)
    SELECT GETDATE() as Dia, DATEADD(HOUR, -3, GETDATE()) as TempoEntrada
END;
