<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ConsultaCliente.aspx.cs" Inherits="AppHoteles.ConsultaCliente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="pnlConCli" runat="server">
        <link rel="stylesheet" href="css/estilos.css"/>
        <br />
        <h2 style="color: #0000FF; text-align:center" ><strong><em>Huéspedes Registrados</em></strong></h2>
        <hr />
        <h4 style="text-align:center; color:black;"><b>Identificación:</b></h4>
        <asp:TextBox ID="txtConCli" runat="server" OnKeyPress="return justNumbers(event);" CssClass="form-control center-block"></asp:TextBox><br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnConsulCli" runat="server" Text="Ver Registros" OnClick="btnConsulCli_Click" Font-Bold="True" CssClass="btn btn-primary" />
        <asp:Button ID="btnDeleteCli" Text="Eliminar" runat="server" OnClick="btnDeleteCli_Click" Font-Bold="True" CssClass="btn btn-primary" Enabled="False" />
        <asp:Button ID="btnHistory" Text="Historial" runat="server" OnClick="btnHistory_Click" Font-Bold="True" CssClass="btn btn-primary"/>
        <asp:Button ID="btnVerCli" Text="Registrar" runat="server" OnClick="btnVerCli_Click" Font-Bold="True" CssClass="btn btn-primary" />
        <br />
        <br />
        <asp:GridView runat="server" ID="gridGenerico" CssClass="table table-striped table-dark">
            <HeaderStyle BackColor="Blue" BorderColor="Black" Font-Italic="False" />
            <RowStyle BorderColor="Black" />
            <SelectedRowStyle BackColor="#666666" />
        </asp:GridView>
        <br />
        <asp:GridView runat="server" ID="gridHistorial" CssClass="table table-striped table-dark">
            <HeaderStyle BackColor="Blue" BorderColor="Black" Font-Italic="False" />
            <RowStyle BorderColor="Black" />
            <SelectedRowStyle BackColor="#666666" />
        </asp:GridView>
    </asp:Panel>
    <em><asp:Label ID="lblError" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label></em>
</asp:Content>
