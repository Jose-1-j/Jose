<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NuevoCliente.aspx.cs" Inherits="AppHoteles.NuevoCliente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="pnlCliente" runat="server" Visible="True">
        <link rel="stylesheet" href="css/estilos.css"/>
        <br />
        <h2 style="color: #0000FF; text-align:center;"><strong><em>Registro de huesped</em></strong></h2>
        <hr />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="ddlEmpleado" runat="server" class="btn btn-secondary dropdown-toggle" OnSelectedIndexChanged="ddlEmpleado_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
        <asp:DropDownList ID="ddlServicio" runat="server" class="btn btn-secondary dropdown-toggle" AutoPostBack="False" OnSelectedIndexChanged="ddlServicio_SelectedIndexChanged"></asp:DropDownList>
        <hr />
        <h4 style="text-align:center; color:black;"><b>Identificación</b></h4>
        <asp:TextBox ID="txtIDCLI" runat="server" OnkeyPress="return justNumbers(event);" CssClass="form-control center-block"></asp:TextBox><br />
        <h4 style="text-align:center; color:black;"><b>Nombre del Cliente</b></h4>
        <asp:TextBox ID="txtNOMCLI" runat="server" OnKeyPress="return justLetters(event);" CssClass="form-control center-block"></asp:TextBox><br />
        <h4 style="text-align:center; color:black;"><b>Apellido del Cliente</b></h4>
        <asp:TextBox ID="txtAPECLI" runat="server" OnKeyPress="return justLetters(event);" CssClass="form-control center-block"></asp:TextBox><br />
        <h4 style="text-align:center; color:black;"><b>Telefono</b></h4>
        <asp:TextBox ID="txtTELCLI" runat="server" OnkeyPress="return justNumbers(event);" CssClass="form-control center-block"></asp:TextBox><br />
        <h4 style="text-align:center; color:black;"><b>Dinero Disponible</b></h4>
        <asp:TextBox ID="txtDinero" runat="server" OnkeyPress="return justNumbers(event);" CssClass="form-control center-block"></asp:TextBox><br />
        <h4 style="text-align:center; color:black;"><b>Fecha de Llegada</b></h4>
        <asp:TextBox ID="txtFechaLlegada" runat="server" CssClass="form-control center-block" TextMode="Date"></asp:TextBox><br />
        <h4 style="text-align:center; color:black;"><b>Fecha de Salida</b></h4>
        <asp:TextBox ID="txtFechaSalida" runat="server" CssClass="form-control center-block" TextMode="Date"></asp:TextBox><br />
        <br />
        <asp:Button ID="btnSaveCli" runat="server" Text="Registrar" OnClick="btnSaveCli_Click" Font-Bold="True" CssClass="form-control btn btn-primary center-block"/>
        <br />
        <br />
        <em><asp:Label ID="lblError" runat="server" Text="" Font-Bold="True" ForeColor="Red"></asp:Label></em>
    </asp:Panel>
</asp:Content>
