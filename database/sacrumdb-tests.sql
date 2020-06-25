CREATE DATABASE SacrumDb_tests

USE SacrumDb_tests

CREATE TABLE TipoPersona (
Id INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
Nombre VARCHAR (9) NOT NULL)

INSERT INTO TipoPersona VALUES ('Feligres')
INSERT INTO TipoPersona VALUES ('Proveedor')

CREATE TABLE Persona (
Id INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
IdTipoPersona INT FOREIGN KEY REFERENCES TipoPersona(Id))

CREATE TABLE Feligres (
CodigoInterno AS ('F'+RIGHT('-'+CONVERT(VARCHAR, IdPersona),(4))),
Nombre VARCHAR (30) NOT NULL,
Apellido VARCHAR (120) NOT NULL,
Observaciones VARCHAR (30) NOT NULL,
IdPersona INT FOREIGN KEY REFERENCES Persona(Id))

CREATE PROC NuevoFeligres
@Nombre VARCHAR (30),
@Apellido VARCHAR (30),
@Observaciones VARCHAR (120)
AS
DECLARE @IdPersona INT
INSERT INTO Persona VALUES (1)
SELECT @IdPersona = SCOPE_IDENTITY()
SELECT @IdPersona
INSERT INTO Feligres VALUES (@Nombre,@Apellido,@Observaciones,@IdPersona)
GO

CREATE TABLE TipoDatoPersona (
Id INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
Nombre VARCHAR (30) NOT NULL)

INSERT INTO TipoDatoPersona VALUES ('Tel�fono'), ('Mail'), ('Direcci�n')

CREATE TABLE DatoPersona (
Id INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
IdPersona INT FOREIGN KEY REFERENCES Persona(Id) NOT NULL,
IdTipoDatoPersona INT FOREIGN KEY REFERENCES TipoDatoPersona(Id) NOT NULL,
Valor VARCHAR (100) NOT NULL,
Detalle VARCHAR (20))

CREATE PROC NuevoDatoPersona
@IdPersona INT,
@IdTipoDatoPersona INT,
@Valor VARCHAR (100),
@Detalle VARCHAR (20)
AS
INSERT INTO DatoPersona VALUES (@IdPersona,@IdTipoDatoPersona,@Valor,@Detalle)
GO