<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="UI.Users" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Prueba</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>


            hola mundo


        </div>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
        <asp:TextBox ID="TxtUsers" runat="server"></asp:TextBox>
        <asp:GridView ID="ViewUsers" runat="server">
        </asp:GridView>
    </form>
</body>
</html>
