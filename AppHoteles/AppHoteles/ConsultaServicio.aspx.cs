using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using AppHoteles.AutosWS;
using AppHoteles.VuelosWS;

namespace AppHoteles
{
    public partial class ConsultaServicio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuario"].ToString() == "")
            {
                Response.Redirect("Login.aspx");
            }
            /*else
            {
                lblError.Text = Session["usuario"].ToString();
            }*/

            if (!IsPostBack)
            {
                txtConSer.Focus();
                listaCliente();
                lblError.Text = "";
                lblCorrecto.Text = "";
            }
        }

        private void listaCliente()
        {
            llenarComboSolo();
            llenarComboDos();
            llenarComboTres();
        }

        private void llenarComboSolo()
        {
            this.lblError.Text = "";
            LogicaHotel objemp = new LogicaHotel();
            if (!objemp.ComboSolo(ddlSoloUno))
            {
                this.lblError.Text = objemp.Error;
                return;
            }
        }

        private void llenarComboDos()
        {
            this.lblError.Text = "";
            LogicaHotel objemp = new LogicaHotel();
            if (!objemp.ComboSolo(ddlSoloDos))
            {
                this.lblError.Text = objemp.Error;
                return;
            }
        }

        private void llenarComboTres()
        {
            this.lblError.Text = "";
            LogicaHotel objemp = new LogicaHotel();
            if (!objemp.ComboSolo(ddlSoloTres))
            {
                this.lblError.Text = objemp.Error;
                return;
            }
        }

        protected void ddlSoloUno_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ddlSoloDos_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ddlSoloTres_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnConsulSer_Click(object sender, EventArgs e)
        {
            HotelWS objhot = new HotelWS();
            DataSet dtSer;

            if (String.IsNullOrEmpty(txtConSer.Text))
            {
                dtSer = objhot.ListarServicios();
                this.lblError.Text = "";
                txtPreNew.Enabled = false;
                btnUpdateSer.Enabled = false;
                btnDeleteSer.Enabled = false;
            }
            else
            {
                dtSer = objhot.BuscarServicios(txtConSer.Text);
                this.lblError.Text = "";
                txtPreNew.Enabled = true;
                btnUpdateSer.Enabled = true;
                btnDeleteSer.Enabled = true;
            }
            gridGenerico.DataSource = dtSer;
            gridGenerico.DataBind();
        }

        //protected void btnSerAutos_Click(object sender, EventArgs e)
        //{
        //    ConsumirAutos();
        //}

        //private void ConsumirAutos()
        //{
        //    WebServiceAUTOS objeAutos = new WebServiceAUTOS();
        //    DataTable dtSerAutos;

        //    if (String.IsNullOrEmpty(txtConSer.Text))
        //    {
        //        dtSerAutos = objeAutos.Servicios();
        //        this.lblError.Text = "";
        //    }
        //    else
        //    {
        //        dtSerAutos = objeAutos.ServicioUnico(txtConSer.Text);
        //        this.lblError.Text = "";
        //    }
        //    gridGenerico.DataSource = dtSerAutos;
        //    gridGenerico.DataBind();
        //}

        //protected void btnSerVuelos_Click(object sender, EventArgs e)
        //{
        //    ConsumirVuelos();
        //}

        //private void ConsumirVuelos()
        //{
        //    WebServiceVUELOS objeVuelos = new WebServiceVUELOS();
        //    DataTable dtSerVuelos;

        //    if (String.IsNullOrEmpty(txtConSer.Text))
        //    {
        //        dtSerVuelos = objeVuelos.Servicios();
        //        this.lblError.Text = "";
        //    }
        //    else
        //    {
        //        dtSerVuelos = objeVuelos.ServicioUnico(txtConSer.Text);
        //        this.lblError.Text = "";
        //    }
        //    gridGenerico.DataSource = dtSerVuelos;
        //    gridGenerico.DataBind();
        //}

        protected void btnDeleteSer_Click(object sender, EventArgs e)
        {
            HotelWS objhot = new HotelWS();
            DataSet dtSer;

            try
            {
                if (!String.IsNullOrEmpty(txtConSer.Text))
                {
                    dtSer = objhot.EliminarServicio(txtConSer.Text);
                    Response.Redirect("ConsultaServicio.aspx");
                }
                else
                {
                    this.lblError.Text = "No se puede eliminar una lista completa";
                    return;
                }
            }
            catch (Exception x)
            {
                this.lblError.Text = x.Message;
            } 
        }

        protected void btnUpdateSer_Click(object sender, EventArgs e)
        {
            HotelWS objhot = new HotelWS();
            DataSet dtSer;

            try
            {
                if (!String.IsNullOrEmpty(txtConSer.Text) && !String.IsNullOrEmpty(txtPreNew.Text))
                {
                    dtSer = objhot.AumentoPrecio(txtConSer.Text, txtPreNew.Text);
                    Response.Redirect("ConsultaServicio.aspx");
                }
                else
                {
                    this.lblError.Text = "No se especificó el precio del servicio";
                    return;
                }
            }
            catch (Exception x)
            {
                this.lblError.Text = x.Message;
            }
        }

        protected void btnVerSer_Click(object sender, EventArgs e)
        {
            Response.Redirect("NuevoServicio.aspx");
        }

        protected void btnReservar_Click(object sender, EventArgs e)
        {
            try
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "openModal();", true);
                return;
            }
            catch (Exception x)
            {
                lblError.Text = x.Message;
            }
        }

        protected void btnConfiReser_Click(object sender, EventArgs e)
        {
            lblCorrecto.Text = "Servicio adquirido satisfactoriamente";
            lblError.Text = "";
            btnReservar.Visible = false;
            btnCancelar.Visible = true;
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            lblError.Text = "Ya no adquieres este servicio";
            lblCorrecto.Text = "";
            btnReservar.Visible = true;
            btnCancelar.Visible = false;
        }

        protected void btnReservar2_Click(object sender, EventArgs e)
        {
            try
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "openModalDos();", true);
                return;
            }
            catch (Exception x)
            {
                lblError.Text = x.Message;
            }
        }

        protected void btnConfiReser2_Click(object sender, EventArgs e)
        {
            lblCorrecto.Text = "Servicio adquirido satisfactoriamente";
            lblError.Text = "";
            btnReservar2.Visible = false;
            btnCancelar2.Visible = true;
        }

        protected void btnCancelar2_Click(object sender, EventArgs e)
        {
            lblError.Text = "Ya no adquieres este servicio";
            lblCorrecto.Text = "";
            btnReservar2.Visible = true;
            btnCancelar2.Visible = false;
        }

        protected void btnReservar3_Click(object sender, EventArgs e)
        {
            try
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "openModalTres();", true);
                return;
            }
            catch (Exception x)
            {
                lblError.Text = x.Message;
            }
        }

        protected void btnConfiReser3_Click(object sender, EventArgs e)
        {
            lblCorrecto.Text = "Servicio adquirido satisfactoriamente";
            lblError.Text = "";
            btnReservar3.Visible = false;
            btnCancelar3.Visible = true;
        }

        protected void btnCancelar3_Click(object sender, EventArgs e)
        {
            lblError.Text = "Ya no adquieres este servicio";
            lblCorrecto.Text = "";
            btnReservar3.Visible = true;
            btnCancelar3.Visible = false;
        }
    }
}