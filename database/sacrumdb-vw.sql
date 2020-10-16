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