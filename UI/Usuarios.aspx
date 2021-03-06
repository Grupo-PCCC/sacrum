﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" MasterPageFile="/base.Master" Inherits="UI.Users" EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <h1>Usuarios</h1>

                        <asp:Button ID="btnNuevo" CssClass="btn btn-primary" runat="server" Text="Nuevo usuario" OnClick="btnNuevo_Click" />
                  
                        <div class="panel-body">
                                    <div class="form-inline mx-sm-3 mb-2">
                                        <label for="lblNombre" runat="server">Nombre</label>
                                        <asp:TextBox ID="txtNom" class="form-control mr-5" PlaceHolder="Nombre" runat="server"></asp:TextBox>
                                        <label for="lblApellido" runat="server">Apellido</label>
                                        <asp:TextBox ID="txtApe" class="form-control mr-5" PlaceHolder="Apellido" runat="server"></asp:TextBox>
                                         <label for="lblUsuario" runat="server">Usuario</label>
                                        <asp:TextBox ID="txtUsuario" class="form-control mr-5" PlaceHolder="Usuario" runat="server"></asp:TextBox>
                                            <label for="lblPerfil" runat="server">Tipo Perfil</label>
                                        <asp:DropDownList ID="lstTipoPerfil" runat="server" OnSelectedIndexChanged="lstTipoPerfil_SelectedIndexChanged"></asp:DropDownList>
                                        </div>
                            <br />
                                          <div class="form form-group">
                                            <asp:Button ID="Button1" runat="server" class="btn btn-secondary" OnClick="BtnBuscar_Click" Text="Buscar" />
                                        </div>
                                                                                                                  
                                    </div>
                                </div>
                            </div>
                            <!-- Filtro -->
                
                        
                        
                        <%--     <div class="form-inline float-lg-right">
                            <div class="form-group mx-sm-3 mb-2">
                                <asp:TextBox ID="TxtBusqueda" class="form-control" PlaceHolder="Nick" runat="server"></asp:TextBox>
                                <asp:Button ID="BtnBuscar" runat="server" class="btn btn-secondary" OnClick="BtnBuscar_Click" Text="Buscar" />
                            </div>

                        </div>--%>

                        <asp:GridView ID="dgvUsuarios" runat="server" class="table table-striped text-center" CellPadding="4" AutoGenerateColumns="False" DataKeyNames="Id" CellSpacing="2" AllowPaging="true" OnPageIndexChanging="dgvUsuarios_PageIndexChanging" OnRowCommand="dgvUsuarios_RowCommand1">

                            <Columns>
                                <asp:BoundField HeaderText="Id" DataField="Id" Visible="false">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Nick" DataField="Nick">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Contraseña" DataField="Contraseña">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Nombre" DataField="Nombre" ItemStyle-HorizontalAlign="Center">

                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>

                                <asp:BoundField HeaderText="Apellido" DataField="Apellido">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="TipoUsuario" HeaderText="Tipo de Usuario">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:ButtonField CommandName="Seleccionar" Text="Editar" HeaderText="Editar">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:ButtonField>
                               <%-- <asp:ButtonField CommandName="Borrar" Text="Borrar" HeaderText="Borrar">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:ButtonField>--%>
                            </Columns>
                            <%--<FooterStyle BackColor="#CCCCCC" />
                            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                            <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                            <RowStyle BackColor="White" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                            <SortedAscendingHeaderStyle BackColor="#808080" />
                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                            <SortedDescendingHeaderStyle BackColor="#383838" />--%>
                        </asp:GridView>

                        <br />
                        <asp:Label ID="lblResultado" runat="server" Text=""></asp:Label>

                        <asp:HiddenField ID="hid" runat="server" />


                        <asp:Panel ID="pnlUsuarios" runat="server" CssClass="modalpopup" Width="380px" Height="520px">



                            <div class="modal-header" id="ModalHeader">

                                <h3>Usuario</h3>
                            </div>

                            <div class="form form-group">
                                <label for="Nick" runat="server">Nick</label>
                                <asp:TextBox ID="txtNick" class="form-control" runat="server" Width="350px"></asp:TextBox>
                            </div>

                            <div class="form form-group">
                                <label for="Contraseña" runat="server">Contraseña</label>
                                <asp:TextBox ID="txtContraseña" class="form-control" runat="server" TextMode="Password" Width="350px"></asp:TextBox>
                            </div>
                            <div class="form form-group">
                                <label for="Nombre" runat="server">Nombre</label>
                                <asp:TextBox ID="txtNombre" class="form-control" runat="server" Width="350px"></asp:TextBox>
                            </div>
                            <div class="form form-group">
                                <label for="Apellido" runat="server">Apellido</label>
                                <asp:TextBox ID="txtApellido" class="form-control" runat="server" Width="350px"></asp:TextBox>
                            </div>
                            <div class="form form-group">
                                <label for="Tipo de Usuario" runat="server">Tipo de Usuario</label>
                                <br />
                                <asp:DropDownList ID="cmbTipoUsuario" runat="server" Width="350px">
                                    <asp:ListItem Value="1">Administrador</asp:ListItem>
                                    <asp:ListItem Value="2">Usuario</asp:ListItem>
                                </asp:DropDownList>
                                <%--<asp:TextBox ID="TxtTipodeUsuario" class="form-control" runat="server" Width="350px"></asp:TextBox>--%>
                            </div>

                            <br />

                            <asp:Button ID="btnGrabar" CssClass="btn-success" runat="server" Text="Guardar" OnClick="btnGrabar_Click" />
                            <asp:Button ID="btnCancelar" CssClass="btn-danger" runat="server" Text="Cancelar" OnClick="btnCancelar_Click" />
                                                               
            </asp:Panel>
                
        <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" BackgroundCssClass="modalBackground" PopupControlID="pnlUsuarios" TargetControlID="btnNuevo" BehaviorID="modalPopupExtender1">
        </ajaxToolkit:ModalPopupExtender>

        </ContentTemplate>
    </asp:UpdatePanel>



</asp:Content>
