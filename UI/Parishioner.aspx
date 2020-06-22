<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Parishioner.aspx.cs" Inherits="UI.Parishioner" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Feligreses</title>
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
                <h1>Feligreses</h1>
                <form id="form1" runat="server" class="">
                    <div class="form-inline float-lg-right">
                        <div class="form-group mx-sm-3 mb-2">
                            <asp:TextBox ID="TxtParishioner" runat="server" class="form-control"></asp:TextBox>
                            <asp:Button ID="BtnSearch" runat="server" OnClick="BtnSearch_Click" Text="Buscar"  class="btn btn-secondary"/>
                            <asp:Button ID="BtnNewParishioner" runat="server" OnClick="BtnNewParishioner_Click" Text="Nuevo" postbackurl="AddParishioner.aspx" class="btn btn-success"/>
                            <asp:Button ID="BtnModifyParishioner" runat="server" OnClick="BtnModifyParishioner_Click" Text="Modificar" class="btn btn-primary"/>
                            <asp:Button ID="BtnDeleteParishioner" runat="server" OnClick="BtnDeleteParishioner_Click" Text="Borrar" CssClass="btn btn-danger" />
                        </div>
                    </div>
                    <asp:GridView ID="ViewParishioner" runat="server" class="table"></asp:GridView>
                </form>
            </div>
        </div>
<<<<<<< HEAD
    </div>
    
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
=======
        <asp:Button ID="BtnSearch" runat="server" OnClick="BtnSearch_Click" Text="Buscar" />
        <asp:TextBox ID="TxtParishioner" runat="server"></asp:TextBox>
        <asp:GridView ID="ViewParishioner" runat="server">
        </asp:GridView>
    </form>
>>>>>>> master
</body>
</html>
