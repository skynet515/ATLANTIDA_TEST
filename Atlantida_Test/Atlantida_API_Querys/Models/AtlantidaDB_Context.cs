using Microsoft.EntityFrameworkCore;

namespace Atlantida_API_Querys.Models
{
    public partial class AtlantidaDB_Context : DbContext
    {
        public AtlantidaDB_Context()
        {

        }

        public AtlantidaDB_Context(DbContextOptions<AtlantidaDB_Context> options) : base(options) { }

        public virtual DbSet<Sesion>? Sesion { get; set; } = null;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {

        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Sesion>(eb =>
            {
                eb.HasNoKey();
                eb.Property(v => v.NombreUsuario).HasColumnName("NombreUsuario");
            });

            modelBuilder.Entity<HistoricoTransacciones>(eb =>
            {
                eb.HasNoKey();
                eb.Property(v => v.Tipo).HasColumnName("Tipo");
            });

            modelBuilder.Entity<Compras>(eb =>
            {
                eb.HasNoKey();
                eb.Property(v => v.Descripcion).HasColumnName("Descripcion");
            });

            modelBuilder.Entity<TitularTarjeta>(eb =>
            {
                eb.HasNoKey();
                eb.Property(v => v.Titular).HasColumnName("Titular");
            });


            modelBuilder.Entity<Menu>(entity =>
            {
                entity.HasKey(e => e.idMenu);
                entity.Property(entity => entity.idMenu).HasColumnName("idMenu");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
