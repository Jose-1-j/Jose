using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Collections;

namespace AppHoteles
{
    public partial class AppWebHoteles : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["usuario"].ToString() == "")
                {
                    Response.Redirect("Login.aspx");
                }
                /*else
                {
                    lblNombre.Text = Session["usuario"].ToString();
                }*/
            }
            catch (Exception x)
            {
                this.lblError.Text = x.Message;
            }

            if (!IsPostBack)
            {
                PrimeraLista();
            }

            ArrayList Lista = new ArrayList();
            string[] archivos = System.IO.Directory.GetFiles(Server.MapPath("~/images"), "*.*");

            foreach (string archivo in archivos)
            {
                Lista.Add("/images/" + System.IO.Path.GetFileName(archivo));
            }
            Repeater1.DataSource = Lista;
            Repeater1.DataBind();
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
    }
}