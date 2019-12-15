using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AppHoteles
{
    public partial class NuevoEmpleado : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtNOMEMP.Focus();
        }

        protected void btnSaveEmp_Click(object sender, EventArgs e)
        {
            try
            {
                string nombre = this.txtNOMEMP.Text.Trim();
                string telefono = this.txtTELEMP.Text.Trim();
                double salario = Convert.ToDouble(this.txtSALEMP.Text);

                if (nombre == "")
                {
                    this.lblError.Text = "No se ingreso el nombre del empleado";
                    this.txtNOMEMP.Focus();
                    return;
                }
                if (telefono == "")
                {
                    this.lblError.Text = "No se ingreso el telefono del empleado";
                    this.txtTELEMP.Focus();
                    return;
                }
                if (salario <= 0)
                {
                    this.lblError.Text = "No se ingreso el salario del empleado";
                    this.txtSALEMP.Focus();
                    return;
                }
                LogicaHotel objSaveEmp = new LogicaHotel();
                objSaveEmp.Nombre = nombre;
                objSaveEmp.Telefono = telefono;
                objSaveEmp.Salario = salario;
                if (!objSaveEmp.GuardarEmpleado())
                {
                    this.lblError.Text = objSaveEmp.Error;
                    this.txtNOMEMP.Focus();
                    return;
                }
                Response.Redirect("ConsultaEmpleado.aspx");
            }
            catch (Exception x)
            {
                this.lblError.Text = x.Message;
                return;
            }
        }
    }
}