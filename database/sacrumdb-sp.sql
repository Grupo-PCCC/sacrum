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
@Vivo INT,
@EsContacto INT,
--FALLECIDOS--
@FechaFallecimiento DATE,
@FechaIngresoCinerario DATE,
@Contribuyo INT,
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
INSERT INTO Feligres(Nombre, Apellido, FechaNacimiento, IdTipoDocumento, Documento , Observaciones, Vivo, EsContacto) VALUES (@Nombre, @Apellido, @FechaNacimiento, @IdTipoDocumento , @Documento , @Observaciones, @Vivo, @EsContacto)
SELECT @IdEntidades = SCOPE_IDENTITY()
SELECT @CodigoInterno = ('FEL'+RIGHT('-'+CONVERT(VARCHAR, @IdEntidades),(10)))
UPDATE Feligres SET CodigoInterno=@CodigoInterno, IdEntidad=@IdEntidad WHERE Id=@IdEntidades
UPDATE Entidad SET CodigoInterno=@CodigoInterno WHERE Id=@IdEntidad
END
ELSE IF @Tabla  = 'Proveedor'
BEGIN
INSERT INTO Proveedor(RazonSocial, Observaciones) VALUES (@RazonSocial,@Observaciones)
SELECT @IdEntidades = SCOPE_IDENTITY()
SELECT @CodigoInterno = ('PRO'+RIGHT('-'+CONVERT(VARCHAR, @IdEntidades),(10)))
UPDATE Proveedor SET CodigoInterno=@CodigoInterno, IdEntidad=@IdEntidad WHERE Id=@IdEntidades
UPDATE Entidad SET CodigoInterno=@CodigoInterno WHERE Id=@IdEntidad
END
ELSE IF @Tabla  = 'Fallecido'
BEGIN
INSERT INTO Fallecido(Nombre, Apellido, Documento, FechaFallecimiento, FechaIngresoCinerario, Observaciones, Contribuyo, IdMovimientoMonetario, IdTipoDocumento) VALUES (@Nombre, @Apellido, @Documento, @FechaFallecimiento, @FechaIngresoCinerario, @Observaciones, @Contribuyo, @IdMovimientoMonetario, @IdTipoDocumento)
SELECT @IdEntidades = SCOPE_IDENTITY()
SELECT @CodigoInterno = ('FAL'+RIGHT('-'+CONVERT(VARCHAR, @IdEntidades),(10)))
UPDATE Fallecido SET CodigoInterno=@CodigoInterno, IdEntidad=@IdEntidad WHERE Id=@IdEntidades
UPDATE Entidad SET CodigoInterno=@CodigoInterno WHERE Id=@IdEntidad
END
ELSE IF @Tabla  = 'Usuario'
BEGIN
INSERT INTO Usuario(Nombre, Apellido, Nick, Contrasenia, IdTipoUsuario) VALUES (@Nombre, @Apellido, @Nick, @Contrasenia, @IdTipoUsuario)
SELECT @IdEntidades = SCOPE_IDENTITY()
SELECT @CodigoInterno = ('USU'+RIGHT('-'+CONVERT(VARCHAR, @IdEntidades),(10)))
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
--Nombre, Apellido, FechaNacimiento, IdTipoDocumento, Documento,Vivo, EsContacto--
EXEC NuevaEntidad 'Darío','Benítez', '05/05/1980',1,'3045567656',1,0,null,null,null,null,null,null,null,null,'Buen muchacho',1,'Feligres'
GO
--Agrego un usuario--
--Nombre, Apellido, Nick, Contraseña, IdTipoUsuario--
EXEC NuevaEntidad 'Iván','Rodríguez',null,null,null,null,null,null,null,null,null,null,'irodriguez','1234abc',1,null,3,'Usuario'
GO
--Agrego un fallecido--
EXEC NuevaEntidad 'Darío','Benítez',null,1,'38440987',null,null,'06/06/2019','03/09/2020',0,null,null,null,null,null,'No han contribuído porque son pobres',4,'Fallecido'
GO


