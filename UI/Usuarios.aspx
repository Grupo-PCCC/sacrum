<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" MasterPageFile="~/base.Master" Inherits="UI.Users" EnableEventValidation="false" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h1>Usuarios</h1>
                <%--<form id="form1" runat="server" class="">--%>
                <div class="form-inline float-lg-right">
                    <div class="form-group mx-sm-3 mb-2">
                        <asp:TextBox ID="TxtUsers" class="form-control" runat="server"></asp:TextBox>
                        <asp:Button ID="BtnSearch" runat="server" class="btn btn-secondary" OnClick="BtnSearch_Click" Text="Buscar" />
                    </div>
                </div>
                <asp:GridView ID="ViewUsers" runat="server" Class="table"></asp:GridView>
                <%--</form>--%>
            </div>
        </div>
    </div>
</asp:Content>