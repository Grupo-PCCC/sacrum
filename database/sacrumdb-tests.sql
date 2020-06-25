CREATE DATABASE SacrumDb_tests
GO
USE SacrumDb_tests
GO
CREATE TABLE TipoEntidad (
Id INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
Nombre VARCHAR (9) NOT NULL)

INSERT INTO TipoEntidad VALUES ('Feligres')
INSERT INTO TipoEntidad VALUES ('Proveedor')

CREATE TABLE Entidad (
Id INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
IdTipoEntidad INT FOREIGN KEY REFERENCES TipoEntidad(Id),
Estado BIT NOT NULL)

CREATE TABLE Feligres (
CodigoInterno AS ('F'+RIGHT('-'+CONVERT(VARCHAR, IdEntidad),(4))),
Nombre VARCHAR (30) NOT NULL,
Apellido VARCHAR (30) NOT NULL,
Observaciones VARCHAR (120) NOT NULL,
IdEntidad INT FOREIGN KEY REFERENCES Entidad(Id))

CREATE TABLE Proveedor (
CodigoInterno AS ('P'+RIGHT('-'+CONVERT(VARCHAR, IdEntidad),(4))),
RazonSocial VARCHAR (50) NOT NULL,
Observaciones VARCHAR (120) NOT NULL,
IdEntidad INT FOREIGN KEY REFERENCES Entidad(Id))

CREATE TABLE TipoDatoEntidad (
Id INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
Nombre VARCHAR (30) NOT NULL)

INSERT INTO TipoDatoEntidad VALUES ('Teléfono'), ('Mail'), ('Dirección')

CREATE TABLE DatoEntidad (
Id INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
IdEntidad INT FOREIGN KEY REFERENCES Entidad(Id) NOT NULL,
IdTipoDatoEntidad INT FOREIGN KEY REFERENCES TipoDatoEntidad(Id) NOT NULL,
Valor VARCHAR (100) NOT NULL,
Detalle VARCHAR (20))

CREATE PROC NuevoDatoEntidad
@IdEntidad INT,
@IdTipoDatoEntidad INT,
@Valor VARCHAR (100),
@Detalle VARCHAR (20)
AS
INSERT INTO DatoEntidad VALUES (@IdEntidad,@IdTipoDatoEntidad,@Valor,@Detalle)
GO

CREATE PROC NuevoFeligres
@Nombre VARCHAR (30),
@Apellido VARCHAR (30),
@Observaciones VARCHAR (120)
AS
DECLARE @IdEntidad INT
INSERT INTO Entidad VALUES (1)
SELECT @IdEntidad = SCOPE_IDENTITY()
SELECT @IdEntidad
INSERT INTO Feligres VALUES (@Nombre,@Apellido,@Observaciones,@IdEntidad)
GO

CREATE PROC NuevaEntidad
@Nombre VARCHAR (30),
@Apellido VARCHAR (30),
@Observaciones VARCHAR (120),
@IdTipoEntidad INT
AS
DECLARE @IdEntidad INT
INSERT INTO Entidad VALUES (@IdTipoEntidad,1)
SELECT @IdEntidad = SCOPE_IDENTITY()
SELECT @IdEntidad
IF @IdTipoEntidad=1
INSERT INTO Feligres VALUES (@Nombre,@Apellido,@Observaciones,@IdEntidad)
ELSE
PRINT 'era un proveedor'
GO

EXEC NuevaEntidad 'proveedor','proveedor','proveedor',2

CREATE PROC EditarFeligres
@Nombre VARCHAR (30),
@Apellido VARCHAR (30),
@Observaciones VARCHAR (120),
@IdEntidad INT
AS
UPDATE Feligres SET Nombre=@Nombre Apellido=@Apellido Observaciones=@Observaciones WHERE IdEntidad=@IdEntidad
GO