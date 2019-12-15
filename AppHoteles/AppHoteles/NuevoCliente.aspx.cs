using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AppHoteles
{
    public partial class NuevoCliente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PrimeraLista();
                txtIDCLI.Focus();
            }
        }

        //metodo para llenar combo empleado al cargar la pagina
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

        //metodo para llenar combo servicios
        private void llenarComboServicios(int id_emp)
        {
            this.lblError.Text = "";
            LogicaHotel objser = new LogicaHotel();
            if (!objser.ComboServicios(ddlServicio, id_emp))
            {
                this.lblError.Text = objser.Error;
                return;
            }
        }

        protected void btnSaveCli_Click(object sender, EventArgs e)
        {
            try
            {
                int cod_ser = Convert.ToInt32(ddlServicio.SelectedValue);
                string identi = this.txtIDCLI.Text.Trim();
                string nomcli = this.txtNOMCLI.Text.Trim();
                string apecli = this.txtAPECLI.Text.Trim();
                string telcli = this.txtTELCLI.Text.Trim();
                double dinero = Convert.ToDouble(txtDinero.Text.Trim());
                string fecha_llegada = this.txtFechaLlegada.Text;
                string fecha_salida = this.txtFechaSalida.Text;

                if (identi == "")
                {
                    this.lblError.Text = "No se ingreso la identificacion";
                    this.txtIDCLI.Focus();
                    return;
                }
                if (nomcli == "")
                {
                    this.lblError.Text = "No se ingreso el nombre del cliente";
                    this.txtNOMCLI.Focus();
                    return;
                }
                if (apecli == "")
                {
                    this.lblError.Text = "No se ingreso el apellido del cliente";
                    this.txtAPECLI.Focus();
                    return;
                }
                if (telcli == "")
                {
                    this.lblError.Text = "No se ingreso telefono del cliente";
                    this.txtTELCLI.Focus();
                    return;
                }
                if (dinero == 0)
                {
                    this.lblError.Text = "El cliente no tiene dinero para pagar";
                    this.txtDinero.Focus();
                    return;
                }
                if (String.IsNullOrEmpty(fecha_llegada))
                {
                    this.lblError.Text = "Falta poner la fecha de llegada";
                    return;
                }
                if (String.IsNullOrEmpty(fecha_salida))
                {
                    this.lblError.Text = "Falta poner la fecha de salida";
                    return;
                }
                LogicaHotel objSaveCli = new LogicaHotel();
                objSaveCli.Identificacion = identi;
                objSaveCli.Nombre = nomcli;
                objSaveCli.Apellido = apecli;
                objSaveCli.Dinero = dinero;
                objSaveCli.FechaLlegada = fecha_llegada;
                objSaveCli.FechaSalida = fecha_salida;
                objSaveCli.TelCliente = telcli;
                if (!objSaveCli.GuardarCliente(cod_ser))
                {
                    this.lblError.Text = objSaveCli.Error;
                    this.txtIDCLI.Focus();
                    return;
                }
                Response.Redirect("ConsultaCliente.aspx");
            }
            catch (Exception x)
            {
                this.lblError.Text = x.Message;
                return;
            }
        }

        protected void ddlEmpleado_SelectedIndexChanged(object sender, EventArgs e)
        {
            int idEmp = Convert.ToInt32(ddlEmpleado.SelectedValue);

            if (idEmp == 0)
            {
                this.ddlServicio.Items.Clear();
            }
            else if (idEmp > 0)
            {
                llenarComboServicios(idEmp);
                return;
            }
        }

        protected void ddlServicio_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}