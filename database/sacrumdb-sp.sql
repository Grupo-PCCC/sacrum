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
EXEC NuevaEntidad 'usuario','usuario',null,3,'Usuario',null,'usuario','contrase▒a',1

INSERT INTO DatoEntidad VALUES (5,2,'sarasa@gmail.com','mail de juan')

CREATE PROC NuevoDatoEntidad
@IdEntidad INT,
@IdTipoDatoEntidad INT,
@Valor VARCHAR (100),
@Detalle VARCHAR (20)
AS
INSERT INTO DatoEntidad VALUES (@IdEntidad,@IdTipoDatoEntidad,@Valor,@Detalle)
GO
