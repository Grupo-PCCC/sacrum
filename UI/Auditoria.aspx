<%@ Page Title="" Language="C#" MasterPageFile="/base.Master" AutoEventWireup="true" CodeBehind="Auditoria.aspx.cs" Inherits="UI.Auditoria" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--<form id="form1" runat="server" class="">--%>

     <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h1>Auditoría</h1>
                <%--</form>--%>
                <div class="form-inline float-lg-right">
                    <div class="form-group mx-sm-3 mb-2">
                        <asp:TextBox ID="TxtBusqueda" class="form-control" runat="server"></asp:TextBox>
                        <asp:Button ID="btnBuscar" runat="server" class="btn btn-secondary" OnClick="BtnBuscar_Click" Text="Buscar" />
                    </div>
                </div>
                <asp:GridView ID="dgvAuditoria" runat="server" Class="table" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <SortedAscendingCellStyle BackColor="#FDF5AC" />
                    <SortedAscendingHeaderStyle BackColor="#4D0000" />
                    <SortedDescendingCellStyle BackColor="#FCF6C0" />
                    <SortedDescendingHeaderStyle BackColor="#820000" />
                </asp:GridView>
                <br />
                <asp:Label ID="lblResultado" runat="server" Text=""></asp:Label>
                <%--</form>--%>


</asp:Content>
