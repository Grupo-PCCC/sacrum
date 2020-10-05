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
INSERT INTO TipoEntidad VALUES ('Feligres'), ('Proveedor'), ('Usuario'), ('Fallecido')
GO
CREATE TABLE Entidad (
Id INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
IdTipoEntidad INT FOREIGN KEY REFERENCES TipoEntidad(Id),
CodigoInterno VARCHAR (8),
Estado BIT NOT NULL)
GO
CREATE TABLE TipoDocumento (
Id INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
Nombre VARCHAR (3)
)
GO
INSERT INTO TipoDocumento VALUES ('DNI'), ('LC'), ('LE'), ('PAS')
GO
CREATE TABLE Feligres (
Id INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
CodigoInterno VARCHAR (8),
Nombre VARCHAR (30) NOT NULL,
Apellido VARCHAR (30) NOT NULL,
FechaNacimiento DATE,
Documento VARCHAR (20) NOT NULL,
IdTipoDocumento INT FOREIGN KEY REFERENCES TipoDocumento(Id) NOT NULL,
Observaciones VARCHAR (120),
Vivo BIT NOT NULL,--Si el fallecido es un feligrés, se cargan los datos automáticamente y cambia: Vivo=0. Copia un nuevo fallecido con los mismos datos.
IdEntidad INT FOREIGN KEY REFERENCES Entidad(Id),
EsContacto BIT NOT NULL)
GO
CREATE TABLE Proveedor (
Id INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
CodigoInterno VARCHAR (8),
RazonSocial VARCHAR (50) NOT NULL,
Observaciones VARCHAR (120),
IdEntidad INT FOREIGN KEY REFERENCES Entidad(Id))
GO
CREATE TABLE TipoUsuario (
Id INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
Nombre VARCHAR (14) NOT NULL)
GO
INSERT INTO TipoUsuario VALUES ('Administrador'),('Operador')
GO
CREATE TABLE Usuario (
Id INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
CodigoInterno VARCHAR (8),
Nombre VARCHAR (30) NOT NULL,
Apellido VARCHAR (30) NOT NULL,
Nick VARCHAR (15),
Contrasenia VARCHAR (255),
IdTipoUsuario INT FOREIGN KEY REFERENCES TipoUsuario(Id) NOT NULL,
IdEntidad INT FOREIGN KEY REFERENCES Entidad(Id))
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
CREATE TABLE Fallecido (
Id INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
CodigoInterno VARCHAR (8),
Nombre VARCHAR (30) NOT NULL,
Apellido VARCHAR (30) NOT NULL,
Documento VARCHAR (20) NOT NULL,
FechaFallecimiento DATE NOT NULL,
FechaIngresoCinerario DATE NOT NULL,
Observaciones VARCHAR (120),
Contribuyo BIT NOT NULL,
IdMovimientoMonetario INT FOREIGN KEY REFERENCES MovimientoMonetario(Id),
IdTipoDocumento INT FOREIGN KEY REFERENCES TipoDocumento(Id) NOT NULL,
IdEntidad INT FOREIGN KEY REFERENCES Entidad(Id))
GO
CREATE TABLE ContactoFallecido (
IdFeligres INT FOREIGN KEY REFERENCES Feligres(Id) NOT NULL,
IdFallecido INT FOREIGN KEY REFERENCES Fallecido(Id) NOT NULL
)
GO
CREATE TABLE TipoDatoEntidad (
Id INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
Nombre VARCHAR (9) NOT NULL)
GO
INSERT INTO TipoDatoEntidad VALUES ('Principal'), ('Otro')
GO
CREATE TABLE DatoEntidad (
Id INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
IdEntidad INT FOREIGN KEY REFERENCES Entidad(Id) NOT NULL,
IdTipoDatoEntidad INT FOREIGN KEY REFERENCES TipoDatoEntidad(Id) NOT NULL,
NombreDato VARCHAR (4) NOT NULL, --(tel,mail,dire. Lo mandamos desde la APP)
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
CREATE TABLE Auditoria
(
Id INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
Fecha DATETIME NOT NULL,
Accion VARCHAR (240) NOT NULL,
IdUsuario INT FOREIGN KEY REFERENCES Usuario(Id) NOT NULL
)
GO