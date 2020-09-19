USE master
GO
CREATE DATABASE SacrumDb_tests
GO
USE SacrumDb_tests
GO
CREATE TABLE TipoEntidad (
Id INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
Nombre VARCHAR (9) NOT NULL)
GO
INSERT INTO TipoEntidad VALUES ('Feligres'), ('Proveedor'), ('Usuario')
GO
CREATE TABLE Entidad (
Id INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
IdTipoEntidad INT FOREIGN KEY REFERENCES TipoEntidad(Id),
CodigoInterno VARCHAR (6),
Estado BIT NOT NULL)
GO
CREATE TABLE Feligres (
Id INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
CodigoInterno VARCHAR (6),
Nombre VARCHAR (30) NOT NULL,
Apellido VARCHAR (30) NOT NULL,
Observaciones VARCHAR (120),
IdEntidad INT FOREIGN KEY REFERENCES Entidad(Id) NOT NULL)
GO
CREATE TABLE Proveedor (
Id INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
CodigoInterno VARCHAR (6),
RazonSocial VARCHAR (50) NOT NULL,
Observaciones VARCHAR (120),
IdEntidad INT FOREIGN KEY REFERENCES Entidad(Id) NOT NULL)
GO
CREATE TABLE TipoDocumento (
Id INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
Nombre VARCHAR (3)
)
GO
CREATE TABLE Fallecido (
Id INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
CodigoInterno VARCHAR (6),
Nombre VARCHAR (50) NOT NULL,
Apellido VARCHAR (50) NOT NULL,
Documento VARCHAR (20) NOT NULL,
FechaFallecimiento DATE NOT NULL,
FechaIngresoCinerario DATE NOT NULL,
Observaciones VARCHAR (120),
Contribuyo BIT NOT NULL,
IdTipoDocumento INT FOREIGN KEY REFERENCES TipoDocumento(Id) NOT NULL,
IdEntidad INT FOREIGN KEY REFERENCES Entidad(Id) NOT NULL)
GO
CREATE TABLE ContactoFallecido (
Id INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
CodigoInterno VARCHAR (6),
Nombre VARCHAR (50) NOT NULL,
Apellido VARCHAR (50) NOT NULL,
Observaciones VARCHAR (120),
IdEntidad INT FOREIGN KEY REFERENCES Entidad(Id) NOT NULL
)
CREATE TABLE TipoUsuario (
Id INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
Nombre VARCHAR (14) NOT NULL)
GO
INSERT INTO TipoUsuario VALUES ('Administrador'),('Operador')
GO
CREATE TABLE Usuario (
Id INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
CodigoInterno VARCHAR (6),
Nombre VARCHAR (30) NOT NULL,
Apellido VARCHAR (30) NOT NULL,
Nick VARCHAR (15),
Contrasenia VARCHAR (255),
IdTipoUsuario INT FOREIGN KEY REFERENCES TipoUsuario(Id) NOT NULL,
IdEntidad INT FOREIGN KEY REFERENCES Entidad(Id) NOT NULL)
GO
CREATE TABLE TipoDatoEntidad (
Id INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
Nombre VARCHAR (30) NOT NULL)
GO
INSERT INTO TipoDatoEntidad VALUES ('Tel�fono'), ('Mail'), ('Direcci�n')
GO
CREATE TABLE DatoEntidad (
Id INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
IdEntidad INT FOREIGN KEY REFERENCES Entidad(Id) NOT NULL,
IdTipoDatoEntidad INT FOREIGN KEY REFERENCES TipoDatoEntidad(Id) NOT NULL,
Valor VARCHAR (100) NOT NULL,
Detalle VARCHAR (20))
GO
CREATE TABLE Actividad
(
Id INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
Nombre VARCHAR (50) NOT NULL,
Observacion VARCHAR (120)
)
GO
CREATE TABLE FeligresesPorActividad
(
IdFeligres INT FOREIGN KEY REFERENCES Feligres(Id) NOT NULL,
IdActividad INT FOREIGN KEY REFERENCES Actividad(Id) NOT NULL,
)
GO
CREATE TABLE TipoCategoria
(
Id INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
Nombre VARCHAR (7) NOT NULL,
)
GO
INSERT INTO TipoCategoria VALUES ('Ingreso'), ('Egreso')
GO
CREATE TABLE Categoria
(
Id INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
Nombre VARCHAR (30) NOT NULL,
IdTipoCategoria INT FOREIGN KEY REFERENCES TipoCategoria(Id) NOT NULL
)
GO
CREATE TABLE MovimientoMonetario
(
Id INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
Valor FLOAT NOT NULL,
Fecha DATE NOT NULL,
Observacion VARCHAR (120),
IdUsuario INT FOREIGN KEY REFERENCES Usuario(Id) NOT NULL,
IdCategoria INT FOREIGN KEY REFERENCES Categoria(Id) NOT NULL
)
GO
CREATE TABLE Auditoria
(
Id INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
Fecha DATETIME NOT NULL,
Accion VARCHAR (240) NOT NULL,
IdUsuario INT FOREIGN KEY REFERENCES Usuario(Id) NOT NULL
)
GO
