USE SacrumDb_tests
GO
-- INICIAR SESIÓN --

CREATE PROC IniciarSesion
@Nick VARCHAR (15),
@Contrasenia VARCHAR (255)
AS
SELECT * FROM Usuario U
WHERE U.Nick COLLATE SQL_Latin1_General_CP1_CS_AS= @Nick AND U.Contrasenia 
COLLATE SQL_Latin1_General_CP1_CS_AS = @Contrasenia
GO



-- NUEVA ENTIDAD --
CREATE PROC NuevaEntidad
--FELIGRESES--
@Nombre VARCHAR (30),
@Apellido VARCHAR (30),
@FechaNacimiento DATE,
@IdTipoDocumento INT,
@Documento VARCHAR (20),
@Vivo BIT,
@EsContacto BIT,
--FALLECIDOS--
@FechaFallecimiento DATE,
@FechaIngresoCinerario DATE,
@Contribuyo BIT,
@IdMovimientoMonetario INT,
--PROVEEDORES--
@RazonSocial VARCHAR (30),
--USUARIO--
@Nick VARCHAR (15),
@Contrasenia VARCHAR (255),
@IdTipoUsuario INT,
--GENERICOS--
@Observaciones VARCHAR (120),
@IdTipoEntidad INT,
@Tabla VARCHAR (30)
AS
DECLARE @IdEntidad INT
DECLARE @IdEntidades INT
DECLARE @CodigoInterno VARCHAR (6)
INSERT INTO Entidad (IdTipoEntidad, Estado) VALUES (@IdTipoEntidad,1)
SELECT @IdEntidad = SCOPE_IDENTITY()
SELECT @IdEntidad
If @Tabla  = 'Feligres'
BEGIN
INSERT INTO Feligres(Nombre, Apellido, FechaNacimiento, Documento, IdTipoDocumento, Observaciones, Vivo, EsContacto) VALUES (@Nombre, @Apellido, @FechaNacimiento, @Documento, @IdTipoDocumento, @Observaciones, @Vivo, @EsContacto)
SELECT @IdEntidades = SCOPE_IDENTITY()
SELECT @CodigoInterno = ('FEL'+RIGHT('-'+CONVERT(VARCHAR, @IdEntidades),(4)))
UPDATE Feligres SET CodigoInterno=@CodigoInterno, IdEntidad=@IdEntidad WHERE Id=@IdEntidades
UPDATE Entidad SET CodigoInterno=@CodigoInterno WHERE Id=@IdEntidad
END
ELSE IF @Tabla  = 'Proveedor'
BEGIN
INSERT INTO Proveedor(RazonSocial, Observaciones) VALUES (@RazonSocial,@Observaciones)
SELECT @IdEntidades = SCOPE_IDENTITY()
SELECT @CodigoInterno = ('PRO'+RIGHT('-'+CONVERT(VARCHAR, @IdEntidades),(4)))
UPDATE Proveedor SET CodigoInterno=@CodigoInterno, IdEntidad=@IdEntidad WHERE Id=@IdEntidades
UPDATE Entidad SET CodigoInterno=@CodigoInterno WHERE Id=@IdEntidad
END
ELSE IF @Tabla  = 'Fallecido'
BEGIN
INSERT INTO Fallecido(Nombre, Apellido, Documento, FechaFallecimiento, FechaIngresoCinerario, Observaciones, Contribuyo, IdMovimientoMonetario, IdTipoDocumento) VALUES (@Nombre, @Apellido, @Documento, @FechaFallecimiento, @FechaIngresoCinerario, @Observaciones, @Contribuyo, @IdMovimientoMonetario, @IdTipoDocumento)
SELECT @IdEntidades = SCOPE_IDENTITY()
SELECT @CodigoInterno = ('FAL'+RIGHT('-'+CONVERT(VARCHAR, @IdEntidades),(4)))
UPDATE Proveedor SET CodigoInterno=@CodigoInterno, IdEntidad=@IdEntidad WHERE Id=@IdEntidades
UPDATE Entidad SET CodigoInterno=@CodigoInterno WHERE Id=@IdEntidad
END
ELSE IF @Tabla  = 'Usuario'
BEGIN
INSERT INTO Usuario(Nombre, Apellido, Nick, Contrasenia, IdTipoUsuario) VALUES (@Nombre, @Apellido, @Nick, @Contrasenia, @IdTipoUsuario)
SELECT @IdEntidades = SCOPE_IDENTITY()
SELECT @CodigoInterno = ('USU'+RIGHT('-'+CONVERT(VARCHAR, @IdEntidades),(4)))
UPDATE Usuario SET CodigoInterno=@CodigoInterno, IdEntidad=@IdEntidad WHERE Id=@IdEntidades
UPDATE Entidad SET CodigoInterno=@CodigoInterno WHERE Id=@IdEntidad
END
GO

