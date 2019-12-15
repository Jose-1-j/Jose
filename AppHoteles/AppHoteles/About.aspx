<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="AppHoteles.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <%--<h2><%: Title %>.</h2>--%><br />
    <h3 color: #0000FF"><strong><em>Acerca de nosotros</em></strong></h3>
    <hr />
    <div class="row">
        <div class="col-md-3">
            <div class="thumbnail" style="border-radius: 5px;">
                <a href="logos/jose.jpg">
                    <img src="logos/jose.jpg" style="width: 100%; height:auto">
                    <div class="caption">
                        <p><b>Correo de contacto</b></p>
                        <p>josemanuel-0123@hotmail.com</p>
                    </div>
                </a>
            </div>
        </div>
    </div>
    <p> 
       <strong style="color: black">
            Muchos usuarios necesitan tomarse el tiempo para planear sus viajes, buscar hoteles en los cuales desea hospedarse sin duda no tiene 
            como plantear sus reservas y comprar los tiquetes por lo visto, muchos usuarios tienen que asistir de manera personal a las oficinas de la  
            aerolínea que consumen los servicios correspondientes al hotel que van a adquirir, pero por lo general solo se requiere que el usuario de
            una manera más simple y confortable pueda acceder a un sistema informático y contactar con el personal del hotel al que desea hacer hospedaje.
       </strong>
    </p>
</asp:Content>
