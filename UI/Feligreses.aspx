<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Feligreses.aspx.cs" MasterPageFile="/base.Master" Inherits="UI.Parishioner" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--</form>--%>
    <link href="css/stylegen.css" rel="stylesheet" />
    <asp:HiddenField ID="hid" runat="server" />
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    
    
    <asp:Panel ID="pnlFeligres" runat="server" CssClass="modalpopup" Width="380px">

        <div class="modal-header" id="ModalHeader">

            <h3>Feligres</h3>
        </div>

        <div class="form form-group">
            <label for="Nombre" runat="server">Nombre</label>
            <asp:TextBox ID="txtNombre" class="form-control" runat="server" Width="350px"></asp:TextBox>
        </div>

        <div class="form form-group">
            <label for="apellido" runat="server">Apellido</label>
            <asp:TextBox ID="txtApellido" class="form-control" runat="server" Width="350px"></asp:TextBox>
        </div>
        <div class="form form-group">
            <label for="fnacimiento" runat="server">Fecha de Nacimiento</label>
            <asp:TextBox ID="txtFechaNac" class="form-control" runat="server" Width="350px"></asp:TextBox>
        </div>
        <div class="form form-group">
            <label for="observaciones" runat="server">Observaciones</label>
            <asp:TextBox ID="txtObservaciones" class="form-control" runat="server" Width="350px"></asp:TextBox>
        </div>


        <br />

        <asp:Button ID="btnGrabar" CssClass="btn-success" runat="server" Text="Guardar" OnClick="btnGrabar_Click" />
        <asp:Button ID="btnCancelar" CssClass="btn-danger" runat="server" Text="Cancelar" OnClick="btnCancelar_Click" />



    </asp:Panel>

    <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server"  BackgroundCssClass="modalBackground" PopupControlID="pnlFeligres" TargetControlID="btnNuevo" BehaviorID="modalPopupExtender1">
    </ajaxToolkit:ModalPopupExtender>
    


        
    <br />
    <br />
    <br />

    <div class="container">
        <div class="row">
            <div class="col-lg-12">

                <asp:Button ID="btnNuevo" CssClass="btn btn-primary" runat="server" Text="Nuevo feligrés" OnClick="btnNuevo_Click" />

                <asp:GridView ID="dgvFeligres" runat="server" class="table" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" OnRowCommand="ViewParishioner_RowCommand1" AutoGenerateColumns="False">
                    
                    <Columns>
                        <asp:BoundField HeaderText="Id"  DataField="Id">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField HeaderText="Nombre" DataField="Nombre" >
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField HeaderText="Apellido" DataField="Apellido" >
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField HeaderText="Fecha de nacimiento" DataField="FechaNac" DataFormatString="{0:dd/MM/yyyy}" >
                
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                
                        <asp:BoundField HeaderText="Observaciones" DataField="Observacion" >
                        <HeaderStyle HorizontalAlign="Center" />
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
                <br />
                <asp:Label ID="lblResultado" runat="server" Text=""></asp:Label>
            </div>
        </div>
    </div>
<%--</form>--%>

       
</asp:Content>
