<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Feligreses.aspx.cs" MasterPageFile="/base.Master" Inherits="UI.Parishioner" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--</form>--%>

    <link href="css/stylegen.css" rel="stylesheet" />
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <h1>Feligreses</h1>

                        <asp:Button ID="btnNuevo" CssClass="btn btn-primary" runat="server" Text="Nuevo feligrés" OnClick="btnNuevo_Click" />
                        <div class="form-inline float-lg-right">
                            <div class="form-group mx-sm-3 mb-2">
                                <asp:TextBox ID="txtNombreBuscar" class="form-control" PlaceHolder="Nombre" runat="server"></asp:TextBox>
                                <asp:TextBox ID="txtApellidoBuscar" class="form-control" PlaceHolder="Apellido" runat="server"></asp:TextBox>
                                <asp:TextBox ID="txtDocumentoBuscar" class="form-control" PlaceHolder="Documento" runat="server"></asp:TextBox>
                                <div class="form form-group">
                                <label for="fechanac" runat="server">Fecha 1</label>
                                <asp:TextBox ID="dateInicio" class="form-control" runat="server" Width="350px"></asp:TextBox>
                                <ajaxToolkit:CalendarExtender ID="dateInicioBuscar" runat="server" TargetControlID="dateInicio" Format="dd/MM/yyyy" />
                                </div>
                                <div class="form form-group">
                                <label for="fechanac" runat="server">Fecha 2</label>
                                <asp:TextBox ID="dateFin" class="form-control" runat="server" Width="350px"></asp:TextBox>
                                <ajaxToolkit:CalendarExtender ID="dateFinBuscar" runat="server" TargetControlID="dateFin" Format="dd/MM/yyyy" />
                                </div>

                                <asp:Button ID="BtnBuscar" runat="server" class="btn btn-secondary" OnClick="BtnBuscar_Click" Text="Buscar" />
                            </div>

                        </div>


                        <asp:GridView ID="dgvFeligres" runat="server" class="table" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" OnRowCommand="ViewParishioner_RowCommand1" AutoGenerateColumns="False" DataKeyNames="Id" CellSpacing="2" ForeColor="Black" AllowPaging="true" OnPageIndexChanging="dgvFeligres_PageIndexChanging">

                            <Columns>
                                <asp:BoundField HeaderText="Id" DataField="Id" Visible="False">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Codigo Interno" DataField="CodigoInterno">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Nombre" DataField="Nombre">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Apellido" DataField="Apellido">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Fecha de nacimiento" DataField="FechaNacimiento" DataFormatString="{0:dd/MM/yyyy}">

                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>

                                <asp:BoundField HeaderText="Tipo Documento" DataField="TDoc">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>


                                <asp:BoundField HeaderText="Documento" DataField="Documento">
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

                                <asp:BoundField HeaderText="Vivo" DataField="Vivo" Visible="False">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>

                                <asp:BoundField HeaderText="IdEntidad" DataField="IdEntidad" Visible="False">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>

                                <asp:BoundField HeaderText="EsContacto" DataField="EsContacto" Visible="False">
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
                            <FooterStyle BackColor="#CCCCCC" />
                            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                            <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                            <RowStyle BackColor="White" />
                            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                            <SortedAscendingHeaderStyle BackColor="#808080" />
                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                            <SortedDescendingHeaderStyle BackColor="#383838" />
                        </asp:GridView>


                        <br />
                        <asp:Label ID="lblResultado" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>

            <asp:HiddenField ID="hid" runat="server" />



            <asp:Panel ID="pnlFeligres" runat="server" CssClass="modalpopup" Width="380px" ScrollBars="Horizontal">

                <div class="modal-header" id="ModalHeader">

                    <h3>Feligres</h3>
                </div>

                <div class="form form-group">
                    <label for="Nombre" runat="server">Nombre</label>
                    <asp:TextBox ID="txtNombre" class="form-control" runat="server" Width="350px"></asp:TextBox>
                </div>

                <div class="form form-group">
                    <label for="apellido" runat="server">Apellido</label>
                    <asp:TextBox ID="txtApellido" class="form-control" runat="server" Width="350px"></asp:TextBox>
                </div>
                <div class="form form-group">
                    <label for="fnacimiento" runat="server">Fecha de Nacimiento</label>
                    <asp:TextBox ID="txtFechaNac" class="form-control" runat="server" Width="350px"></asp:TextBox>

                    <ajaxToolkit:CalendarExtender ID="txtFechaNac_CalendarExtender" runat="server" TargetControlID="txtFechaNac" Format="dd/MM/yyyy" />

                </div>

                <div class="form form-group">
                    <label for="TDoc" runat="server">Tipo de Documento</label>
                    <asp:DropDownList ID="LstTDoc" runat="server">
                        <asp:ListItem Value="1">DNI</asp:ListItem>
                        <asp:ListItem Value="2">LC</asp:ListItem>
                        <asp:ListItem Value="3">LE</asp:ListItem>
                        <asp:ListItem Value="4">PAS</asp:ListItem>
                    </asp:DropDownList>
                </div>


                <div class="form form-group">
                    <label for="Documento" runat="server">N° de Documento</label>
                    <asp:TextBox ID="txtDocumento" class="form-control" runat="server" Width="350px"></asp:TextBox>
                </div>




                <div class="form form-group">
                    <label for="observaciones" runat="server">Observaciones</label>
                    <asp:TextBox ID="txtObservaciones" class="form-control" runat="server" Width="350px"></asp:TextBox>
                </div>
                <div class="form form-group">
                     <label for="Vivo" runat="server">Estado</label>
                   <asp:DropDownList ID="LstVivo" runat="server">
                        <asp:ListItem Value="1">VIVO</asp:ListItem>
                        <asp:ListItem Value="0">DIFUNTO</asp:ListItem>
                    </asp:DropDownList >
                </div>
                <div class="form form-group">
                     <label for="EsContacto" runat="server">Contacto</label>
                    <asp:DropDownList ID="LstContacto" runat="server">
                        <asp:ListItem Value="0">NO</asp:ListItem>
                        <asp:ListItem Value="1">SI</asp:ListItem>
                    </asp:DropDownList>
                </div>


                <br />

                <asp:Button ID="btnGrabar" CssClass="btn-success" runat="server" Text="Guardar" OnClick="btnGrabar_Click" />
                <asp:Button ID="btnCancelar" CssClass="btn-danger" runat="server" Text="Cancelar" OnClick="btnCancelar_Click" />



            </asp:Panel>

            <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" BackgroundCssClass="modalBackground" PopupControlID="pnlFeligres" TargetControlID="btnNuevo" BehaviorID="modalPopupExtender1">
            </ajaxToolkit:ModalPopupExtender>

        </ContentTemplate>
    </asp:UpdatePanel>



    <br />
    <br />
    <br />


    <%--</form>--%>
</asp:Content>
