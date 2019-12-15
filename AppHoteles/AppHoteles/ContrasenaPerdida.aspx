<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ContrasenaPerdida.aspx.cs" Inherits="AppHoteles.ContrasenaPerdida" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div runat="server">
        <br />
        <link rel="stylesheet" href="css/estilos.css" />
        <asp:Panel runat="server">
            <h2 style=" color: #0000FF; text-align:center;"><strong><em>Recuperación de Contraseña:</em></strong></h2>
            <hr />
            <!--Contenedor de lo que vendria siendo la contraseña nueva-->
            <h4 style="text-align:center; color:black;"><b>Correo electronico:</b></h4>
            <asp:TextBox ID="txtFindEmail" runat="server" TextMode="Email" CssClass="form-control center-block" AutoPostBack="True"></asp:TextBox><br />
            <br />
            <!--Y por su puesto no olvidemos el botoncito que ejecuta el cambio-->
            <asp:Button ID="btnRecuperacion" runat="server" Text="Recuperar Contraseña" Font-Bold="True" CssClass="form-control btn btn-primary center-block" OnClick="btnRecuperacion_Click" Enabled="True" />
            <hr />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:HyperLink ID="hlLogin" runat="server" NavigateUrl="~/Login.aspx" ForeColor="#0033CC">Volver a ingresar</asp:HyperLink>
            <br />
            <em><asp:Label ID="lblExito" runat="server" Font-Bold="True" ForeColor="Black"></asp:Label></em><br />
            <em><asp:Label ID="lblError" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label></em><br />
            <script type="text/javascript">
                function openModal() {
                    $('#btnAbrir').click();
                }
            </script>
            <!--Este es el botoncito de abrir el dichoso Modal-->
            <button style="display:none;" type="button" id="btnAbrir" data-toggle="modal" data-target="#exampleModal" style="color:dodgerblue;"></button>
            <!--Contenedor de lo que vendria siendo el Modal-->
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="exampleModalLabel">Correo recibido con exito</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            Revisa tu bandeja de entrada
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button> 
                        </div>
                    </div>
                </div>
            </div>
        </asp:Panel>
    </div>
</asp:Content>
