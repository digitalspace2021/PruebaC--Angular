using Microsoft.Extensions.Configuration;
using Newtonsoft.Json.Linq;
using Prueba_Seguro.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace Prueba_Seguro.Data
{
    public class ValueRepository
    {
        private readonly string _connectionString;

        public ValueRepository(IConfiguration configuracion) {
            _connectionString = configuracion.GetConnectionString("defaultConnection");
        }

        public async Task<List<Cliente>> Getcliente(string cli)
        {           
            using (SqlConnection sql = new SqlConnection(_connectionString)) {

                using (SqlCommand cmd = new SqlCommand("ConsultaPagosCliente", sql))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@cedula", cli));
                    var response = new List<Cliente>();
                    await sql.OpenAsync();

                    using (var reader = await cmd.ExecuteReaderAsync()) {
                        while (await reader.ReadAsync()) {
                            response.Add(MapToValue(reader));
                        }
                    }
                    return response; 
                }
            }


            //throw new NotImplementedException();
        }

        private Cliente MapToValue(SqlDataReader reader)
        {
            return new Cliente
            {
                Cedula = reader["cedula"].ToString(),
                Nombre = reader["nombre_completo"].ToString(),
                Fecha = reader["fecha_pago"].ToString(),
                Monto = (Double)reader["monto"]
                
            };
        }
    }

}
