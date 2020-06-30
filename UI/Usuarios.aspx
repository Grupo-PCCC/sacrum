<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" MasterPageFile="/base.Master" Inherits="UI.Users" EnableEventValidation="false" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h1>Usuarios</h1>
                <%--<form id="form1" runat="server" class="">--%>
                <asp:Button ID="btnNuevo" CssClass="btn btn-primary" runat="server" Text="Nuevo Usuario" OnClick="btnNuevo_Click" />
                <div class="form-inline float-lg-right">
                    <div class="form-group mx-sm-3 mb-2">
                        <asp:TextBox ID="TxtBusqueda" class="form-control" PlaceHolder="Nick" runat="server"></asp:TextBox>
                        <asp:Button ID="BtnBuscar" runat="server" class="btn btn-secondary" OnClick="BtnBuscar_Click" Text="Buscar" />
                    </div>
                </div>

                   <asp:GridView ID="dgvUsuarios" runat="server" class="table" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4"  AutoGenerateColumns="False" DataKeyNames="Id" CellSpacing="2" ForeColor="Black" AllowPaging="true" OnPageIndexChanging="dgvUsuarios_PageIndexChanging" >
                    
                    <Columns>
                        <asp:BoundField HeaderText="Id"  DataField="Id" Visible="false">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField HeaderText="Nick" DataField="Nick" >
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField HeaderText="Contraseña" DataField="Contraseña" >
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField HeaderText="Nombre" DataField="Nombre" ItemStyle-HorizontalAlign="Center" >
                
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                
                        <asp:BoundField HeaderText="Apellido" DataField="Apellido" >
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="TipoUsuario" HeaderText="Tipo de Usuario">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:ButtonField CommandName="Seleccionar" Text="Editar" HeaderText="Editar" >
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:ButtonField>
                        <asp:ButtonField CommandName="Borrar" Text="Borrar" HeaderText="Borrar" >
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:ButtonField>
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                    <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                    <RowStyle BackColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#808080" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
                </asp:GridView>





                <%--<asp:GridView ID="dgvUsuarios" runat="server" Class="table" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                    <RowStyle BackColor="White" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#808080" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
                </asp:GridView>--%>
                <br />
                <asp:Label ID="lblResultado" runat="server" Text=""></asp:Label>
                <%--</form>--%>
                

        <div class="modal-header" id="ModalHeader">

            <h3>Nuevo Usuario</h3>
        </div>

        <div class="form form-group">
            <label for="Nick" runat="server">Nick</label>
            <asp:TextBox ID="txtNick" class="form-control" runat="server" Width="350px"></asp:TextBox>
        </div>

        <div class="form form-group">
            <label for="Contraseña" runat="server">Contraseña</label>
            <asp:TextBox ID="txtContraseña" class="form-control" runat="server" Width="350px"></asp:TextBox>
        </div>
        <div class="form form-group">
            <label for="Nombre" runat="server">Nombre</label>
            <asp:TextBox ID="txtNombre" class="form-control" runat="server" Width="350px"></asp:TextBox>
        </div>
        <div class="form form-group">
            <label for="Apellido" runat="server">Apellido</label>
            <asp:TextBox ID="txtApellido" class="form-control" runat="server" Width="350px"></asp:TextBox>
        </div>
        <div class="form form-group">
            <label for="Tipo de Usuario" runat="server">Tipo de Usuario</label>
            <asp:TextBox ID="TxtTipodeUsuario" class="form-control" runat="server" Width="350px"></asp:TextBox>

           
        
            </div>
        </div>

            </div>
        </div>
</asp:Content>