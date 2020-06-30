﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="UI.Index" EnableEventValidation="false" %>


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
                <h1>SACRUM - GESTIÓN PARROQUIAL</h1>
            </div>

            <div class="design-w3l">
                <div class="mail-form-agile">
                    <form action="#" method="post" autocomplete="off">
                        <asp:TextBox ID="txtUsuario" runat="server" PlaceHolder="Usuario"></asp:TextBox>
                        <asp:TextBox ID="txtContraseña" TextMode="Password" runat="server" PlaceHolder="Contraseña"></asp:TextBox>
                        <asp:Button ID="btnIniciarSesion" runat="server" Text="Iniciar sesión" OnClick="Login_Click" />
                        <br />

                        <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
                        
                    </form>
                </div>
                <div class="clear"></div>
            </div>

            <div class="footer">
               <a><p>© 2020 - SACRUM - GRUPO PCCC </p> </a>
            </div>
            </div>
    </form>
</body>
</html>