--- BUSCAR ENTIDAD ---
CREATE PROC BuscarEntidadId
@IdEntidad Int
AS
SELECT F.Id, F.CodigoInterno AS [Codigo Interno], F.Nombre, F.Apellido, F.FechaNacimiento AS [Fecha de nacimiento], TD.Nombre AS [Tipo de documento], F.Documento, TEL.Valor AS Telefono, TEL.Id AS IdTel, MAI.Valor AS Mail, MAI.Id AS IdMail, DIR.Valor AS Direccion, DIR.Id AS IdDir, F.Observaciones, F.Vivo, F.IdEntidad, F.EsContacto
FROM Feligres F
LEFT JOIN TipoDocumento TD
ON F.IdTipoDocumento=TD.Id
LEFT JOIN DatoEntidad TEL
ON TEL.IdTipoDatoEntidad=1
AND TEL.NombreDato='tel'
AND F.IdEntidad=TEL.IdEntidad
LEFT JOIN DatoEntidad AS MAI
ON MAI.IdTipoDatoEntidad=1
AND MAI.NombreDato='mail'
AND F.IdEntidad=MAI.IdEntidad
LEFT JOIN DatoEntidad AS DIR
ON DIR.IdTipoDatoEntidad=1
AND DIR.NombreDato='dire'
AND F.IdEntidad=DIR.IdEntidad
LEFT JOIN Entidad E
ON E.Id=F.IdEntidad
 WHERE F.IdEntidad = @IdEntidad
Go


--- MODIFICAR ENTIDAD --
CREATE PROC ModificarEntidad
---FELIGRESES--
@Nombre VARCHAR (30),
@Apellido VARCHAR (30),
@FechaNacimiento DATE,
@IdTipoDocumento INT,
@Documento VARCHAR (20),
@Vivo INT,
@EsContacto INT,
--FALLECIDOS--
@FechaFallecimiento DATE,
@FechaIngresoCinerario DATE,
@Contribuyo INT,
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
SET Nombre=@Nombre, Apellido=@Apellido, FechaNacimiento=@FechaNacimiento, IdTipoDocumento=@IdTipoDocumento, Documento=@Documento, Observaciones=@Observaciones, Vivo=@Vivo, EsContacto=@EsContacto
WHERE IdEntidad=@IdEntidad
END
ELSE IF @Tabla = 'Proveedor'
BEGIN
UPDATE Proveedor
SET RazonSocial=@RazonSocial, Observaciones=@Observaciones
WHERE IdEntidad=@IdEntidad
END
ELSE IF @Tabla = 'Usuario'
BEGIN
UPDATE Usuario
SET Nombre=@Nombre, Apellido=@Apellido, Nick=@Nick, Contrasenia=@Contrasenia, IdTipoUsuario=@IdTipoUsuario 
WHERE IdEntidad=@IdEntidad
END
ELSE IF @Tabla = 'Fallecido'
BEGIN
UPDATE Fallecido
SET Nombre=@Nombre, Apellido=@Apellido, FechaFallecimiento=@FechaFallecimiento, FechaIngresoCinerario=@FechaIngresoCinerario, Contribuyo=@Contribuyo, IdMovimientoMonetario=@IdMovimientoMonetario, Observaciones=@Observaciones 
WHERE IdEntidad=@IdEntidad
END
GO

--Modifico un proveedor--
--RazonSocial, Observaciones--
EXEC ModificarEntidad null,null,null,null,null,null,null,null,null,null,null,'Casa de Monjas modificado',null,null,null,'Llamar de 12 a 17',2,'Proveedor',1
GO
--Modifico un feligrés--
--Nombre, Apellido, FechaNacimiento, IdTipoDocumento, IdTipoDocumento,Vivo, EsContacto--
EXEC ModificarEntidad'Darío modificado','Benítez modificado', '05/05/1980',1,'3045567656',1,0,null,null,null,null,null,null,null,null,'Buen muchacho',1,'Feligres',2
GO
--Modifico un usuario--
--Nombre, Apellido, Nick, Contraseña, IdTipoUsuario--
EXEC ModificarEntidad 'Iván modificado','Rodríguez modificado',null,null,null,null,null,null,null,null,null,null,'irodriguez','1234abc',1,null,3,'Usuario',3
GO
--Modifico un fallecido--
EXEC ModificarEntidad 'Darío modificado','Benítez modificado',null,1,'38440987',null,null,'06/06/2019','03/09/2020',0,null,null,null,null,null,'No han contribuído porque son pobres',4,'Fallecido',4
GO



