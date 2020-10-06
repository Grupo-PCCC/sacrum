--VISTA PRINCIPAL DE FELIGRESES--

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
--CONDICIONES--
WHERE
F.Vivo=1
AND
F.EsContacto=0