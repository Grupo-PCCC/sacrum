﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Feligreses.aspx.cs" MasterPageFile="~/base.Master" Inherits="UI.Parishioner" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--<form id="form1" runat="server">--%>
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
<%--</form>--%>


</asp:Content>
