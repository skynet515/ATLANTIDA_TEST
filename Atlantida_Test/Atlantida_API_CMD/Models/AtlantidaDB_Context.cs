using Microsoft.EntityFrameworkCore;

namespace Atlantida_API_CMD.Models
{
    public class AtlantidaDB_Context : DbContext
    {
        public AtlantidaDB_Context()
        {

        }

        public AtlantidaDB_Context(DbContextOptions<AtlantidaDB_Context> options) : base(options) { }


    }
}
