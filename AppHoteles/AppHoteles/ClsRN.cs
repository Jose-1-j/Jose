using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

namespace AppHoteles
{
    public class ClsRN
    {
        //atributos
        SqlDataReader objReader;
        string strError;
        string contra;
        string usuario;
        //propiedades
        public string Usuario
        {
            set { usuario = value; }
            get { return usuario; }
        }
        public string Contra
        {
            set { contra = value; }
            get { return contra; }
        }
        public SqlDataReader GetReader
        {
            get { return objReader; }
        }
        public string geterror
        {
            get { return strError; }
        }


        public bool consultar()
        {
            string strSQL = "EXEC usp_validar '" + usuario + "','" + contra + "'";
            ConexionBD obj_conexion = new ConexionBD();

            if (obj_conexion.Consultar(strSQL, false))
            {
                objReader = obj_conexion.Reader;
                obj_conexion = null;
                return true;
            }
            else
            {
                strError = obj_conexion.Error;
                obj_conexion = null;
                return false;
            }
        }

        public bool buscar()
        {
            string strSQL = "EXEC usp_buscar_correo '" + usuario + "'";
            ConexionBD obj_conexion = new ConexionBD();

            if (obj_conexion.Consultar(strSQL, false))
            {
                objReader = obj_conexion.Reader;
                obj_conexion = null;
                return true;
            }
            else
            {
                strError = obj_conexion.Error;
                obj_conexion = null;
                return false;
            }
        }
    }
}