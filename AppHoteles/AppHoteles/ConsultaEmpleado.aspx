<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ConsultaEmpleado.aspx.cs" Inherits="AppHoteles.ConsultaEmpleado" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="pnlConEmp" runat="server">
        <link rel="stylesheet" href="css/estilos.css"/>
        <br />
        <h2 style="color: #0000FF; text-align:center;"><strong><em>Buscar Recepcionistas</em></strong></h2>
        <hr />
        <h4 style="text-align:center; color:black;"><b>Identificación:</b></h4>
        <asp:TextBox ID="txtConEmp" runat="server" OnKeyPress="return justNumbers(event);" CssClass="form-control center-block"></asp:TextBox><br />
        <br />
        <asp:Button ID="btnConsulEmp" runat="server" Text="Consultar" OnClick="btnConsulEmp_Click" CssClass="form-control btn btn-primary" Font-Bold="True"/>
        <asp:Button ID="btnDeleteEmp" Text="Eliminar" runat="server" OnClick="btnDeleteEmp_Click" CssClass="form-control btn btn-primary" Font-Bold="True" Enabled="False" />
        <br />
        <br />
        <asp:GridView runat="server" ID="gridGenerico" CssClass="table table-striped table-dark">
            <HeaderStyle BackColor="Blue" BorderColor="Black" Font-Italic="False" />
            <RowStyle BorderColor="Black" />
            <SelectedRowStyle BackColor="#666666" />
        </asp:GridView>
    </asp:Panel>
    <em><asp:Label ID="lblError" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label></em>
</asp:Content>
