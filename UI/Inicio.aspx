<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="UI.Index" EnableEventValidation="false" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>SACRUM - Sistema de Gestión Parroquial</title>
</head>
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<body>
    <form id="form1" runat="server" enableviewstate="False">
        <div></div>

       

        <div class="padding-all">
            <div class="header">
                <h1>SACRUM - GESTION PARROQUIAL</h1>
            </div>

            <div class="design-w3l">
                <div class="mail-form-agile">
                    <form action="#" method="post" autocomplete="off">
                        <asp:TextBox ID="TxtUser" runat="server" PlaceHolder="Usuario"></asp:TextBox>
                        <asp:TextBox ID="TxtPass" TextMode="Password" runat="server" PlaceHolder="Password"></asp:TextBox>
                        <asp:Button ID="Login" runat="server" Text="Login" OnClick="Login_Click" />
                        <%--<input type="text" name="name" placeholder="Usuario.." required="" />--%>
                        <%--<input type="password" name="password" class="padding" placeholder="Password" required="" />--%>
                        <%--<asp:Label ID="msgError" runat="server" Visible="False"></asp:Label>--%>
                    </form>
                </div>
                <div class="clear"></div>
            </div>

            <div class="footer">
                <p>© 2020 - SACRUM - GRUPO PCCC </a></p>
            </div>
            </div>
    </form>
</body>
</html>
