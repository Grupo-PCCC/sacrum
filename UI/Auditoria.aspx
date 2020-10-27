<%@ Page Title="" Language="C#" MasterPageFile="/base.Master" AutoEventWireup="true" CodeBehind="Auditoria.aspx.cs" Inherits="UI.Auditoria" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--<form id="form1" runat="server" class="">--%>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <h1>Auditoría</h1>
                        <%--</form>--%>
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
                                        <label for="txtTextoBuscar" runat="server">Acción</label>
                                        <asp:TextBox ID="txtTextoBuscar" class="form-control mr-5" PlaceHolder="Texto" runat="server"></asp:TextBox>
                                        <label for="Usuario" runat="server">Usuario</label>
                                        <asp:DropDownList ID="lstUsuario" runat="server" OnSelectedIndexChanged="lstUsuario_SelectedIndexChanged"></asp:DropDownList>

                                        <%--<asp:TextBox ID="txtIdUsuario" class="form-control mr-5" PlaceHolder="ID del Usuario" runat="server"></asp:TextBox>--%>

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
                </div>
            </div>


            <asp:GridView ID="dgvAuditoria" runat="server" class="table table-striped text-center" CellPadding="4" AutoGenerateColumns="False" CellSpacing="2" AllowPaging="true">
                <Columns>

                    <asp:BoundField HeaderText="Fecha" DataField="Fecha">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="Usuario" DataField="Nick">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>

                    <asp:BoundField HeaderText="Accion" DataField="Accion">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                </Columns>

            </asp:GridView>
                       
            <br />
            <asp:Label ID="lblResultado" runat="server" Text=""></asp:Label>
            <%--</form>--%>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