--CÓMO USARLO--
--Los datos que no sean propios de la entidad, se envían como NULL. Los que sí, se llenan. Respetar el ORDEN.

--Agrego un proveedor--
--RazonSocial, Observaciones--
EXEC NuevaEntidad null,null,null,null,null,null,null,null,null,null,null,'Casa de Monjas',null,null,null,'Llamar de 12 a 17',2,'Proveedor'
GO
--Agrego un feligrés--
--Nombre, Apellido, FechaNacimiento, IdTipoDocumento, IdTipoDocumento,Vivo, EsContacto--
EXEC NuevaEntidad 'Darío','Benítez', '05/05/1980',1,'3045567656',1,0,null,null,null,null,null,null,null,null,'Buen muchacho',1,'Feligres'
GO
--Agrego un usuario--
--Nombre, Apellido, Nick, Contraseña, IdTipoUsuario--
EXEC NuevaEntidad 'Iván','Rodríguez',null,null,null,null,null,null,null,null,null,'irodriguez','1234abc',1,null,3,'Usuario'
GO
--Agrego un fallecido--
EXEC NuevaEntidad 'Darío','Benítez',null,1,'38440987',null,null,'06/06/2019','03/09/2020',0,null,null,null,null,null,'No han contribuído porque son pobres',4,'Fallecido'
GO

-- MODIFICAR ENTIDAD --
CREATE PROC ModificarEntidad
--FELIGRESES--
@Nombre VARCHAR (30),
@Apellido VARCHAR (30),
@FechaNacimiento DATE,
@IdTipoDocumento INT,
@Documento VARCHAR (20),
@Vivo BIT,
@EsContacto BIT,
--FALLECIDOS--
@FechaFallecimiento DATE,
@FechaIngresoCinerario DATE,
@Contribuyo BIT,
@IdMovimientoMonetario INT,
--PROVEEDORES--
@RazonSocial VARCHAR (30),
--USUARIO--
@Nick VARCHAR (15),
@Contrasenia VARCHAR (255),
@IdTipoUsuario INT,
--GENERICOS--
@Observaciones VARCHAR (120),
@IdTipoEntidad INT,
@Tabla VARCHAR (30),
@IdEntidad INT
AS
IF @Tabla  = 'Feligres'
BEGIN
UPDATE Feligres 
SET Nombre=@Nombre, Apellido=@Apellido, FechaNacimiento=@FechaNacimiento, Documento=@Documento, IdTipoDocumento=@IdTipoDocumento, Observaciones=@Observaciones, Vivo=@Vivo, EsContacto=@EsContacto
WHERE IdEntidad=@IdEntidad
END
ELSE IF @Tabla = 'Proveedor'
UPDATE Proveedor
SET RazonSocial=@RazonSocial, Observaciones=@Observaciones




















/*
CREATE PROC NuevoDatoEntidad
@IdEntidad INT,
@IdTipoDatoEntidad INT,
@Valor VARCHAR (100),
@Detalle VARCHAR (20)
AS
INSERT INTO DatoEntidad VALUES (@IdEntidad,@IdTipoDatoEntidad,@Valor,@Detalle)
GO
*/