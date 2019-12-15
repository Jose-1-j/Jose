<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NuevoServicio.aspx.cs" Inherits="AppHoteles.NuevoServicio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="pnlServicio" runat="server" Visible="true">
        <link rel="stylesheet" href="css/estilos.css"/>
        <br />
        <h2 style="color: #0000FF; text-align:center;"><strong><em>Nuevo Servicio</em></strong></h2>
        <hr />
        <asp:DropDownList ID="ddlEmpleado" runat="server" AutoPostBack="False" class="btn btn-secondary dropdown-toggle center-block"></asp:DropDownList>
        <hr />
        <h4 style="text-align:center; color:black;"><b>Descripción</b></h4>
        <asp:TextBox ID="txtDES" runat="server" OnKeyPress="return justLetters(event);" CssClass="form-control center-block"></asp:TextBox><br />
        <h4 style="text-align:center; color:black;"><b>Precio</b></h4>
        <asp:TextBox ID="txtVAL" runat="server" OnKeyPress="return justNumbers(event);" CssClass="form-control center-block"></asp:TextBox><br />
        <h4 style="text-align:center; color:black;"><b>Disponibilidad</b></h4>
        <asp:TextBox ID="txtDIS" runat="server" OnKeyPress="return justLetters(event);" CssClass="form-control center-block"></asp:TextBox><br />
        <br />
        <asp:Button ID="btnSaveSer" runat="server" Text="Guardar" OnClick="btnSaveSer_Click" Font-Bold="True" CssClass="form-control btn btn-primary center-block"/>
        <br />
        <br />
        <em><asp:Label ID="lblError" runat="server" Text="" Font-Bold="True" ForeColor="Red"></asp:Label></em>
    </asp:Panel>
</asp:Content>
