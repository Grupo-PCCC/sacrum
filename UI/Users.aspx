<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="UI.Users" EnableEventValidation="false" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Usuarios</title>
</head>
<body>
    <form id="form1" runat="server" enableviewstate="False">
        <div>
         Usuarios
        </div>
        <asp:Button ID="BtnSearch" runat="server" OnClick="BtnSearch_Click" Text="Buscar" />
        <asp:TextBox ID="TxtUsers" runat="server"></asp:TextBox>
        <asp:GridView ID="ViewUsers" runat="server">
        </asp:GridView>
    </form>
</body>
</html>
