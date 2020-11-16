<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation = "false" CodeBehind="Caja.aspx.cs" MasterPageFile="/base.Master" Inherits="UI.Caja" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--</form>--%>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
                <div class="row">
                    <div class="col-lg-12">
                        <h1>Movimientoses</h1>
                        <div class="row">
                            <%--Agregar movimiento--%>
                            <div class="col-md-2 ml-0">
                                <asp:Button ID="btnNuevo" CssClass="btn btn-primary" runat="server" Text="Nuevo movimiento" OnClick="btnNuevo_Click" />
                            </div>
                            <%--Agregar movimiento--%>
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
                                            <asp:TextBox ID="txtNombreBuscar" class="form-control mr-5" PlaceHolder="Nombre" runat="server"></asp:TextBox>
                                            <asp:TextBox ID="txtApellidoBuscar" class="form-control mr-5" PlaceHolder="Apellido" runat="server"></asp:TextBox>
                                            <asp:TextBox ID="txtDocumentoBuscar" class="form-control mr-5" PlaceHolder="Documento" runat="server"></asp:TextBox>
                                            <div class="form form-group">
                                                <label for="fechanac" runat="server">Fecha Desde</label>
                                                <asp:TextBox ID="dateInicio" class="form-control" runat="server" Width="350px"></asp:TextBox>
                                                <ajaxToolkit:CalendarExtender ID="dateInicioBuscar" runat="server" TargetControlID="dateInicio" Format="dd/MM/yyyy" />
                                            </div>
                                            <div class="form form-group">
                                                <label for="fechanac" runat="server">Hasta</label>
                                                <asp:TextBox ID="dateFin" class="form-control" runat="server" Width="350px"></asp:TextBox>
                                                <ajaxToolkit:CalendarExtender ID="dateFinBuscar" runat="server" TargetControlID="dateFin" Format="dd/MM/yyyy" />
                                            </div>
                                            <div class="form form-group">
                                                <asp:Button ID="Button1" runat="server" class="btn btn-secondary" OnClick="BtnBuscar_Click" Text="Buscar" />
                                                
                                            </div>
                                        </div>
								    </div>
							    </div>
							    <!-- Filtro -->
						    </div>
                        </div>
                        <asp:GridView ID="dgvMovimientos" runat="server" class="table table-striped text-center" CellPadding="4" OnRowCommand="ViewMovimientos_RowCommand1" AutoGenerateColumns="False" DataKeyNames="IdEntidad" CellSpacing="2"  AllowPaging="true" OnPageIndexChanging="dgvMovimientos_PageIndexChanging" OnSelectedIndexChanged="dgvMovimientos_SelectedIndexChanged">
                            <Columns>
                                <asp:BoundField HeaderText="Id" DataField="Id" Visible="False">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Fecha" DataField="Fecha" DataFormatString="{0:dd/MM/yyyy}">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Categoria" DataField="NombreCategoria">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Valor" DataField="Valor">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Tipo de movimiento" DataField="Tipo de movimiento">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Observacion" DataField="Observacion" Visible="False">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Usuario" DataField="Usuario">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="IdCategoria" DataField="IdCategoria" Visible="False">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="IdTipoCategoria" DataField="IdTipoCategoria" Visible="False">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="IdUsuario" DataField="IdUsuario" Visible="False">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
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

            <asp:HiddenField ID="hid" runat="server" />



            <asp:Panel ID="pnlMovimientos" runat="server" CssClass="modalpopup">

                <div class="modal-header" id="ModalHeader">

                    <h3>Movimientos</h3>
                </div>
                <div class="modal-body">
                    <div class="form form-inline">
                        <div class="form form-group">
                            <label for="Nombre" runat="server">Nombre</label>
                            <asp:TextBox ID="txtNombre" class="form-control" runat="server" Width="350px"></asp:TextBox>
                        </div>
                        <div class="form form-group">
                            <label for="apellido" runat="server">Apellido</label>
                            <asp:TextBox ID="txtApellido" class="form-control" runat="server" Width="350px"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form form-inline">
                        <div class="form form-group">
                            <label for="fnacimiento" runat="server">Fecha de Nacimiento</label>
                            <asp:TextBox ID="txtFechaNac" class="form-control" runat="server" Width="350px"></asp:TextBox>
                            <ajaxToolkit:CalendarExtender ID="txtFechaNac_CalendarExtender" runat="server" TargetControlID="txtFechaNac" Format="dd/MM/yyyy" />
                        </div>
                        <div class="form form-group">
                            <label for="Documento" runat="server">N° de Documento</label>
                            <div class="form form-inline">
                                <asp:DropDownList ID="LstTDoc" runat="server" class="form-control">
                                    <asp:ListItem Value="1">DNI</asp:ListItem>
                                    <asp:ListItem Value="2">LC</asp:ListItem>
                                    <asp:ListItem Value="3">LE</asp:ListItem>
                                    <asp:ListItem Value="4">PAS</asp:ListItem>
                                </asp:DropDownList>
                                <asp:TextBox ID="txtDocumento" runat="server" class="form-control" Width="300px"></asp:TextBox>
                            </div>
                        </div>
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

            <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" BackgroundCssClass="modalBackground" PopupControlID="pnlMovimientos" TargetControlID="btnNuevo" BehaviorID="modalPopupExtender1">
            </ajaxToolkit:ModalPopupExtender>

        </ContentTemplate>
    </asp:UpdatePanel>

    <asp:Button ID="btnExcel" runat="server" class="btn btn-secondary" OnClick="btnExcel_Click" Text="Excel" />

    <br />
    <br />
    <br />


    <%--</form>--%>
</asp:Content>
