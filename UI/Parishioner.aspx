<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Parishioner.aspx.cs" Inherits="UI.Parishioner" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Feligreses</title>
    <link rel="stylesheet" href="/css/boostrap.min.css"/>
</head>
<body>
     <div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom shadow-sm">
        <h5 class="my-0 mr-md-auto font-weight-normal">SACRUM</h5>
        <nav class="my-2 my-md-0 mr-md-3">
            <a class="p-2 text-dark" href="Users.aspx">Usuarios</a>
            <a class="p-2 text-dark" href="Parishioner.aspx">Feligreses</a>
        </nav>
        <a class="btn btn-outline-primary" runat="server" href="#">Ingresar</a>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h1>Feligreses</h1>
                <form id="form1" runat="server" class="">
                    <div class="form-inline float-lg-right">
                        <div class="form-group mx-sm-3 mb-2">
                            
                            
                            
                            
                            <asp:HiddenField ID="hid" runat="server" />
                        </div>
                    </div>
                    <asp:GridView ID="ViewParishioner" runat="server" class="table" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" OnRowCommand="ViewParishioner_RowCommand1">
                        <Columns>
                            <asp:ButtonField CommandName="Seleccionar" Text="Seleccionar" />
                            <asp:ButtonField CommandName="Borrar" Text="Borrar" />
                        </Columns>
                        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                        <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                        <RowStyle BackColor="White" ForeColor="#330099" />
                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                        <SortedAscendingCellStyle BackColor="#FEFCEB" />
                        <SortedAscendingHeaderStyle BackColor="#AF0101" />
                        <SortedDescendingCellStyle BackColor="#F6F0C0" />
                        <SortedDescendingHeaderStyle BackColor="#7E0000" />
                    </asp:GridView>
                
            </div>
        </div>
    </div>
   
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h1>Administración Feligreses</h1>
                
                    <div class="form-group">
                        <label for="Nombre" runat="server">Nombre</label>
                        <asp:TextBox ID="TxtName"  class="form-control" runat="server" ></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="apellido" runat="server">Apellido</label>
                        <asp:TextBox ID="TxtSurname" class="form-control" runat="server" ></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="fnacimiento" runat="server">Fecha de Nacimiento</label>
                        <asp:TextBox ID="TxtBirthdate" class="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="tel1" runat="server">Telefono 1</label>
                        <asp:TextBox ID="TxtNumP"  class="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="tel2" runat="server">Telefono 2</label>
                        <asp:TextBox ID="TxtNumA" class="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="observaciones" runat="server">Observaciones</label>
                        <asp:TextBox ID="TxtObs"  class="form-control" runat="server"></asp:TextBox>
                    </div>
                <asp:Button ID="btnNuevo"  cssclass="btn btn-primary"  runat="server" Text="Nuevo" OnClick="btnNuevo_Click" />
                    <asp:Button ID="btnGrabar"  cssclass="btn btn-secondary"  runat="server" Text="Grabar" OnClick="btnGrabar_Click" />
                
                    
                </form>
            </div>
        </div>
    </div>
    
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</body>
</html>
