using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AppHoteles
{
    public partial class NuevoServicio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PrimeraLista();
                txtDES.Focus();
            }
        }

        private void PrimeraLista()
        {
            llenarComboEmpleado();
        }

        //metodo para llenar combo empleado
        private void llenarComboEmpleado()
        {
            this.lblError.Text = "";
            LogicaHotel objemp = new LogicaHotel();
            if (!objemp.ComboEmpleados(ddlEmpleado))
            {
                this.lblError.Text = objemp.Error;
                return;
            }
        }

        protected void btnSaveSer_Click(object sender, EventArgs e)
        {
            try
            {
                int id_emp = Convert.ToInt32(ddlEmpleado.SelectedValue);
                string descripcion = this.txtDES.Text;
                string disponibilidad = this.txtDIS.Text.Trim();
                double costo = Convert.ToDouble(this.txtVAL.Text);

                if (costo <= 0)
                {
                    this.lblError.Text = "Se necesita un valor para el servicio";
                    this.txtVAL.Focus();
                    return;
                }
                if (descripcion == "")
                {
                    this.lblError.Text = "No hay descripcion tiene el servicio";
                    this.txtDES.Focus();
                    return;
                }
                if (disponibilidad == "")
                {
                    this.lblError.Text = "Se necesita saber si esta disponible o no";
                    this.txtDIS.Focus();
                    return;
                }
                LogicaHotel objSaveSer = new LogicaHotel();
                objSaveSer.Descripcion = descripcion;
                objSaveSer.Costo = costo;
                objSaveSer.Disponibilidad = disponibilidad;
                if (!objSaveSer.GuardarServicio(id_emp))
                {
                    this.lblError.Text = objSaveSer.Error;
                    this.txtDES.Focus();
                    return;
                }
                Response.Redirect("ConsultaServicio.aspx");
            }
            catch (Exception x)
            {
                this.lblError.Text = x.Message;
                return;
            }
        }
    }
}