using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace AppHoteles
{
    public partial class ConsultaEmpleado : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtConEmp.Focus();
            lblError.Text = "";
        }

        protected void btnConsulEmp_Click(object sender, EventArgs e)
        {
            HotelWS objhot = new HotelWS();
            DataSet dtEmp;

            if (String.IsNullOrEmpty(txtConEmp.Text))
            {
                dtEmp = objhot.ListarEmpleados();
                this.lblError.Text = "";
                btnDeleteEmp.Enabled = false;
            }
            else
            {
                dtEmp = objhot.BuscarEmpleados(txtConEmp.Text);
                this.lblError.Text = "";
                btnDeleteEmp.Enabled = true;
            }
            gridGenerico.DataSource = dtEmp;
            gridGenerico.DataBind();
        }

        protected void btnDeleteEmp_Click(object sender, EventArgs e)
        {
            HotelWS objhot = new HotelWS();
            DataSet dtEmp;

            try
            {
                if (!String.IsNullOrEmpty(txtConEmp.Text))
                {
                    dtEmp = objhot.EliminarEmpleado(txtConEmp.Text);
                    Response.Redirect("ConsultaEmpleado.aspx");
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
    }
}