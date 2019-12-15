using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace AppPersona
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        public void soloNumeros(KeyPressEventArgs e)
        {
            try
            {
                if (Char.IsNumber(e.KeyChar))
                {
                    e.Handled = false;
                }
                else if (Char.IsControl(e.KeyChar))
                {
                    e.Handled = false;
                }
                else
                {
                    e.Handled = true;
                }
            }
            catch (Exception x)
            {
                MessageBox.Show(x.Message);
            }
        }

        public void soloLetras(KeyPressEventArgs e)
        {
            try
            {
                if (Char.IsLetter(e.KeyChar))
                {
                    e.Handled = false;
                }
                else if (Char.IsControl(e.KeyChar))
                {
                    e.Handled = false;
                }
                else if (Char.IsSeparator(e.KeyChar))
                {
                    e.Handled = false;
                }
                else
                {
                    e.Handled = true;
                }
            }
            catch (Exception x)
            {
                MessageBox.Show(x.Message);
            }
        }

        private void txtId_KeyPress(object sender, KeyPressEventArgs e)
        {
            soloNumeros(e);
        }

        private void txtNombre_KeyPress(object sender, KeyPressEventArgs e)
        {
            soloLetras(e);
        }

        private void txtApellido_KeyPress(object sender, KeyPressEventArgs e)
        {
            soloLetras(e);
        }

        private void txtEdad_KeyPress(object sender, KeyPressEventArgs e)
        {
            soloNumeros(e);
        }

        private void btnBoton_Click(object sender, EventArgs e)
        {
            var indetificacion = txtId.Text;
            var nombre = txtNombre.Text;
            var apellido = txtApellido.Text;
            var edad = txtEdad.Text;

            using (ServiceReference.PersonaWSClient client = new ServiceReference.PersonaWSClient())
            {
                var persona = client.GetPersona(indetificacion, nombre, apellido, edad);
                lblid.Text = persona.cedula;
                lblNombre.Text = persona.nombre;
                lblApellido.Text = persona.apellido;
                lblEdad.Text = persona.edad;
            }
        }
    }
}