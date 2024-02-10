using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;

namespace Atlantida_API_Querys.Models.Commands
{
    public class Commands
    {
        private readonly AtlantidaDB_Context _dbContext;

        public Commands(AtlantidaDB_Context dbContext)
        {
            _dbContext = dbContext;
        }

        public int ExecuteSqlCommand(string sql, params SqlParameter[] parameters)
        {
            return _dbContext.Database.ExecuteSqlRaw(sql, parameters);
        }

        public IEnumerable<T> ExecuteSqlCommand<T>(string sql, params SqlParameter[] parameters) where T : class
        {
            return _dbContext.Set<T>().FromSqlRaw(sql, parameters).AsEnumerable();
        }

        public List<T> ExecuteSqlCommandList<T>(string sql, params SqlParameter[] parameters) where T : class
        {
            return _dbContext.Set<T>().FromSqlRaw(sql, parameters).ToList();
        }
    }
}
