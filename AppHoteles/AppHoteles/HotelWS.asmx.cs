using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace AppHoteles
{
    /// <summary>
    /// Descripción breve de HotelWS
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    // [System.Web.Script.Services.ScriptService]
    public class HotelWS : System.Web.Services.WebService
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conexion"].ConnectionString);

        #region METODOS PUBLICOS
        //METODO PARA VER DETALLE DE FACTURACION
        [WebMethod(Description = "Ver el total de servicios facturados por clientes que consumen")]
        public DataSet VerFactura()
        {
            SqlDataAdapter da = new SqlDataAdapter("usp_factura", con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        [WebMethod(Description = "Ver historial de todos lo usuarios registrados")]
        public DataSet VerHistorial()
        {
            SqlDataAdapter da = new SqlDataAdapter("select * from historial", con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        //METODO PARA LISTAR EMPLEADOS
        [WebMethod(Description = "Lista de empleados que ofrecen servicios a sus clientes")]
        public DataSet ListarEmpleados()
        {
            SqlDataAdapter da = new SqlDataAdapter("usp_listar_empleados", con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        //METODO PARA LISTAR SERVICIOS
        [WebMethod(Description = "Lista de los servicios que ofrecemos a los clientes")]
        public DataSet ListarServicios()
        {
            SqlDataAdapter da = new SqlDataAdapter("usp_listar_servicios", con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        //METODO PARA LISTAR CLIENTES
        [WebMethod(Description = "Lista de los clientes que adquirieron nuestros servicios")]
        public DataSet ListarClientes()
        {
            SqlDataAdapter da = new SqlDataAdapter("usp_listar_clientes", con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        //METODO PARA BUSCAR EMPLEADOS POR ID
        [WebMethod(Description = "Consulta de empleados ingresando identificacion")]
        public DataSet BuscarEmpleados(string id_empleado)
        {
            if (String.IsNullOrEmpty(id_empleado))
            {
                return null;
            }
            SqlDataAdapter da = new SqlDataAdapter("usp_buscar_empleados " + id_empleado + "", con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        //METODO WEB PARA BUSCAR SERVICIOS POR CODIGO
        [WebMethod(Description = "Consulta de servicio ingresando codigo")]
        public DataSet BuscarServicios(string codigo_servicio)
        {
            if (String.IsNullOrEmpty(codigo_servicio))
            {
                return null;
            }
            SqlDataAdapter da = new SqlDataAdapter("usp_buscar_servicios " + codigo_servicio + "", con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        //METODO WEB PARA BUSCAR LOS CLIENTES SEGUN EL ID
        [WebMethod(Description = "Consulta de clientes ingresando identificacion")]
        public DataSet BuscarClientes(string id_cliente)
        {
            if (String.IsNullOrEmpty(id_cliente))
            {
                return null;
            }
            SqlDataAdapter da = new SqlDataAdapter("usp_buscar_clientes " + id_cliente + "", con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        //METODO WEB PARA ELIMINAR EMPLEADO POR ID
        [WebMethod(Description = "Eliminacion de empleados por medio de identificacion")]
        public DataSet EliminarEmpleado(string id_empleado)
        {
            if (String.IsNullOrEmpty(id_empleado))
            {
                return null;
            }
            SqlDataAdapter da = new SqlDataAdapter("usp_borrar_empleado " + id_empleado + "", con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        //METODO WEB PARA ELIMINAR SERVICIO POR CODIGO
        [WebMethod(Description = "Eliminacion de servicios por medio de identificacion")]
        public DataSet EliminarServicio(string cod_servicio)
        {
            if (String.IsNullOrEmpty(cod_servicio))
            {
                return null;
            }
            SqlDataAdapter da = new SqlDataAdapter("usp_borrar_servicio " + cod_servicio + "", con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        //METODO WEB PARA ELIMINAR CLIENTE POR ID
        [WebMethod(Description = "Eliminacion de clientes por medio de identificacion")]
        public DataSet EliminarCliente(string id_cliente)
        {
            if (String.IsNullOrEmpty(id_cliente))
            {
                return null;
            }
            SqlDataAdapter da = new SqlDataAdapter("usp_borrar_cliente " + id_cliente + "", con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        //METODO WEB PARA EL CAMBIO DE CONTRASEÑA DE USUARIO
        [WebMethod(Description = "Cambio de contraseña del usuario")]
        public DataSet CambioClave(string clave)
        {
            if (String.IsNullOrEmpty(clave))
            {
                return null;
            }
            SqlDataAdapter da = new SqlDataAdapter("usp_cambio_clave " + clave + "", con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        //METODO WEB PARA EL AUMENTO DE VALOR DEL SERVICIO
        [WebMethod(Description = "Aumento del valor del servicio")]
        public DataSet AumentoPrecio(string codigo, string costo)
        {
            if (String.IsNullOrEmpty(codigo))
            {
                return null;
            }
            SqlDataAdapter da = new SqlDataAdapter("usp_aumentar_precio_servicio " + codigo + ", " + costo + "", con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
        }
        #endregion
    }
}
