using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace AppHoteles
{
    public partial class ConsultaCliente : System.Web.UI.Page
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
            txtConCli.Focus();
            lblError.Text = "";
        }

        protected void btnConsulCli_Click(object sender, EventArgs e)
        {
            HotelWS objhot = new HotelWS();
            DataSet dtCli;

            if (String.IsNullOrEmpty(txtConCli.Text))
            {
                dtCli = objhot.ListarClientes();
                this.lblError.Text = "";
                btnDeleteCli.Enabled = false;
            }
            else
            {
                dtCli = objhot.BuscarClientes(txtConCli.Text);
                this.lblError.Text = "";
                btnDeleteCli.Enabled = true;
            }
            gridGenerico.DataSource = dtCli;
            gridGenerico.DataBind();
        }

        protected void btnHistory_Click(object sender, EventArgs e)
        {
            try
            {
                HotelWS objhis = new HotelWS();
                DataSet dtHis;
                dtHis = objhis.VerHistorial();
                this.lblError.Text = "";
                gridHistorial.DataSource = dtHis;
                gridHistorial.DataBind();
            }
            catch (Exception x)
            {
                this.lblError.Text = x.Message;
            }  
        }

        protected void btnDeleteCli_Click(object sender, EventArgs e)
        {
            HotelWS objhot = new HotelWS();
            DataSet dtCli;

            try
            {
                if (!String.IsNullOrEmpty(txtConCli.Text))
                {
                    dtCli = objhot.EliminarCliente(txtConCli.Text);
                    Response.Redirect("ConsultaCliente.aspx");
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

        protected void btnVerCli_Click(object sender, EventArgs e)
        {
            Response.Redirect("NuevoCliente.aspx");
        }
    }
}