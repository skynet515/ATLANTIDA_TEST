using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.SqlServer;

namespace Atlantida_API_CMD.Models.Commands
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

    }
}
