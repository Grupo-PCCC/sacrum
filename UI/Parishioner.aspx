<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Parishioner.aspx.cs" Inherits="UI.Parishioner" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Feligreses</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        Feligreses
        </div>
        <asp:Button ID="BtnSearch" runat="server" OnClick="BtnSearch_Click" Text="Buscar" />
        <asp:TextBox ID="TxtParishioner" runat="server"></asp:TextBox>
        <asp:GridView ID="ViewParishioner" runat="server">
        </asp:GridView>
    </form>
</body>
</html>
