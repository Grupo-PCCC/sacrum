use SacrumDb_tests
go
--VISTA PRINCIPAL DE FELIGRESES--
CREATE PROC VW_Feligreses (@Nombre VARCHAR(30), @Apellido VARCHAR(30), @Fecha1 DATE, @Fecha2 DATE, @Documento VARCHAR(20), @Vivo INT, @EsContacto INT, @Estado INT)
AS
SELECT F.Id, F.CodigoInterno AS [Codigo Interno], F.Nombre, F.Apellido, F.FechaNacimiento AS [Fecha de nacimiento], TD.Nombre AS [Tipo de documento], F.Documento, TEL.Valor AS Telefono, MAI.Valor AS Mail, DIR.Valor AS Direccion, F.Observaciones, F.Vivo, F.IdEntidad, F.EsContacto
FROM Feligres F
--JOINS--
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
--CONDICIONES--
WHERE
F.Vivo=@Vivo
AND
F.EsContacto=@EsContacto
AND
E.Estado=@Estado
AND
F.Nombre LIKE '%' + @Nombre + '%' COLLATE Latin1_General_CI_AI
AND
F.Apellido LIKE '%' + @Apellido + '%' COLLATE Latin1_General_CI_AI
AND
F.FechaNacimiento BETWEEN @Fecha1 AND @Fecha2
AND
F.Documento LIKE '%' + @Documento + '%' COLLATE Latin1_General_CI_AI
GO
--Búsqueda de prueba--
exec  VW_Feligreses '','','01-01-1950','01-01-2020','',1,0,1


--VW DE CAJA--

CREATE PROC VW_Categorias
@Nombre VARCHAR(30),
@IdTipoCategoria INT
AS
SELECT Nombre
FROM Categoria
WHERE Nombre LIKE '%' + @Nombre + '%' COLLATE Latin1_General_CI_AI AND IdTipoCategoria=@IdTipoCategoria
ORDER BY Nombre
GO

CREATE PROC VW_MovimientosMonetarios
@Fecha1 DATE,
@Fecha2 DATE,
@Precio1 FLOAT,
@Precio2 FLOAT,
@IdTipoCategoria VARCHAR (100),
@IdCategoria VARCHAR (100),
@IdUsuario VARCHAR (100)
AS
IF @IdTipoCategoria IS NULL
BEGIN
SET @IdTipoCategoria = (SELECT STUFF((SELECT ', ' + CAST(Id AS VARCHAR(10)) FROM TipoCategoria FOR XML PATH ('')),1,2, ''))
END
ELSE IF @IdCategoria IS NULL
BEGIN
SET @IdCategoria = (SELECT STUFF((SELECT ', ' + CAST(Id AS VARCHAR(10)) FROM Categoria FOR XML PATH ('')),1,2, ''))
END
ELSE IF @IdUsuario IS NULL
BEGIN
SET @IdUsuario = (SELECT STUFF((SELECT ', ' + CAST(Id AS VARCHAR(10)) FROM Usuario FOR XML PATH ('')),1,2, ''))
END
BEGIN
SELECT M.Id, M.Fecha, C.Nombre AS NombreCategoria, M.Valor, TC.Nombre AS 'Tipo de movimiento', M.Observacion, U.Nick AS Usuario, C.Id AS IdCategoria, TC.Id AS IdTipoCategoria, U.Id AS IdUsuario
FROM MovimientoMonetario M
--JOINS--
INNER JOIN Categoria C
ON M.IdCategoria=C.Id
INNER JOIN TipoCategoria TC
ON C.IdTipoCategoria=TC.Id
INNER JOIN Usuario U
ON M.IdUsuario=U.Id
--CONDICIONES--
WHERE M.Fecha BETWEEN @Fecha1 AND @Fecha2
AND
M.Valor BETWEEN @Precio1 AND @Precio2
AND
C.IdTipoCategoria IN (@IdTipoCategoria)
AND
M.IdUsuario IN (@IdUsuario)
AND
M.IdCategoria IN (@IdCategoria)
ORDER BY M.Fecha
END
GO

EXEC VW_MovimientosMonetarios '1900-01-01','2020-12-31',0,1000,'1','2','1'

EXEC VW_MovimientosMonetarios '1900-01-01','2020-12-31',0,1000,NULL,NULL,NULL


exec NuevoMovimientoMonetario 100,'2020-10-22','',1,2

--VISTA PRINCIPAL DE PROVEEDORES--
CREATE PROC VW_Proveedores (@RazonSocial VARCHAR(50), @Estado INT)
AS
SELECT P.Id, P.CodigoInterno AS [Codigo Interno], P.RazonSocial, TEL.Valor AS Telefono, MAI.Valor AS Mail, DIR.Valor AS Direccion, P.Observaciones, P.IdEntidad
FROM Proveedor P
--JOINS--
LEFT JOIN DatoEntidad TEL
ON TEL.IdTipoDatoEntidad=1
AND TEL.NombreDato='tel'
AND P.IdEntidad=TEL.IdEntidad
LEFT JOIN DatoEntidad AS MAI
ON MAI.IdTipoDatoEntidad=1
AND MAI.NombreDato='mail'
AND P.IdEntidad=MAI.IdEntidad
LEFT JOIN DatoEntidad AS DIR
ON DIR.IdTipoDatoEntidad=1
AND DIR.NombreDato='dire'
AND P.IdEntidad=DIR.IdEntidad
LEFT JOIN Entidad E
ON E.Id=P.IdEntidad
--CONDICIONES--
WHERE
E.Estado=@Estado
AND
P.RazonSocial LIKE '%' + @RazonSocial + '%' COLLATE Latin1_General_CI_AI
GO

