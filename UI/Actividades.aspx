<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Actividades.aspx.cs" MasterPageFile="/base.Master" Inherits="UI.Actividades" %>

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
                        <h1>Actividades</h1>
                        <div class="row">
                            <div class="col-md-2 ml-0">
                                <asp:Button ID="btnNuevo" CssClass="btn btn-primary" runat="server" Text="Nueva actividad" OnClick="btnNuevo_Click" />
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
                                        <label for="txtTextoBuscar" runat="server">Actividad</label>
                                        <label for="Actividades" runat="server">Actividad</label>
                                        <asp:DropDownList ID="lstActividades" runat="server" OnSelectedIndexChanged="lstActividades_SelectedIndexChanged"></asp:DropDownList>
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
                        

                        <asp:GridView ID="dgvActividad" runat="server" class="table table-striped text-center" CellPadding="4" AutoGenerateColumns="False" DataKeyNames="IdEntidad" CellSpacing="2"  AllowPaging="true">
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



            <asp:Panel ID="pnlActividad" runat="server" CssClass="modalpopup">

                <div class="modal-header" id="ModalHeader">

                    <h3>Actividad</h3>
                </div>
                <div class="modal-body">
                    <div class="form form-inline">
                        <div class="form form-group">
                            <label for="Nombre" runat="server">Nombre</label>
                            <asp:TextBox ID="txtNombre" class="form-control" runat="server" Width="350px"></asp:TextBox>
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

            <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" BackgroundCssClass="modalBackground" PopupControlID="pnlActividad" TargetControlID="btnNuevo" BehaviorID="modalPopupExtender1">
            </ajaxToolkit:ModalPopupExtender>

        </ContentTemplate>
    </asp:UpdatePanel>



    <br />
    <br />
    <br />


    <%--</form>--%>
</asp:Content>
