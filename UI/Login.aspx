<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="UI.Index" EnableEventValidation="false" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>SACRUM - Sistema de Gestión Parroquial</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0"/>
	<!-- VENDOR CSS -->
	<link rel="stylesheet" href="/css/bootstrap.min.css"/>
	<link rel="stylesheet" href="/vendor/font-awesome/css/font-awesome.min.css"/>
	<link rel="stylesheet" href="/vendor/linearicons/style.css"/>
	<!-- MAIN CSS -->
	<link rel="stylesheet" href="/css/main.css"/>
	<!-- GOOGLE FONTS -->
	<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet"/>
	<!-- ICONS -->
	<link rel="apple-touch-icon" sizes="76x76" href="/img/apple-icon.png"/>
	<link rel="icon" type="image/png" sizes="96x96" href="/img/favicon.png"/>
</head>
<body>
  
    <form id="form1" runat="server" enableviewstate="False">
        <div></div>
  <div id="wrapper">
		<div class="vertical-align-wrap">
			<div class="vertical-align-middle">
				<div class="auth-box ">
					<div class="left">
						<div class="content">
							<div class="header">
								<div class="logo text-center"><img class="logo-img" src="../images/sacrum-logo.png" alt="SACRUM" /></div>
								<p class="lead">SACRUM - GESTIÓN PARROQUIAL</p>
							</div>
							 <div class="design-w3l">
								<div class="mail-form-agile">
									<form action="#" method="post" class="form-auth-small" autocomplete="off">
										<div class="form-group">
											<label for="signin-email" class="control-label sr-only">Usuario</label>
											<asp:TextBox ID="txtUsuario" class="form-control"  runat="server" PlaceHolder="Usuario"></asp:TextBox>
										</div>
										<div class="form-group">
											<label for="signin-password" class="control-label sr-only">Password</label>
											<asp:TextBox ID="txtContraseña" class="form-control" TextMode="Password" runat="server" PlaceHolder="Contraseña"></asp:TextBox>
										</div>
                        
										<br /><br />
										<asp:Button ID="btnIniciarSesion" runat="server"  class="btn btn-primary btn-lg btn-block" Text="Iniciar sesión" OnClick="Login_Click" />
                        

										<asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
                        
									</form>
								</div>
								<div class="clear"></div>
							</div>
						</div>
					</div>
					<div class="right">
						<div class="overlay"></div>
						<div class="content text">
							<h1 class="heading"></h1>
						</div>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
		</div>
	</div>
    </form>
    <footer class="copyright">© 2020 - SACRUM - GRUPO PCCC </footer>
</body>
</html>
