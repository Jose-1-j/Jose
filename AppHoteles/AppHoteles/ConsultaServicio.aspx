<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ConsultaServicio.aspx.cs" Inherits="AppHoteles.ConsultaServicio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="pnlConSer" runat="server">
        <link rel="stylesheet" href="css/estilos.css"/>
        <br />
        <h2 style="color: #0000FF; text-align:center;"><strong><em>Catálogo de Servicios</em></strong></h2>
        <hr />
        <h4 style="text-align:center; color:black;"><b>Servicio:</b></h4>
        <asp:TextBox ID="txtConSer" runat="server" OnkeyPress="return justNumbers(event);" CssClass="form-control center-block"></asp:TextBox><br />
        <h4 style="text-align:center; color:black;"><b>Precio:</b></h4>
        <asp:TextBox ID="txtPreNew" runat="server" OnkeyPress="return justNumbers(event);" CssClass="form-control center-block" Enabled="False"></asp:TextBox><br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnConsulSer" runat="server" Text="Detalles Concretos" OnClick="btnConsulSer_Click" Font-Bold="True" CssClass="btn btn-primary"/>
        <asp:Button ID="btnDeleteSer" Text="Eliminar" runat="server" OnClick="btnDeleteSer_Click" Font-Bold="True" CssClass="btn btn-primary" Enabled="False" />
        <asp:Button ID="btnUpdateSer" Text="Cambiar Precio" runat="server" OnClick="btnUpdateSer_Click" CssClass="btn btn-primary" Font-Bold="true" Enabled="False" />
        <asp:Button ID="btnVerSer" Text="Insertar" runat="server" OnClick="btnVerSer_Click" CssClass="btn btn-primary" Font-Bold="True"/>
        <%--<asp:Button Text="Servicio Autos" ID="btnSerAutos" runat="server" OnClick="btnSerAutos_Click" Enabled="False" Font-Bold="True" CssClass="form-control btn btn-primary" />--%>
        <%--<asp:Button Text="Servicio Vuelos" runat="server" ID="btnSerVuelos" OnClick="btnSerVuelos_Click" Enabled="False" Font-Bold="True" CssClass="form-control btn btn-primary" />--%><br />
        <br />
        <asp:GridView runat="server" ID="gridGenerico" CssClass="table table-striped table-dark">
            <HeaderStyle BackColor="Blue" BorderColor="Black" Font-Italic="False" />
            <RowStyle BorderColor="Black" />
            <SelectedRowStyle BackColor="#666666" />
        </asp:GridView>
    </asp:Panel>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <em>
        <asp:Label ID="lblError" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
        <asp:Label ID="lblCorrecto" runat="server" Font-Bold="true" ForeColor="Green"></asp:Label>
    </em>
    <hr />
    <%-- Abrir primer modal del primer servicio --%>
    <script type="text/javascript">
        function openModal() {
            $('#btnAbrir').click();
        }

        //Segundo modal del segundo servicio
        function openModalDos() {
            $('#btnAbrir2').click();
        }

        //Segundo modal del segundo servicio
        function openModalTres() {
            $('#btnAbrir3').click();
        }
    </script>
    <div class="row">
        <%-- Primer catalogo de servicio --%>
        <div class="col-md-4">
            <div class="thumbnail">
                <a href="images/1.jpg">
                    <img src="images/1.jpg" style="width: 100%">
                    <div class="caption">
                        <p><b>Habitación con fondo azulado</b></p>    
                    </div>
                </a>
                <%-- Botones de agregar y cancelar reserva --%>
                <asp:Button ID="btnReservar" runat="server" Text="Agregar Reserva" CssClass="btn btn-primary" OnClick="btnReservar_Click" />
                <asp:Button ID="btnCancelar" Text="Cancelar Reserva" runat="server" CssClass="btn btn-danger" Visible="False" OnClick="btnCancelar_Click" />
                <button style="display: none;" type="button" id="btnAbrir" data-toggle="modal" data-target="#exampleModal"></button>
            </div>
        </div>
        <%-- Contenido del primer modal de pago --%>
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="exampleModalLabel"><b>Antes de ocupar el servicio</b></h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <h5>Seleccione el huésped</h5>
                        <hr />
                        <asp:DropDownList ID="ddlSoloUno" runat="server" CssClass="btn btn-secondary dropdown-toggle" OnSelectedIndexChanged="ddlSoloUno_SelectedIndexChanged"></asp:DropDownList>
                        <br />
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                        <asp:Button ID="btnConfiReser" runat="server" Text="Confirmar Reserva" CssClass="btn btn-success" OnClick="btnConfiReser_Click"/>
                    </div>
                </div>
            </div>
        </div>





        <%-- Contenido del segundo catalogo de servicio --%>
        <div class="col-md-4">
            <div class="thumbnail">
                <a href="images/2.jpg">
                    <img src="images/2.jpg" style="width: 100%">
                    <div class="caption">
                        <p><b>Servicio de desayuno y valcón</b></p>
                    </div>
                </a>
                <%-- Botones de agregar y cancelar reserva --%>
                <asp:Button Text="Agregar Reserva" runat="server" ID="btnReservar2" CssClass="btn btn-primary" OnClick="btnReservar2_Click"/>
                <asp:Button Text="Cancelar Reserva" runat="server" Visible="False" ID="btnCancelar2" CssClass="btn btn-danger" OnClick="btnCancelar2_Click"/>
                <button style="display: none;" type="button" id="btnAbrir2" data-toggle="modal" data-target="#exampleModal2"></button>
            </div>
        </div>
        <%-- Contenido del segundo modal de pago --%>
        <div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="exampleModalLabel2"><b>Antes de ocupar el servicio</b></h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <h5>Seleccione el huésped</h5>
                        <hr />
                        <asp:DropDownList ID="ddlSoloDos" runat="server" CssClass="btn btn-secondary dropdown-toggle" OnSelectedIndexChanged="ddlSoloDos_SelectedIndexChanged"></asp:DropDownList>
                        <br />
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                        <asp:Button ID="btnConfiReser2" runat="server" Text="Confirmar Reserva" CssClass="btn btn-success" OnClick="btnConfiReser2_Click"/>
                    </div>
                </div>
            </div>
        </div>





        <%--Contenido del tercer catalogo de servicio --%>
        <div class="col-md-4">
            <div class="thumbnail">
                <a href="images/3.jpg">
                    <img src="images/3.jpg" style="width: 100%">
                    <div class="caption">
                        <p><b>Habitación con fondo blanco</b></p>
                    </div>
                </a>
                <asp:Button Text="Agregar Reserva" runat="server" ID="btnReservar3" CssClass="btn btn-primary" OnClick="btnReservar3_Click"/>
                <asp:Button Text="Cancelar Reserva" runat="server" Visible="False" ID="btnCancelar3" CssClass="btn btn-danger" OnClick="btnCancelar3_Click"/>
                <button style="display: none;" type="button" id="btnAbrir3" data-toggle="modal" data-target="#exampleModal3"></button>
            </div>
        </div>
        <%-- Contenido del tercer modal de pago --%>
        <div class="modal fade" id="exampleModal3" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="exampleModalLabel3"><b>Antes de ocupar el servicio</b></h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <h5>Seleccione el huésped</h5>
                        <hr />
                        <asp:DropDownList ID="ddlSoloTres" runat="server" CssClass="btn btn-secondary dropdown-toggle" OnSelectedIndexChanged="ddlSoloTres_SelectedIndexChanged"></asp:DropDownList>
                        <br />
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                        <asp:Button ID="btnConfiReser3" runat="server" Text="Confirmar Reserva" CssClass="btn btn-success" OnClick="btnConfiReser3_Click"/>
                    </div>
                </div>
            </div>
        </div>
        <%--  --%>
        <div class="col-md-4">
            <div class="thumbnail">
                <a href="images/4.jpg">
                    <img src="images/4.jpg" style="width: 100%">
                    <div class="caption">
                        <p><b>Guarida con piscina incluida</b></p>
                    </div>
                </a>
                <button type="button" class="btn btn-primary">Reserva ahora</button>
            </div>
        </div>
        <%--  --%>
        <div class="col-md-4">
            <div class="thumbnail">
                <a href="images/5.jpg">
                    <img src="images/5.jpg" style="width: 100%">
                    <div class="caption">
                        <p><b>Habitación con vestidor incluido</b></p>
                    </div>
                </a>
                <button type="button" class="btn btn-primary">Reserva ahora</button>
            </div>
        </div>
        <%--  --%>
        <div class="col-md-4">
            <div class="thumbnail">
                <a href="images/6.jpg">
                    <img src="images/6.jpg" style="width: 100%">
                    <div class="caption">
                        <p><b>Habitación oscura con ático</b></p>
                    </div>
                </a>
                <button type="button" class="btn btn-primary">Reserva ahora</button>
            </div>
        </div>
        <%--  --%>
        <div class="col-md-4">
            <div class="thumbnail">
                <a href="images/7.jpg">
                    <img src="images/7.jpg" style="width: 100%">
                    <div class="caption">
                        <p><b>Bar</b></p>
                    </div>
                </a>
                <button type="button" class="btn btn-primary">Reserva ahora</button>
            </div>
        </div>
        <%--  --%>
        <div class="col-md-4">
            <div class="thumbnail">
                <a href="images/8.jpg">
                    <img src="images/8.jpg" style="width: 100%">
                    <div class="caption">
                        <p><b>Habitación con televisor incluido</b></p>
                    </div>
                </a>
                <button type="button" class="btn btn-primary">Reserva ahora</button>
            </div>
        </div>
        <%--  --%>
        <div class="col-md-4">
            <div class="thumbnail">
                <a href="images/9.jpg">
                    <img src="images/9.jpg" style="width: 100%">
                    <div class="caption">
                        <p><b>Habitación con valcon</b></p>
                    </div>
                </a>
                <button type="button" class="btn btn-primary">Reserva ahora</button>
            </div>
        </div>
    </div>
</asp:Content>
