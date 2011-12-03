using System;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;


namespace Datos
{
    public class PagosObject
    {
        private SqlDataAdapter adapter = null;

        public PagosObject()
        {
            string selectCommand = "SELECT IdPago, IdDoc, Fecha,  Valor FROM Pagos WHERE IdDoc = @idDoc";
            
            string connString = ConfigurationManager.ConnectionStrings["FacturacionConnectionString"].ConnectionString;
            adapter = new SqlDataAdapter(selectCommand, connString);
            SqlParameter param = new SqlParameter("@idDoc", SqlDbType.NVarChar);
            adapter.SelectCommand.Parameters.Add(param);
        }

        public TestDs.PagosDataTable getDocumentos(String id)
        {
            TestDs.PagosDataTable dt = new TestDs.PagosDataTable();
            if (id != "-1")
            {         
                //Solo se va a la base de datos si el id es diferente de -1
                adapter.SelectCommand.Parameters[0].Value = ((string)(id));
                adapter.Fill(dt);
             
            }
            return dt;
        }
        
        
    }
}
