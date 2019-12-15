using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AppHoteles
{
    public partial class Facturacion : System.Web.UI.Page
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
                llenarDatos();
                PrimeraLista();
                txtIva.Text = "1,19";
            }
        }

        //metodo para llenar tabla factura al cargar la pagina
        private void llenarDatos()
        {
            llenarGridFactura();
        }

        //metodo para llenar combo empleado al cargar la pagina
        private void PrimeraLista()
        {
            llenarComboEmpleado();
        }

        //metodo para llenar tabla factura
        private void llenarGridFactura()
        {
            LogicaHotel objfac = new LogicaHotel();
            if (!objfac.VerFactura(gridFactura))
            {
                this.lblError.Text = objfac.Error;
                return;
            }
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

        //metodo para llenar combo cliente
        private void llenarComboCliente(int cod_ser)
        {
            this.lblError.Text = "";
            LogicaHotel objcli = new LogicaHotel();
            if (!objcli.ComboClientes(ddlCliente, cod_ser))
            {
                this.lblError.Text = objcli.Error;
                return;
            }
        }

        //evento de la lista desplegable de los empleados
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

        //evento de la lista desplegable de los servicios
        protected void ddlServicio_SelectedIndexChanged(object sender, EventArgs e)
        {
            int codSer = Convert.ToInt32(ddlServicio.SelectedValue);

            if (codSer == 0)
            {
                this.ddlCliente.Items.Clear();
            }
            else if (codSer > 0)
            {
                llenarComboCliente(codSer);
                return;
            }
        }

        //evento de la lista desplegable de los clientes
        protected void ddlCliente_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnCalcular_Click(object sender, EventArgs e)
        {
            double sub, iva;
            try
            {
                sub = Convert.ToDouble(txtSub.Text);
                iva = Convert.ToDouble(txtIva.Text);
                LogicaHotel obje = new LogicaHotel();
                obje.Subtotal = sub;
                obje.Iva = iva;
                if (!obje.Calcular())
                {
                    lblError.Text = obje.Error;
                    return;
                }
                txtTotal.Text = obje.Total.ToString();
                btnGenerar.Enabled = true;
            }
            catch (Exception x)
            {
                lblError.Text = x.Message;
            }
        }

        protected void btnGenerar_Click(object sender, EventArgs e)
        {
            try
            {
                int idemp = Convert.ToInt32(ddlEmpleado.SelectedValue);
                int codser = Convert.ToInt32(ddlServicio.SelectedValue);
                int idcli = Convert.ToInt32(ddlCliente.SelectedValue);
                string fecha = this.txtFecha.Text;
                double subtotal = Convert.ToDouble(this.txtSub.Text);
                double iva = Convert.ToDouble(this.txtIva.Text);
                double total = Convert.ToDouble(this.txtTotal.Text);

                if (String.IsNullOrEmpty(fecha))
                {
                    this.lblError.Text = "No se ingreso fecha de realizacion de factura";
                    return;
                }
                if (subtotal == 0)
                {
                    this.lblError.Text = "No hay valor subtotal";
                    this.txtSub.Focus();
                    return;
                }
                if (iva == 0)
                {
                    this.lblError.Text = "No se ingreso el impuesto del iva";
                    this.txtIva.Focus();
                    return;
                }
                if (total == 0)
                {
                    this.lblError.Text = "No se ingreso el salario del empleado";
                    this.txtTotal.Focus();
                    return;
                }
                LogicaHotel objGen = new LogicaHotel();
                objGen.Fecha = fecha;
                objGen.Subtotal = subtotal;
                objGen.Iva = iva;
                objGen.Total = total;
                if (!objGen.GenerarFactura(idemp, codser, idcli))
                {
                    lblError.Text = objGen.Error;
                    this.txtSub.Focus();
                    return;
                }
                llenarDatos();
                this.lblError.Text = "";
            }
            catch (Exception x)
            {
                this.lblError.Text = x.Message;
                return;
            }
        }
    }
}