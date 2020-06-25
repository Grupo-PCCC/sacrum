<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Feligreses.aspx.cs" Inherits="UI.Parishioner" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Feligreses</title>

    <link rel="stylesheet" href="/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/css/stylegen.css" />
</head>
<body>
    <form id="form1" runat="server" class="">

        <div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom shadow-sm">
            <h5 class="my-0 mr-md-auto font-weight-normal">SACRUM</h5>
            <nav class="my-2 my-md-0 mr-md-3">
                <a class="p-2 text-dark" href="Usuarios.aspx">Usuarios</a>
                <a class="p-2 text-dark" href="Parishioner.aspx">Feligreses</a>
            </nav>
            <a class="btn btn-outline-primary" runat="server" href="#">Ingresar</a>
        </div>

        <asp:HiddenField ID="hid" runat="server" />




        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>

        <asp:Panel ID="pnlFeligres" runat="server" CssClass="modalpopup" Width="380px">

            <div class="modal-header" id="ModalHeader">

                <h3>Feligres</h3>
                

            </div>
           
          
            <div class="form form-group">
                <label for="Nombre" runat="server">Nombre</label>
                <asp:TextBox ID="TxtName" class="form-control" runat="server" Width="350px"></asp:TextBox>
            </div>

            <div class="form form-group">
                <label for="apellido" runat="server">Apellido</label>
                <asp:TextBox ID="TxtSurname" class="form-control" runat="server" Width="350px"></asp:TextBox>
            </div>
            <div class="form form-group">
                <label for="fnacimiento" runat="server">Fecha de Nacimiento</label>
                <asp:TextBox ID="TxtBirthdate" class="form-control" runat="server" Width="350px"></asp:TextBox>
            </div>

            <div class="form form-group">
                <label for="tel1" runat="server">Telefono 1</label>
                <asp:TextBox ID="TxtNumP" class="form-control" runat="server" Width="350px"></asp:TextBox>
            </div>
            <div class="form form-group">
                <label for="tel2" runat="server">Telefono 2</label>
                <asp:TextBox ID="TxtNumA" class="form-control" runat="server" Width="350px"></asp:TextBox>
            </div>
            <div class="form form-group">
                <label for="observaciones" runat="server">Observaciones</label>
                <asp:TextBox ID="TxtObs" class="form-control" runat="server" Width="350px"></asp:TextBox>
            </div>

            <br />
            
                <asp:Button ID="btnGrabar" CssClass="btn-success" runat="server" Text="Guardar" OnClick="btnGrabar_Click" />
                <asp:Button ID="btnCancelar" CssClass="btn-danger" runat="server" Text="Cancelar" OnClick="btnCancelar_Click" />
                
            

        </asp:Panel>
        <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" CancelControlID="btnCancelar" BackgroundCssClass="modalBackground" PopupControlID="pnlFeligres" TargetControlID="btnNuevo" BehaviorID="modalPopupExtender1">
        </ajaxToolkit:ModalPopupExtender>
        <br />
        <br />
        <br />

        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    
                    <asp:Button ID="btnNuevo" CssClass="btn btn-primary" runat="server" Text="Nuevo Feligres" OnClick="btnNuevo_Click" />
                    
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
    </form>

    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>

    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/javascript.js"></script>





</body>
</html>
