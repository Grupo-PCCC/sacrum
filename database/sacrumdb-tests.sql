<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Proveedores.aspx.cs" MasterPageFile="/base.Master" Inherits="UI.Parishioner" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--</form>--%>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <h1>Proveedores</h1>
                        <div class="row">
                            <div class="col-md-2 ml-0">
                                <asp:Button ID="btnNuevo" CssClass="btn btn-primary" runat="server" Text="Nuevo proveedor" OnClick="btnNuevo_Click" />
                            </div>
                        
                            <div class="col-md-10 ml-0">
							    <!-- Filtro -->
							    <div class="panel">
								    <div class="panel-heading">
									    <h3 class="panel-title">Filtro</h3>
									    <div class="right">
										    <button type="button" class="btn-toggle-collapse"><i class="lnr lnr-chevron-up"></i></button>
									    </div>
								    </div>
								    <div class="panel-body">
									    <div class="form-inline mx-sm-3 mb-2">
                                            <asp:TextBox ID="txtRazonSocialBuscar" class="form-control mr-5" PlaceHolder="Razón social" runat="server"></asp:TextBox>
                                            <asp:Button ID="Button1" runat="server" class="btn btn-secondary" OnClick="BtnBuscar_Click" Text="Buscar" />
                                            </div>
                                        </div>
								    </div>
							    </div>
							    <!-- Filtro -->
						    </div>
                        </div>
                        

                        <asp:GridView ID="dgvProveedor" runat="server" class="table table-striped text-center" CellPadding="4" OnRowCommand="ViewProveedor_RowCommand1" AutoGenerateColumns="False" DataKeyNames="IdEntidad" CellSpacing="2"  AllowPaging="true" OnPageIndexChanging="dgvProveedor_PageIndexChanging" OnSelectedIndexChanged="dgvProveedor_SelectedIndexChanged">
                            <Columns>
                                <asp:BoundField HeaderText="Id" DataField="Id" Visible="False">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Codigo Interno" DataField="CodigoInterno">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Razón social" DataField="RazonSocial">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                
                                <asp:BoundField HeaderText="Telefono" DataField="Telefono">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>

                                <asp:BoundField HeaderText="Mail" DataField="Mail">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>

                                <asp:BoundField HeaderText="Direccion" DataField="Direccion">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>

                                <asp:BoundField HeaderText="Observaciones" DataField="Observaciones" Visible="False">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>

                                <asp:BoundField HeaderText="IdEntidad" DataField="IdEntidad" Visible="False">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>

                                <asp:ButtonField CommandName="Seleccionar" Text="Editar" HeaderText="Editar">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:ButtonField>
                                <asp:ButtonField CommandName="Borrar" Text="Borrar" HeaderText="Borrar">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:ButtonField>
                            </Columns>
                            <%--<FooterStyle BackColor="#CCCCCC" />
                            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                            <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                            <RowStyle BackColor="White" />
                            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                            <SortedAscendingHeaderStyle BackColor="#808080" />
                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                            <SortedDescendingHeaderStyle BackColor="#383838" />--%>
                        </asp:GridView>


                        <br />
                        <asp:Label ID="lblResultado" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>

            <asp:HiddenField ID="hid" runat="server" />



            <asp:Panel ID="pnlProveedor" runat="server" CssClass="modalpopup">

                <div class="modal-header" id="ModalHeader">

                    <h3>Proveedor</h3>
                </div>
                <div class="modal-body">
                    <div class="form form-inline">
                        <div class="form form-group">
                            <label for="RazonSocial" runat="server">Razón social</label>
                            <asp:TextBox ID="txtNombre" class="form-control" runat="server" Width="350px"></asp:TextBox>
                        </div>
                    <div class="form form-inline">
                        <div class="form form-group">
                            <label for="direccion" runat="server">Dirección</label>
                            <asp:TextBox ID="txtDireccion" class="form-control" runat="server" Width="350px"></asp:TextBox>
                        </div>

                        <div class="form form-group">
                            <label for="mail" runat="server">E-Mail</label>
                            <asp:TextBox ID="txtMail" class="form-control" runat="server" Width="350px"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form form-inline">
                        <div class="form form-group">
                            <label for="TTel" runat="server">Tipo de Telefono</label>
                            <asp:DropDownList ID="lstTelefono" runat="server" class="form-control">
                                <asp:ListItem Value="1">Principal</asp:ListItem>
                                <asp:ListItem Value="2">Otro</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="form form-group">
                            <label for="Telefono" runat="server">Telefono</label>
                            <asp:TextBox ID="txtTelefono" class="form-control" runat="server" Width="350px"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form form-group">
                        <label for="observaciones" runat="server">Observaciones</label>
                        <asp:TextBox ID="txtObservaciones" class="form-control" runat="server" Width="350px"></asp:TextBox>
                    </div>
                    <br />
                     <div class="form form-group">
                        <asp:Button ID="btnGrabar" CssClass="btn-success" runat="server" Text="Guardar" OnClick="btnGrabar_Click" />
                        <asp:Button ID="btnCancelar" CssClass="btn-danger" runat="server" Text="Cancelar" OnClick="btnCancelar_Click" />
                    </div>
                </div>
            </asp:Panel>

            <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" BackgroundCssClass="modalBackground" PopupControlID="pnlProveedor" TargetControlID="btnNuevo" BehaviorID="modalPopupExtender1">
            </ajaxToolkit:ModalPopupExtender>

        </ContentTemplate>
    </asp:UpdatePanel>



    <br />
    <br />
    <br />


    <%--</form>--%>
</asp:Content>
