using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AppHoteles
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["usuario"].ToString() != "")
                {
                    lblNombre.Text = Session["usuario"].ToString();
                    LinkAbout.Enabled = true;
                    LinkContacts.Enabled = true;
                    LinkLogout.Enabled = true;
                    LinkAbout.Visible = true;
                    LinkContacts.Visible = true;
                    LinkLogout.Visible = true;
                }
            }
            catch (Exception)
            {
                
            }  
        }

        protected void LinkLogout_Click(object sender, EventArgs e)
        {
            Session["usuario"] = "";
            Response.Redirect("Login.aspx");
        }

        protected void LinkAbout_Click(object sender, EventArgs e)
        {
            Response.Redirect("About.aspx");
        }

        protected void LinkContacts_Click(object sender, EventArgs e)
        {
            Response.Redirect("Contact.aspx");
        }

        protected void btnContactenos_Click(object sender, EventArgs e)
        {
            Response.Redirect("Contact.aspx");
        }
    }
}