--CAMBIAR ESTADO DE ENTIDAD--
CREATE PROC CambiarEstadoEntidad
@IdEntidad INT,
@Estado INT
AS
UPDATE Entidad SET Estado=@Estado WHERE Id=@IdEntidad
GO
--Camio el estado de una entidad--
EXEC CambiarEstadoEntidad 1,0
GO

--NUEVO DATO ENTIDAD--
CREATE PROC NuevoDatoEntidad
@IdEntidad INT,
@IdTipoDatoEntidad INT,
@NombreDato VARCHAR (4),
@Valor VARCHAR (100),
@Detalle VARCHAR (20)
AS
INSERT INTO DatoEntidad VALUES (@IdEntidad,@IdTipoDatoEntidad,@NombreDato, @Valor,@Detalle)
GO

--Agrego un dato de una entidad--
EXEC NuevoDatoEntidad 2,1,'tel','46015151','Teléfono de la abuela'
GO

--VALIDAR QUE NO HAYA YA UN DATO PRINCIPAL PARA CIERTA ENTIDAD--
CREATE PROC ValidarTipoDeDato
@IdEntidad INT,
@NombreDato VARCHAR (4)
AS
SELECT * FROM DatoEntidad WHERE IdEntidad=@IdEntidad AND IdTipoDatoEntidad=1 AND NombreDato=@NombreDato
GO
--Con esto, logramos que no haya por ejemplo 2 teléfonos principales para el feligrés Pepito:--
EXEC ValidarTipoDeDato 1,'tel'
GO
--MODIFICAR DATO ENTIDAD--
create PROC ModificarDatoEntidad
@Id INT
@Valor VARCHAR (100)
as
UPDATE DatoEntidad SET Valor=@Valor WHERE Id=@Id
go

--BORRAR DATO ENTIDAD--
CREATE PROC BorrarDatoEntidad
@IdEntidad INT
AS
DELETE FROM DatoEntidad WHERE IdEntidad=@IdEntidad
GO

--Borro un dato de una entidad--
EXEC BorrarDatoEntidad 1
GO

--SP ESPECÍFICOS DE FELIGRESES--

--MARCAR COMO MUERTO A UN FELIGRÉS--
CREATE PROC FeligresMuerto
@IdFeligres INT,
@IdEntidad INT
AS
UPDATE Feligres SET Vivo=0 WHERE Id=@IdFeligres
UPDATE Entidad SET Estado=0 WHERE Id=@IdEntidad
GO

--Mato a un feligrés--
EXEC FeligresMuerto 1,2
GO

--SP ESPECÍFICOS DE CAJA--

--NUEVA CATEGORÍA--
CREATE PROC NuevaCategoria
@Nombre VARCHAR (30),
@IdTipoCategoria INT
AS
INSERT INTO Categoria VALUES (@Nombre, @IdTipoCategoria)
GO
--Agrego nuevas categorías--
EXEC NuevaCategoria 'Donación', 1
GO
EXEC NuevaCategoria 'Bautismos', 1
GO
EXEC NuevaCategoria 'Ostias', 2
GO
EXEC NuevaCategoria 'Varios', 2
GO

--MODIFICAR CATEGORÍAS--
CREATE PROC ModificarCategoria
@Nombre VARCHAR (30),
@Id INT
AS
UPDATE Categoria SET Nombre=@Nombre
WHERE Id=@Id
GO

--BORRAR CATEGORÍAS--
CREATE PROC BorrarCategoria
@Id INT
AS
DELETE FROM Categoria WHERE Id=@Id
GO

