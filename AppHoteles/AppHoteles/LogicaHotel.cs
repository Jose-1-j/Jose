using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using LibConexionBD;
using LibLlenarGrids;
using LibLlenarCombos;
using System.Configuration;

namespace AppHoteles
{
    public class LogicaHotel
    {
        #region "Atributos"
        //atributos del empleado y cliente
        string nombre;
        //atributos del empleado
        string telefono;
        double salario;
        //atributos del cliente
        string identifacion;
        string apellido;
        string fechaLlegada;
        string fechaSalida;
        string telCliente;
        double dinero;
        //atributos de los servicios
        int codServicio;
        double costo;
        string descripcion;
        string disponibilidad;
        //atributos de facturacion
        string fecha;
        double subtotal;
        double iva;
        double total;
        //atributos de ayuda
        int respuesta;
        string error;
        string sql;
        ClsLLenarGrids objGrid;
        ClsLlenarCombos objCombos;
        #endregion

        #region "Propiedades"
        public int Respuesta
        {
            get { return respuesta; }
        }
        public string Error
        {
            get { return error; }
            set { error = value; }
        }
        public string Nombre
        {
            set { nombre = value; }
        }
        public string Apellido
        {
            set { apellido = value; }
        }
        public string Identificacion
        {
            set { identifacion = value; }
        }
        public string Telefono
        {
            set { telefono = value; }
        }
        public double Salario
        {
            set { salario = value; }
        }
        public string TelCliente
        {
            set { telCliente = value; }
        }
        public double Dinero
        {
            set { dinero = value; }
        }
        public int CodServicio
        {
            set { codServicio = value; }
        }
        public double Costo
        {
            set { costo = value; }
        }
        public string Descripcion
        {
            set { descripcion = value; }
        }
        public string Disponibilidad
        {
            set { disponibilidad = value; }
        }
        public string Fecha
        {
            set { fecha = value; }
        }
        public string FechaLlegada
        {
            set { fechaLlegada = value; }
        }
        public string FechaSalida
        {
            set { fechaSalida = value; }
        }
        public double Subtotal
        {
            set { subtotal = value; }
        }
        public double Iva
        {
            set { iva = value; }
        }
        public double Total
        {
            set { total = value; }
            get { return total; }
        }
        #endregion

        #region "metodos publicos"
        //metodo para ver tabla de factura
        public bool VerFactura(GridView GrwFac)
        {
            objGrid = new ClsLLenarGrids();
            objGrid.NombreTabla = "factura";
            objGrid.SQL = "execute usp_factura";
            if (!objGrid.LlenarGridWeb(GrwFac))
            {
                error = objGrid.ERROR;
                return false;
            }
            else return true;
        }

        //metodo para seleccionar los empleados
        public bool ComboEmpleados(DropDownList DDLEmpleado)
        {
            objCombos = new ClsLlenarCombos();
            objCombos.NombreTabla = "empleado";
            objCombos.ColumnaValor = "id_empleado";
            objCombos.ColumnaTexto = "nombre";
            objCombos.SQL = "execute usp_select_empleados";
            if (!objCombos.LlenarComboWeb(DDLEmpleado))
            {
                error = objCombos.Error;
                return false;
            }
            else return true;
        }

        
        public bool ComboSolo(DropDownList DDLSolo)
        {
            try
            {
                objCombos = new ClsLlenarCombos();
                objCombos.NombreTabla = "cliente";
                objCombos.ColumnaValor = "id_cliente";
                objCombos.ColumnaTexto = "nombre_cliente";
                objCombos.SQL = "execute usp_select_solo";
                if (!objCombos.LlenarComboWeb(DDLSolo))
                {
                    error = objCombos.Error;
                    return false;
                }
                else return true;
            }
            catch (Exception)
            {
                error = objCombos.Error;
            }
            return false;
        }

        //metodo para seleccionar los servicios
        public bool ComboServicios(DropDownList DDLServicio, int id_emp)
        {
            objCombos = new ClsLlenarCombos();
            objCombos.NombreTabla = "servicio";
            objCombos.ColumnaValor = "cod_servicio";
            objCombos.ColumnaTexto = "descripcion";
            objCombos.SQL = "execute usp_select_servicio " + Convert.ToString(id_emp) + "";
            if (!objCombos.LlenarComboWeb(DDLServicio))
            {
                error = objCombos.Error;
                return false;
            }
            else return true;
        }

