<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Facturacion.aspx.cs" Inherits="AppHoteles.Facturacion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel runat="server" ID="pnlFactura">
        <link rel="stylesheet" href="css/estilos.css"/>
        <br />
        <h2 style="color: #0000FF; text-align:center;"><strong><em>Generar Nueva Factura</em></strong></h2>
        <hr />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="ddlEmpleado" runat="server" class="btn btn-secondary dropdown-toggle" OnSelectedIndexChanged="ddlEmpleado_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
        <asp:DropDownList ID="ddlServicio" runat="server" class="btn btn-secondary dropdown-toggle" OnSelectedIndexChanged="ddlServicio_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
        <asp:DropDownList ID="ddlCliente" runat="server" class="btn btn-secondary dropdown-toggle" OnSelectedIndexChanged="ddlCliente_SelectedIndexChanged" AutoPostBack="False"></asp:DropDownList>
        <hr />
        <h4 style="text-align:center; color:black;"><b>Fecha</b></h4>
        <asp:TextBox ID="txtFecha" runat="server" TextMode="Date" CssClass="form-control center-block"></asp:TextBox><br />
        <h4 style="text-align:center; color:black;"><b>Subtotal</b></h4> 
        <asp:TextBox ID="txtSub" runat="server" OnKeyPress="return justNumbers(event);" CssClass="form-control center-block"></asp:TextBox><br />
        <h4 style="text-align:center; color:black;"><b>Impuesto Valor Agregado</b></h4>
        <asp:TextBox ID="txtIva" runat="server" CssClass="form-control center-block"></asp:TextBox><br />
        <h4 style="text-align:center; color:black;"><b>Total a Pagar</b></h4>
        <asp:TextBox ID="txtTotal" runat="server" CssClass="form-control center-block"></asp:TextBox><br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnCalcular" runat="server" Text="Calcular" OnClick="btnCalcular_Click" Font-Bold="True" CssClass="form-control btn btn-primary" />
        <asp:Button ID="btnGenerar" runat="server" Text="Generar" OnClick="btnGenerar_Click" Font-Bold="True" CssClass="form-control btn btn-primary" Enabled="False" />
    </asp:Panel>
    <br />
    <em><asp:Label ID="lblError" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label></em>
    <br />
    <h3 style="text-align:center; color: #0000FF"><em><strong>Facturas Generadas</strong></em></h3>
    <br />
    <asp:GridView runat="server" ID="gridFactura" CssClass="table table-striped table-dark">
        <HeaderStyle BackColor="Blue" BorderColor="Black" Font-Italic="False" />
        <RowStyle BorderColor="Black" />
        <SelectedRowStyle BackColor="#666666" />
    </asp:GridView>
</asp:Content>