--VISTA PRINCIPAL DE FELIGRESES EN ACTIVIDADES--
CREATE PROC VW_FeligresesEnActividades (@Nombre VARCHAR(30), @Apellido VARCHAR(30), @Fecha1 DATE, @Fecha2 DATE, @Documento VARCHAR(20), @Vivo INT, @EsContacto INT, @Estado INT, @IdActividad INT)
AS
SELECT F.Id, F.CodigoInterno AS [Codigo Interno], F.Nombre, F.Apellido, F.FechaNacimiento AS [Fecha de nacimiento], TD.Nombre AS [Tipo de documento], F.Documento, TEL.Valor AS Telefono, MAI.Valor AS Mail, DIR.Valor AS Direccion, F.Observaciones, F.Vivo, F.IdEntidad, F.EsContacto
FROM Feligres F
--JOINS--
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
LEFT JOIN FeligresesPorActividad FPA
ON FPA.IdFeligres=F.Id
LEFT JOIN Actividad A
ON FPA.IdActividad=A.Id
--CONDICIONES--
WHERE
F.Vivo=@Vivo
AND
F.EsContacto=@EsContacto
AND
E.Estado=@Estado
AND
F.Nombre LIKE '%' + @Nombre + '%' COLLATE Latin1_General_CI_AI
AND
F.Apellido LIKE '%' + @Apellido + '%' COLLATE Latin1_General_CI_AI
AND
F.FechaNacimiento BETWEEN @Fecha1 AND @Fecha2
AND
F.Documento LIKE '%' + @Documento + '%' COLLATE Latin1_General_CI_AI
AND
A.Id=@IdActividad
GO

-- VISTA DE LOG --
CREATE PROC VW_Log
@Fecha1 DATE, 
@Fecha2 DATE,
@IdUsuario INT,
@Texto VARCHAR(30)
AS
DECLARE @NuevaFecha DATE = (SELECT DATEADD(DAY,1,@Fecha2))
IF @IdUsuario !=NULL
SELECT Convert(smalldatetime,A.Fecha,120) as FechaAccion,  U.Nick as 'Usuario',  A.Accion
FROM Auditoria A
INNER JOIN Usuario U
ON A.IdUsuario=U.Id
WHERE
A.Fecha BETWEEN @Fecha1 AND @NuevaFecha 
AND U.Id=@IdUsuario 
AND A.Accion LIKE '%' + @Texto + '%' COLLATE Latin1_General_CI_AI
ORDER BY A.Fecha ASC
ELSE IF @IdUsuario = NULL
SELECT Convert(smalldatetime,A.Fecha,120) as FechaAccion,  U.Nick as 'Usuario',  A.Accion
FROM Auditoria A
INNER JOIN Usuario U
ON A.IdUsuario=U.Id
WHERE
A.Fecha BETWEEN @Fecha1 AND @NuevaFecha 
AND A.Accion LIKE '%' + @Texto + '%' COLLATE Latin1_General_CI_AI
ORDER BY A.Fecha ASC
--VISTA FALLECIDOS--
CREATE PROC VW_Fallecidos (@Nombre VARCHAR(30), @Apellido VARCHAR(30), @FechaFallecimiento1 DATE, @FechaFallecimiento2 DATE, @FechaIngresoCinerario1 DATE, @FechaIngresoCinerario2 DATE, @Documento VARCHAR(20), @Estado INT, @Contribuyo INT)
AS
SELECT F.Id, F.CodigoInterno AS [Codigo Interno], F.Nombre, F.Apellido, F.FechaNacimiento AS [Fecha de nacimiento], TD.Nombre AS [Tipo de documento], F.Documento, F.Observaciones, F.Vivo, F.IdEntidad, F.EsContacto, F.Contribuyo, F.IdMovimientoMonetario
FROM Fallecido F
--JOINS--
LEFT JOIN TipoDocumento TD
ON F.IdTipoDocumento=TD.Id
LEFT JOIN Entidad E
ON E.Id=F.IdEntidad
--CONDICIONES--
WHERE
E.Estado=@Estado
AND
F.Nombre LIKE '%' + @Nombre + '%' COLLATE Latin1_General_CI_AI
AND
F.Apellido LIKE '%' + @Apellido + '%' COLLATE Latin1_General_CI_AI
AND
F.FechaFallecimiento BETWEEN @FechaFallecimiento1 AND @FechaFallecimiento2
AND
F.FechaIngresoCinerario BETWEEN @FechaIngresoCinerario1 AND @FechaIngresoCinerario2
AND
F.Documento LIKE '%' + @Documento + '%' COLLATE Latin1_General_CI_AI
GO