        //metodo para seleccionar los clientes
        public bool ComboClientes(DropDownList DDLclientes, int cod_ser)
        {
            objCombos = new ClsLlenarCombos();
            objCombos.NombreTabla = "cliente";
            objCombos.ColumnaValor = "id_cliente";
            objCombos.ColumnaTexto = "nombre_cliente";
            objCombos.SQL = "execute usp_select_clientes " + Convert.ToString(cod_ser) + "";
            if (!objCombos.LlenarComboWeb(DDLclientes))
            {
                error = objCombos.Error;
                return false;
            }
            else return true;
        }

        //metodo para guardar un empleado
        public bool GuardarEmpleado()
        {
            ClsConexion objCnn = new ClsConexion();
            int int_id_emp = 0;
            objCnn.AgregarParametro(ParameterDirection.Input, "@nombre",
           SqlDbType.VarChar, 30, nombre);
            objCnn.AgregarParametro(ParameterDirection.Input, "@telefono",
           SqlDbType.VarChar, 30, telefono);
            objCnn.AgregarParametro(ParameterDirection.Input, "@salario",
           SqlDbType.Decimal, 10, salario);
            objCnn.AgregarParametro(ParameterDirection.InputOutput,
           "@int_id_empleado", SqlDbType.Int, 1, int_id_emp);
            sql = "usp_insertar_empleado";
            if (!objCnn.Consultar(sql, true))
            {
                error = objCnn.Error;
                return false;
            }
            else
            {
                SqlDataReader MyReader = objCnn.Reader;
                if (MyReader.HasRows)
                {
                    MyReader.Read();
                    respuesta = MyReader.GetInt32(0);
                    MyReader.Close();
                    if (respuesta == 0)
                    {
                        error = "No se puede insertar el empleado";
                        return false;
                    }
                    else if (respuesta == -1)
                    {
                        error = "Ya existe el empleado: " + nombre;
                        return false;
                    }
                    else return true;
                }
                else return false;
            }
        }

        //metodo para guardar un servicio
        public bool GuardarServicio(int id_empleado)
        {
            int int_cod_servicio = 0;
            ClsConexion objCnn = new ClsConexion();
            objCnn.AgregarParametro(ParameterDirection.Input, "@costo",
           SqlDbType.Decimal, 10, costo);
            objCnn.AgregarParametro(ParameterDirection.Input, "@descripcion",
           SqlDbType.VarChar, 90, descripcion);
            objCnn.AgregarParametro(ParameterDirection.Input, "@disponibilidad",
           SqlDbType.VarChar, 30, disponibilidad);
            objCnn.AgregarParametro(ParameterDirection.Input, "@id_empleado",
           SqlDbType.Int, 1, id_empleado);
            objCnn.AgregarParametro(ParameterDirection.InputOutput,
           "@int_cod_servicio", SqlDbType.Int, 1, int_cod_servicio);
            sql = "usp_insertar_servicio";
            //Terminar de Implementar
            if (!objCnn.Consultar(sql, true))
            {
                error = objCnn.Error;
                return false;
            }
            else
            {
                SqlDataReader MyReader = objCnn.Reader;
                if (MyReader.HasRows)
                {
                    MyReader.Read();
                    respuesta = MyReader.GetInt32(0);
                    MyReader.Close();
                    if (respuesta == 0)
                    {
                        error = "La descripcion no es valida";
                        return false;
                    }
                    else if (respuesta == -1)
                    {
                        error = "La descripcion no se puede repetir";
                        return false;
                    }
                    else return true;
                }
                else return false;
            }
        }

