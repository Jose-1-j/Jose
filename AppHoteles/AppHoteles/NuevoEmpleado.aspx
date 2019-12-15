<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NuevoEmpleado.aspx.cs" Inherits="AppHoteles.NuevoEmpleado" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="pnlEmpleado" runat="server" Visible="True">
        <link rel="stylesheet" href="css/estilos.css"/>
        <br />
        <h2 style="color: #0000FF; text-align:center;"><strong><em>Nuevo Empleado</em></strong></h2><hr />
        <br />
        <h4 style="text-align:center; color:black;"><b>Nombre del Empleado</b></h4>
        <asp:TextBox ID="txtNOMEMP" runat="server" OnKeyPress="return justLetters(event);" CssClass="form-control center-block"></asp:TextBox><br />
        <h4 style="text-align:center; color:black;"><b>Telefono</b></h4>
        <asp:TextBox ID="txtTELEMP" runat="server" OnKeyPress="return justNumbers(event);" CssClass="form-control center-block"></asp:TextBox><br />
        <h4 style="text-align:center; color:black;"><b>Salario</b></h4>
        <asp:TextBox ID="txtSALEMP" runat="server" OnKeyPress="return justNumbers(event);" CssClass="form-control center-block"></asp:TextBox><br />
        <br />
        <asp:Button ID="btnSaveEmp" runat="server" Text="Guardar" OnClick="btnSaveEmp_Click" Font-Bold="True" CssClass="form-control btn btn-primary center-block"/>
        <br />
        <br />
        <em><asp:Label ID="lblError" runat="server" Text="" Font-Bold="True" ForeColor="Red"></asp:Label></em>
    </asp:Panel>
</asp:Content>