--VALIDAR CATEGORÍA--
CREATE PROC ValidarCategoria
@Nombre VARCHAR (30)
AS
SELECT * FROM Categoria WHERE Nombre=@Nombre
GO
--Si devuelve un valor, significa que la categoría ya existe--

--BUSCAR CATEGORÍA EN MOVIMIENTOS MONETARIOS--
CREATE PROC BuscarCategoría
@IdCategoria INT
AS
SELECT * FROM MovimientoMonetario WHERE IdCategoria=@IdCategoria
GO
--Si devuelve un valor, significa que la categoría existe en la tabla de movimientos monetarios, por lo cual no se puede borrar/modificar

--NUEVO MOVIMIENTO MONETARIO--
CREATE PROC NuevoMovimientoMonetario
@Valor FLOAT,
@Fecha DATE,
@Observacion VARCHAR (120),
@IdUsuario INT,
@IdCategoria INT
AS
INSERT INTO MovimientoMonetario VALUES (@Valor, @Fecha, @Observacion, @IdUsuario, @IdCategoria)
GO

--MODIFICAR MOVIMIENTO MONETARIO--
CREATE PROC ModificarMovimientoMonetario
@Id INT,
@Observacion VARCHAR (120)
AS
UPDATE MovimientoMonetario SET Observacion=@Observacion WHERE Id=@Id
GO

CREATE PROC NuevaActividad
@Nombre VARCHAR (50),
@Observacion VARCHAR (120)
AS
INSERT INTO Actividad VALUES (@Nombre, @Observacion)
GO

CREATE PROC NuevoFeligresEnActividad
@IdActividad INT,
@IdFeligres INT
AS
INSERT INTO FeligresPorActividad (IdActividad, IdFeligres) VALUES (@IdActividad, @IdFeligres)
GO

CREATE PROC EscribirLog
@UserId INT,
@ActionDate DATETIME,
@Action VARCHAR (240)
AS
INSERT INTO Auditoria VALUES (@UserId, @ActionDate, @Action)
GO

CREATE PROC ChequearNick
@Nick VARCHAR (15)
AS
SELECT COUNT(*) FROM Usuario WHERE Nick=@Nick
GO

CREATE PROC BorrarActividad
@Id INT
AS
DELETE FROM Actividad WHERE Id=@Id
GO

CREATE PROC BorrarActividadEnFeligresPorActividad
@IdActividad INT
AS
DELETE FROM FeligresesPorActividad WHERE IdActividad=@IdActividad
GO

CREATE PROC BorrarFeligresPorActividad
@IdFeligres INT,
@IdActividad INT
AS
DELETE FROM FeligresesPorActividad WHERE IdFeligres=@IdFeligres AND IdActividad=@IdActividad
GO

CREATE PROC ChequearActividad
@Nombre VARCHAR (50)
AS
SELECT * FROM Actividad WHERE Nombre=@Nombre
ORDER BY Nombre
GO

CREATE PROC ChequearCategoria
@Nombre VARCHAR (30)
AS
SELECT * FROM Categoria WHERE Nombre=@Nombre
ORDER BY Nombre
GO

CREATE PROC EncontrarCategoriaEnMovimientosMonetarios
@IdCategoria INT
AS
SELECT * FROM MovimientoMonetario WHERE IdCategoria=@IdCategoria
GO

CREATE PROC EncontrarFeligresEnActividades
@IdFeligres INT
AS
SELECT * FROM FeligresesPorActividad WHERE IdFeligres=@IdFeligres
GO

CREATE PROC EncontrarUsuarioPorNick
@Nick VARCHAR (15)
AS
SELECT * FROM Usuario WHERE Nick=@Nick
GO

CREATE PROC ObtenerObservacionDeActividad
@IdActividad int
AS
SELECT Observacion FROM Actividad WHERE Id=@IdActividad
GO

CREATE PROC ObtenerIdDeCategoria
@Nombre VARCHAR (30)
AS
SELECT Id, Nombre FROM Categoria WHERE Nombre=@Nombre
GO

