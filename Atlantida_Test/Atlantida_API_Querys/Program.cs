using Atlantida_API_Querys.Models;
using Atlantida_API_Querys.Repository.Interfaces;
using Atlantida_API_Querys.Repository.Services;
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
builder.Services.AddDbContext<AtlantidaDB_Context>(o => o.UseSqlServer(builder.Configuration.GetConnectionString("CadenaConexion")));
builder.Services.AddAutoMapper(AppDomain.CurrentDomain.GetAssemblies());
//Inyeccion de dependecias:
builder.Services.AddScoped<ISesion, SesionServices>();
builder.Services.AddScoped<IHistoricoTransacciones, HistoricoTransaccionesServices>();
builder.Services.AddScoped<ITitularTarjeta, TitularTarjetaServices>();

//Habilitar CORS:
builder.Services.AddCors(o =>
{
    o.AddPolicy("policy", app =>
    {
        app.AllowAnyOrigin()
        .AllowAnyHeader()
        .AllowAnyMethod();

    });
});




var app = builder.Build();


// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseCors("policy");

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
