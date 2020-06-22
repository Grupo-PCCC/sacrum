<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddParishioner.aspx.cs" Inherits="UI.AddParishioner" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Agregar Feligreses</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
</head>
<body>
     <div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom shadow-sm">
        <h5 class="my-0 mr-md-auto font-weight-normal">SACRUM</h5>
        <nav class="my-2 my-md-0 mr-md-3">
            <a class="p-2 text-dark" href="Users.aspx">Usuarios</a>
            <a class="p-2 text-dark" href="Parishioner.aspx">Feligreses</a>
        </nav>
        <a class="btn btn-outline-primary" href="#">Ingresar</a>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h1>Agregar Feligreses</h1>
                <form id="form1" runat="server" class="">
                    <div class="form-group">
                        <label for="nombre">Nombre</label>
                        <input type="text" class="form-control" id="nombre">
                    </div>
                    <div class="form-group">
                        <label for="apellido">Apellido</label>
                        <input type="text" class="form-control" id="apellido">
                    </div>
                    <div class="form-group">
                        <label for="fnacimiento">Fecha de Nacimiento</label>
                        <input type="date" class="form-control" id="fnacimiento">
                    </div>
                    <div class="form-group">
                        <label for="tel1">Telefono 1</label>
                        <input type="text" class="form-control" id="tel1">
                    </div>
                    <div class="form-group">
                        <label for="tel2">Telefono 2</label>
                        <input type="text" class="form-control" id="tel2">
                    </div>
                    <div class="form-group">
                        <label for="observaciones">Observaciones</label>
                        <input type="text" class="form-control" id="observaciones">
                    </div>
                    <button type="submit" class="btn btn-primary">Submit</button>
                </form>
            </div>
        </div>
    </div>
    
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</body>
</html>
