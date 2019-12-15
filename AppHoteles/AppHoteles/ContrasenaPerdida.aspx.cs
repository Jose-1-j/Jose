using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading.Tasks;
using System.Configuration;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Net;
using System.Data;

namespace AppHoteles
{
    public partial class ContrasenaPerdida : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtFindEmail.Focus();
            lblError.Text = "";

            if (!IsPostBack)
            {
                //if (txtFindEmail.Text != "")
                //{
                //    btnRecuperacion.Enabled = true;
                //}
                //else if (txtFindEmail.Text == "")
                //{
                //    btnRecuperacion.Enabled = false;
                //}
            }
        }

        protected void btnRecuperacion_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conexion"].ConnectionString);
            SqlCommand cmd = new SqlCommand("usp_buscar_correo", con);

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@usuario", txtFindEmail.Text);
            try
            {
                con.Open();
                SqlDataReader lector = cmd.ExecuteReader();
                if (lector.Read())
                {
                    GenerarNueva(txtFindEmail.Text);
                }
                else
                {
                    this.lblError.Text = "Correo electronico no encontrado";
                }
            }
            catch (Exception ex)
            {
                this.lblError.Text = ex.Message;
            }
        }

        public void GenerarNueva(string email)
        {
            //Random rd = new Random(DateTime.Now.Millisecond);
            ClsRN objrn = new ClsRN();
            Random rd = new Random(DateTime.Now.Millisecond);
            int nuevaContrasena = rd.Next(1000,9999);
            objrn.Contra = Convert.ToString(nuevaContrasena);
            objrn.Usuario = email;

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conexion"].ConnectionString);
            SqlCommand cmd = new SqlCommand("usp_cambio_clave", con);

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@usuario", email);
            cmd.Parameters.AddWithValue("@contrasena", nuevaContrasena);
            try
            {
                con.Open();
                int filasAfectadas = cmd.ExecuteNonQuery();
                if (filasAfectadas != 0)
                {
                    EnviarCorreo(nuevaContrasena, email);
                }
            }
            catch (Exception x)
            {
                this.lblError.Text = x.Message;
            }
        }

        private void EnviarCorreo(int contrasenaNueva, string correo)
        {
            ClsRN objrn = new ClsRN();
            string destinatario = correo;
            Session["usuario"] = objrn.Usuario;
            objrn.Usuario = destinatario;
            string reminente = "josemanuel15.jqjq@gmail.com";
            string asunto = "Recuperación de contraseña";
            string cuerpoDelMesaje = "Su nueva contraseña es: " + contrasenaNueva;
            MailMessage ms = new MailMessage(reminente, destinatario, asunto, cuerpoDelMesaje);

            SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
            smtp.EnableSsl = true;
            smtp.Credentials = new NetworkCredential("josemanuel15.jqjq@gmail.com", "jose97973");

            try
            {
                Task.Run(() =>
                {
                    smtp.Send(ms);
                    ms.Dispose();
                });
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "openModal();", true);
                //this.lblExito.Text = "Revisa tu bandeja de entrada para ver la contraseña";
                this.lblError.Text = "";
            }
            catch (Exception ex)
            {
                this.lblError.Text = ex.Message;
            }
        }
    }
}