        //metodo para guardar un cliente
        public bool GuardarCliente(int codServicio)
        {
            int int_id_cli = 0;
            ClsConexion objCnn = new ClsConexion();
            objCnn.AgregarParametro(ParameterDirection.Input, "@identificacion",
           SqlDbType.VarChar, 30, identifacion);
            objCnn.AgregarParametro(ParameterDirection.Input, "@nombre_cliente",
           SqlDbType.VarChar, 30, nombre);
            objCnn.AgregarParametro(ParameterDirection.Input, "@apellido_cliente",
           SqlDbType.VarChar, 30, apellido);
            objCnn.AgregarParametro(ParameterDirection.Input, "@telefono_cliente",
           SqlDbType.VarChar, 30, telCliente);
            objCnn.AgregarParametro(ParameterDirection.Input, "@dinero",
           SqlDbType.Decimal, 10, dinero);
            objCnn.AgregarParametro(ParameterDirection.Input, "@fecha_llegada",
           SqlDbType.Date, 30, fechaLlegada);
            objCnn.AgregarParametro(ParameterDirection.Input, "@fecha_salida",
           SqlDbType.Date, 30, fechaSalida);
            objCnn.AgregarParametro(ParameterDirection.Input, "@cod_servicio",
           SqlDbType.Int, 1, codServicio);
            objCnn.AgregarParametro(ParameterDirection.InputOutput,
           "@int_id_cliente", SqlDbType.Int, 1, int_id_cli);
            sql = "usp_insertar_cliente";
            //Terminar de Implementar
            if (!objCnn.Consultar(sql, true))
            {
                error = objCnn.Error;
                return false;
            }
            else
            {
                SqlDataReader MyReader = objCnn.Reader;
                if (MyReader.HasRows)
                {
                    MyReader.Read();
                    respuesta = MyReader.GetInt32(0);
                    MyReader.Close();
                    if (respuesta == 0)
                    {
                        error = "No se puede insertar el cliente";
                        return false;
                    }
                    else if (respuesta == -1)
                    {
                        error = "Ya existe el cliente: " + nombre;
                        return false;
                    }
                    else return true;
                }
                else return false;
            }
        }

        //metodo para generar una nueva factura
        public bool GenerarFactura(int id_empleado, int cod_servicio, int id_cliente)
        {
            int int_id_factura = 0;
            ClsConexion objCnn = new ClsConexion();
            objCnn.AgregarParametro(ParameterDirection.Input, "@id_empleado",
           SqlDbType.VarChar, 30, id_empleado);
            objCnn.AgregarParametro(ParameterDirection.Input, "@cod_servicio",
           SqlDbType.Int, 10, cod_servicio);
            objCnn.AgregarParametro(ParameterDirection.Input, "@id_cliente",
           SqlDbType.VarChar, 30, id_cliente);
            objCnn.AgregarParametro(ParameterDirection.Input, "@fecha",
           SqlDbType.Date, 30, fecha);
            objCnn.AgregarParametro(ParameterDirection.Input, "@subtotal",
           SqlDbType.Decimal, 10, subtotal);
            objCnn.AgregarParametro(ParameterDirection.Input, "@iva",
           SqlDbType.Decimal, 10, iva);
            objCnn.AgregarParametro(ParameterDirection.Input, "@total_a_pagar",
           SqlDbType.Decimal, 10, total);
            objCnn.AgregarParametro(ParameterDirection.InputOutput,
           "@int_id_factura", SqlDbType.Int, 1, int_id_factura);
            sql = "usp_generar_factura";

            if (!objCnn.Consultar(sql, true))
            {
                error = objCnn.Error;
                return false;
            }
            else
            {
                SqlDataReader MyReader = objCnn.Reader;
                if (MyReader.HasRows)
                {
                    MyReader.Read();
                    respuesta = MyReader.GetInt32(0);
                    MyReader.Close();
                    if (respuesta == 0)
                    {
                        error = "No se pudo generar la factura";
                        return false;
                    }
                    else if (respuesta == -1)
                    {
                        error = "La factura con el codigo especificado ya existe";
                        return false;
                    }
                    else return true;
                }
                else return false;
            }
        }

        //metodo para calcular el total a pagar
        public bool Calcular()
        {
            try
            {
                total = subtotal * iva;
                return true;
            }
            catch (Exception e)
            {
                error = e.Message;
                return false;
            }
        }
        #endregion
    }
}