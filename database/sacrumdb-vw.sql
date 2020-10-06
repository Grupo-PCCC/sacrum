--VISTA PRINCIPAL DE FELIGRESES--
CREATE VIEW VW_FeligresesActivos
AS
SELECT F.Id, F.CodigoInterno AS 'Código Interno', F.Nombre, F.Apellido, F.FechaNacimiento AS 'Fecha de nacimiento', TD.Nombre AS 'Tipo de documento', F.IdTipoDocumento, F.Documento, TEL.Valor AS Teléfono, MAI.Valor AS Mail, DIR.Valor AS Dirección, F.Observaciones, F.Vivo, F.IdEntidad, F.EsContacto
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
F.Vivo=1
AND
F.EsContacto=0
AND
E.Estado=1
GO

--VISTA DE FELIGRESES MUERTOS--
CREATE VIEW VW_FeligresesActivos
AS
SELECT F.Id, F.CodigoInterno AS 'Código Interno', F.Nombre, F.Apellido, F.FechaNacimiento AS 'Fecha de nacimiento', TD.Nombre AS 'Tipo de documento', F.IdTipoDocumento, F.Documento, TEL.Valor AS Teléfono, MAI.Valor AS Mail, DIR.Valor AS Dirección, F.Observaciones, F.Vivo, F.IdEntidad, F.EsContacto
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
F.Vivo=0
GO

--VISTA DE FELIGRESES BORRADOS--
CREATE VIEW VW_FeligresesActivos
AS
SELECT F.Id, F.CodigoInterno AS 'Código Interno', F.Nombre, F.Apellido, F.FechaNacimiento AS 'Fecha de nacimiento', TD.Nombre AS 'Tipo de documento', F.IdTipoDocumento, F.Documento, TEL.Valor AS Teléfono, MAI.Valor AS Mail, DIR.Valor AS Dirección, F.Observaciones, F.Vivo, F.IdEntidad, F.EsContacto
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
E.Estado=0
GO