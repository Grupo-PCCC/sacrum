USE master
GO
CREATE DATABASE SacrumDb_tests
GO
USE SacrumDb_tests
GO
CREATE TABLE TipoEntidad (
Id INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
Nombre VARCHAR (9) NOT NULL)

INSERT INTO TipoEntidad VALUES ('Feligres'), ('Proveedor'), ('Usuario')

CREATE TABLE Entidad (
Id INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
IdTipoEntidad INT FOREIGN KEY REFERENCES TipoEntidad(Id),
CodigoInterno VARCHAR (6),
Estado BIT NOT NULL)

CREATE TABLE Feligres (
Id INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
CodigoInterno VARCHAR (6),
Nombre VARCHAR (30) NOT NULL,
Apellido VARCHAR (30) NOT NULL,
Observaciones VARCHAR (120))

CREATE TABLE Proveedor (
Id INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
CodigoInterno VARCHAR (6),
RazonSocial VARCHAR (50) NOT NULL,
Observaciones VARCHAR (120))

CREATE TABLE TipoUsuario (
Id INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
Nombre VARCHAR (14) NOT NULL)

INSERT INTO TipoUsuario VALUES ('Administrador'),('Operador')

CREATE TABLE Usuario (
Id INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
CodigoInterno VARCHAR (6),
Nombre VARCHAR (30) NOT NULL,
Apellido VARCHAR (30) NOT NULL,
Nick VARCHAR (15),
Contrasenia VARCHAR (255),
IdTipoUsuario INT FOREIGN KEY REFERENCES TipoUsuario(Id))

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

CREATE PROC NuevaEntidad
@Nombre VARCHAR (30),
@Apellido VARCHAR (30),
@Observaciones VARCHAR (120),
@IdTipoEntidad INT,
@Tabla VARCHAR (30),
@RazonSocial VARCHAR (30),
@Nick VARCHAR (15),
@Contrasenia VARCHAR (255),
@IdTipoUsuario INT
AS
DECLARE @IdEntidad INT
DECLARE @IdEntidades INT
DECLARE @CodigoInterno VARCHAR (6)
INSERT INTO Entidad (IdTipoEntidad, Estado) VALUES (@IdTipoEntidad,1)
SELECT @IdEntidad = SCOPE_IDENTITY()
SELECT @IdEntidad
If @Tabla  = 'Feligres' 
BEGIN
INSERT INTO Feligres(Nombre, Apellido, Observaciones) VALUES (@Nombre,@Apellido,@Observaciones)
SELECT @IdEntidades = SCOPE_IDENTITY()
SELECT @CodigoInterno = ('F'+RIGHT('-'+CONVERT(VARCHAR, @IdEntidades),(4)))
UPDATE Feligres SET CodigoInterno=@CodigoInterno WHERE Id=@IdEntidades
UPDATE Entidad SET CodigoInterno=@CodigoInterno WHERE Id=@IdEntidad
END
Else If @Tabla  = 'Proveedor'
BEGIN
INSERT INTO Proveedor(RazonSocial, Observaciones) VALUES (@RazonSocial,@Observaciones)
SELECT @IdEntidades = SCOPE_IDENTITY()
SELECT @CodigoInterno = ('P'+RIGHT('-'+CONVERT(VARCHAR, @IdEntidades),(4)))
UPDATE Proveedor SET CodigoInterno=@CodigoInterno WHERE Id=@IdEntidades
UPDATE Entidad SET CodigoInterno=@CodigoInterno WHERE Id=@IdEntidad
END
Else If @Tabla  = 'Usuario'
BEGIN
INSERT INTO Usuario(Nombre, Apellido, Nick, Contrasenia, IdTipoUsuario) VALUES (@Nombre, @Apellido, @Nick, @Contrasenia, @IdTipoUsuario)
SELECT @IdEntidades = SCOPE_IDENTITY()
SELECT @CodigoInterno = ('U'+RIGHT('-'+CONVERT(VARCHAR, @IdEntidades),(4)))
UPDATE Usuario SET CodigoInterno=@CodigoInterno WHERE Id=@IdEntidades
UPDATE Entidad SET CodigoInterno=@CodigoInterno WHERE Id=@IdEntidad
END
GO

EXEC NuevaEntidad null,null,'proveedor',2,'Proveedor','proveedor',null,null,null
EXEC NuevaEntidad 'feligres','feligres','prueba',1,'Feligres',null,null,null,null
EXEC NuevaEntidad 'usuario','usuario',null,3,'Usuario',null,'usuario','contraseña',1

INSERT INTO DatoEntidad VALUES (5,2,'sarasa@gmail.com','mail de juan')

CREATE PROC NuevoDatoEntidad
@IdEntidad INT,
@IdTipoDatoEntidad INT,
@Valor VARCHAR (100),
@Detalle VARCHAR (20)
AS
INSERT INTO DatoEntidad VALUES (@IdEntidad,@IdTipoDatoEntidad,@Valor,@Detalle)
GO
