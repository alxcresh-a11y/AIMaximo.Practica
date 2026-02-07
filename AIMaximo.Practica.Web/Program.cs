using AIMaximo.Practica.Web.Data;
using AIMaximo.Practica.Web.Service;


var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddControllersWithViews();

// Registro de dependencias
builder.Services.AddScoped<DbHelper>();
builder.Services.AddScoped<ProductService>();
builder.Services.AddScoped<ProductoProveedorService>();
builder.Services.AddScoped<ProveedorService>();
builder.Services.AddScoped<ProductoProveedorService>();


var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
}

app.UseStaticFiles();

app.UseRouting();

app.UseAuthorization();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Producto}/{action=Index}/{id?}");

app.Run();

