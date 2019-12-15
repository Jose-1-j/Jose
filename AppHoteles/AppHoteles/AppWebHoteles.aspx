<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AppWebHoteles.aspx.cs" Inherits="AppHoteles.AppWebHoteles" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <!--Librerias del css con para el Carrusel-->
    <link rel="stylesheet" href="css/jquery.bxslider.css"/>
    <link rel="stylesheet" href="css/jquery.bxslider.min.css"/>
    <!--Esta hoja de estilos es generalizada-->
    <link rel="stylesheet" href="css/estilos.css"/>
    <%--<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">--%>
    <!--Esta hoja de estilo es perteneciente a la barra social-->
    <link rel="stylesheet" href="iconos/fonts.css"/>
    <!--Se vienen scripts importantes-->
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script type="text/javascript" src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <!--No confundir las importaciones con el resto del codigo-->
    <br />
    <div class="form-group">
        <img src="logos/LogoSample.jpg" alt="Logo" class="center-block" />
    </div>
    <!--<h1 class="text-center"><strong><em style="color: #0094ff">Hotel Altamar</em></strong></h1> -->
    <br />
    <!--Lo siguiente es un contenedor para la barra social-->
    <div class="social">
	    <ul class="animated rollIn">
		    <li><a href="#" class="icon-blogger" target="_blank"></a></li>
            <li><a href="#" class="icon-twitter" target="_blank"></a></li>
		    <li><a href="#" class="icon-instagram" target="_blank"></a></li>
		    <li><a href="#" class="icon-pinterest" target="_blank"></a></li>
		    <li><a href="#" class="icon-gmail" target="_blank"></a></li>
	    </ul>
    </div>
    <!--Este vendria siendo el apartado de la presentacion de imagenes-->
    <div id="Presentation" class="animated zoomIn">
        <asp:Repeater ID="Repeater1" runat="server" ValidateRequestMode="Enabled" ViewStateMode="Enabled">
            <ItemTemplate>
                <a href="<%# Container.DataItem %>">
                   <img src="<%# Container.DataItem %>"/>
                </a>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <!--Librerias js para el Carrusel-->
    <script src="js/jquery.bxslider.js"></script>
    <script src="js/jquery.bxslider.min.js"></script>
    <script type="text/javascript">
        $("#Presentation").bxSlider({
            auto: true,
        });
    </script>
    <br />
    <!--A continuacion los botones aunque seria bueno mejorar su estilo-->
    <!--Las listas deplegables permaneceran inhabilitadas hasta nuevo aviso-->
    <asp:DropDownList ID="ddlEmpleado" runat="server" OnSelectedIndexChanged="ddlEmpleado_SelectedIndexChanged" AutoPostBack="True" Visible="False"></asp:DropDownList>
    <asp:DropDownList ID="ddlServicio" runat="server" OnSelectedIndexChanged="ddlServicio_SelectedIndexChanged" AutoPostBack="True" Visible="False"></asp:DropDownList>
    <asp:DropDownList ID="ddlCliente" runat="server" OnSelectedIndexChanged="ddlCliente_SelectedIndexChanged" AutoPostBack="True" Visible="False"></asp:DropDownList>
    <em> <asp:Label ID="lblError" runat="server" style="font-size: medium" ForeColor="Red" Font-Bold="True"></asp:Label>
    <strong>
        <%--<asp:Label runat="server" style="font-size: medium" Text="Bienvenido " ForeColor="Blue"></asp:Label>--%>
        <%--<asp:Label ID="lblNombre" runat="server" style="font-size: medium" Text="Label" ForeColor="Blue"></asp:Label>--%>
    </strong>
    <br />
    <br />
    </em>
</asp:Content>