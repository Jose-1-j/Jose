using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace AppHoteles
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtUsuario.Focus();
            
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            try
            {
                string user;
                string password;
                user = txtUsuario.Text;
                password = txtClave.Text;
                ClsRN objln = new ClsRN();
                objln.Usuario = user;
                objln.Contra = password;

                if (!objln.consultar())
                {
                    lblIncorrecto.Text = "error usuario incorrecto " + objln.geterror;
                }
                SqlDataReader rstDatos; //Crear DataReader
                rstDatos = objln.GetReader;
                if (rstDatos.HasRows)
                {
                    rstDatos.Read();
                    Session["usuario"] = objln.Usuario;
                    rstDatos.Close();
                    Response.Redirect("AppWebHoteles.aspx");
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "openModal();", true);
                    
                    return;
                }
            }
            catch (Exception ex)
            {
                lblIncorrecto.Text = ex.Message;
            }
        }
    }
}