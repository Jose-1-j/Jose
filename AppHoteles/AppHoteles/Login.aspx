<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="AppHoteles.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div runat="server">
        <br />
        <link rel="stylesheet" href="css/estilos.css"/>
        <%--<link rel="stylesheet" href="css/progressBar.css"/>
        <script src="js/progressBar.js"></script>--%>
        <!--Como simpre se importan las librerias necesarias para mejorar el codigo y el diseño-->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <!--Tengan cuidado con lo se viene porque probablemente sea estilo-->
        <asp:Panel runat="server">
            <img style="margin-left:500px;" src="logos/Usuario.png" />
            <h2 style="text-align:center;"><strong><em>Inicio de sesión</em></strong></h2>
            <hr />
            <!--Contenedor de lo que vendria siendo el usuario-->
            <h4 style="text-align:center; color:black;"><b>Usuario</b></h4>
            <div class="form-group">
                <asp:TextBox ID="txtUsuario" runat="server" CssClass="form-control center-block" TextMode="Email"></asp:TextBox><br />
            </div>
            <!--Contenedor de lo que vendria siendo la contraseña-->
            <h4 style="text-align:center; color:black;"><b>Contraseña</b></h4>
            <div class="form-group">
                <asp:TextBox ID="txtClave" runat="server" TextMode="Password" CssClass="form-control center-block"></asp:TextBox><br />
            </div>
            <!--Y por su puesto no olvidemos el botoncito de ingresar al sistema-->
            <div class="form-group">
                <asp:Button ID="btnAceptar" runat="server" Text="Ingresar" OnClick="btnAceptar_Click" Font-Bold="True" CssClass="form-control btn btn-primary center-block" Enabled="True" />
            </div>
            <hr />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:HyperLink ID="hlRegistro" runat="server" NavigateUrl="~/NuevoEmpleado.aspx" ForeColor="#0033CC">Nuevo Recepcionista</asp:HyperLink>&nbsp;&nbsp;&nbsp;
            <asp:HyperLink ID="hlLostPass" runat="server" NavigateUrl="~/ContrasenaPerdida.aspx" ForeColor="#0033CC">¿Olvido su contraseña?</asp:HyperLink>
            <br />
            <asp:Label ID="lblIncorrecto" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
            <!--This is my JavaScript code-->
            <script type="text/javascript">
                function openModal() {
                    $('#btnAbrir').click();
                }
            </script>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <!--Este es el botoncito de abrir el dichoso Modal-->
            <button style="display:none;" type="button" id="btnAbrir" data-toggle="modal" data-target="#exampleModal"></button>
            <!--Contenedor de lo que vendria siendo el Modal-->
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="exampleModalLabel">Error al ingresar</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            Credenciales incorrectos
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
