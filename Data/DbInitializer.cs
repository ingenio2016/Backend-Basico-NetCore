using AngularASPNETCore2WebApiAuth.Data;
using AngularASPNETCore2WebApiAuth.Models;
using AngularASPNETCore2WebApiAuth.Models.Entities;
using AngularASPNETCore2WebApiAuth.ViewModels;
using AutoMapper;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using System;
using System.Linq;

namespace AngularASPNETCore2WebApiAuth.Data
{
  public static class DbInitializer
  {
    public static void Initialize(ApplicationDbContext context, IMapper mapper, UserManager<AppUser> userManager)
    {
      context.Database.EnsureCreated();

      if (!context.Genres.Any())
      {
        context.Genres.Add(new Genre { Name = "Masculino" });
        context.Genres.Add(new Genre { Name = "Femenino" });
        context.Genres.Add(new Genre { Name = "Sin especificar" });
        context.SaveChanges();
      }

      if (!context.Countries.Any())
      {
        context.Countries.Add(new Country { Name = "Colombia" });
        context.SaveChanges();
      }

      if (!context.Departments.Any())
      {
        context.Departments.Add(new Department { Name = "Amazonas", CountryId = 1 });
        context.Departments.Add(new Department { Name = "Antioquia", CountryId = 1 });
        context.Departments.Add(new Department { Name = "Arauca", CountryId = 1 });
        context.Departments.Add(new Department { Name = "Atlántico", CountryId = 1 });
        context.Departments.Add(new Department { Name = "Bolívar", CountryId = 1 });
        context.Departments.Add(new Department { Name = "Boyacá", CountryId = 1 });
        context.Departments.Add(new Department { Name = "Caldas", CountryId = 1 });
        context.Departments.Add(new Department { Name = "Caquetá", CountryId = 1 });
        context.Departments.Add(new Department { Name = "Casanare", CountryId = 1 });
        context.Departments.Add(new Department { Name = "Cauca", CountryId = 1 });
        context.Departments.Add(new Department { Name = "Cesar", CountryId = 1 });
        context.Departments.Add(new Department { Name = "Chocó", CountryId = 1 });
        context.Departments.Add(new Department { Name = "Córdoba", CountryId = 1 });
        context.Departments.Add(new Department { Name = "Cundinamarca", CountryId = 1 });
        context.Departments.Add(new Department { Name = "Güainia", CountryId = 1 });
        context.Departments.Add(new Department { Name = "Guaviare", CountryId = 1 });
        context.Departments.Add(new Department { Name = "Huila", CountryId = 1 });
        context.Departments.Add(new Department { Name = "La Guajira", CountryId = 1 });
        context.Departments.Add(new Department { Name = "Magdalena", CountryId = 1 });
        context.Departments.Add(new Department { Name = "Meta", CountryId = 1 });
        context.Departments.Add(new Department { Name = "Nariño", CountryId = 1 });
        context.Departments.Add(new Department { Name = "Norte de Santander", CountryId = 1 });
        context.Departments.Add(new Department { Name = "Putumayo", CountryId = 1 });
        context.Departments.Add(new Department { Name = "Quindio", CountryId = 1 });
        context.Departments.Add(new Department { Name = "Risaralda", CountryId = 1 });
        context.Departments.Add(new Department { Name = "San Andrés y Providencia", CountryId = 1 });
        context.Departments.Add(new Department { Name = "Santander", CountryId = 1 });
        context.Departments.Add(new Department { Name = "Sucre", CountryId = 1 });
        context.Departments.Add(new Department { Name = "Tolima", CountryId = 1 });
        context.Departments.Add(new Department { Name = "Valle del Cauca", CountryId = 1 });
        context.Departments.Add(new Department { Name = "Vaupés", CountryId = 1 });
        context.Departments.Add(new Department { Name = "Vichada", CountryId = 1 });
        context.SaveChanges();
      }

      if (!context.Cities.Any())
      {
        context.Cities.Add(new City { Name = "Ábrego", CountryId = 1, DepartmentId = 10 });
        context.Cities.Add(new City { Name = "Arboledas", CountryId = 1, DepartmentId = 10 });
        context.Cities.Add(new City { Name = "Bochalema", CountryId = 1, DepartmentId = 10 });
        context.Cities.Add(new City { Name = "Bucarasica", CountryId = 1, DepartmentId = 10 });
        context.Cities.Add(new City { Name = "Cáchira", CountryId = 1, DepartmentId = 10 });
        context.Cities.Add(new City { Name = "Cácota", CountryId = 1, DepartmentId = 10 });
        context.Cities.Add(new City { Name = "Chinácota", CountryId = 1, DepartmentId = 10 });
        context.Cities.Add(new City { Name = "Chitagá", CountryId = 1, DepartmentId = 10 });
        context.Cities.Add(new City { Name = "Convención", CountryId = 1, DepartmentId = 10 });
        context.Cities.Add(new City { Name = "Cúcuta", CountryId = 1, DepartmentId = 10 });
        context.Cities.Add(new City { Name = "Cucutilla", CountryId = 1, DepartmentId = 10 });
        context.Cities.Add(new City { Name = "Durania", CountryId = 1, DepartmentId = 10 });
        context.Cities.Add(new City { Name = "El Carmen", CountryId = 1, DepartmentId = 10 });
        context.Cities.Add(new City { Name = "El Tarra", CountryId = 1, DepartmentId = 10 });
        context.Cities.Add(new City { Name = "El Zulia", CountryId = 1, DepartmentId = 10 });
        context.Cities.Add(new City { Name = "Gramalote", CountryId = 1, DepartmentId = 10 });
        context.Cities.Add(new City { Name = "Hacarí", CountryId = 1, DepartmentId = 10 });
        context.Cities.Add(new City { Name = "Herrán", CountryId = 1, DepartmentId = 10 });
        context.Cities.Add(new City { Name = "La Esperanza", CountryId = 1, DepartmentId = 10 });
        context.Cities.Add(new City { Name = "La Playa", CountryId = 1, DepartmentId = 10 });
        context.Cities.Add(new City { Name = "Labateca", CountryId = 1, DepartmentId = 10 });
        context.Cities.Add(new City { Name = "Los Patios", CountryId = 1, DepartmentId = 10 });
        context.Cities.Add(new City { Name = "Lourdes", CountryId = 1, DepartmentId = 10 });
        context.Cities.Add(new City { Name = "Mutiscua", CountryId = 1, DepartmentId = 10 });
        context.Cities.Add(new City { Name = "Ocaña", CountryId = 1, DepartmentId = 10 });
        context.Cities.Add(new City { Name = "Pamplona", CountryId = 1, DepartmentId = 10 });
        context.Cities.Add(new City { Name = "Pamplonita", CountryId = 1, DepartmentId = 10 });
        context.Cities.Add(new City { Name = "Puerto Santander", CountryId = 1, DepartmentId = 10 });
        context.Cities.Add(new City { Name = "Ragonvalia", CountryId = 1, DepartmentId = 10 });
        context.Cities.Add(new City { Name = "Salazar", CountryId = 1, DepartmentId = 10 });
        context.Cities.Add(new City { Name = "San Calixto", CountryId = 1, DepartmentId = 10 });
        context.Cities.Add(new City { Name = "San Cayetano", CountryId = 1, DepartmentId = 10 });
        context.Cities.Add(new City { Name = "Santiago", CountryId = 1, DepartmentId = 10 });
        context.Cities.Add(new City { Name = "Sardinata", CountryId = 1, DepartmentId = 10 });
        context.Cities.Add(new City { Name = "Silos", CountryId = 1, DepartmentId = 10 });
        context.Cities.Add(new City { Name = "Teorama", CountryId = 1, DepartmentId = 10 });
        context.Cities.Add(new City { Name = "Tibú", CountryId = 1, DepartmentId = 10 });
        context.Cities.Add(new City { Name = "Toledo", CountryId = 1, DepartmentId = 10 });
        context.Cities.Add(new City { Name = "Villa Caro", CountryId = 1, DepartmentId = 10 });
        context.Cities.Add(new City { Name = "Villa del Rosario", CountryId = 1, DepartmentId = 10 });
        context.SaveChanges();
      }

      if (!context.SystemUsers.Any())
      {
        context.SystemUsers.Add(new SystemUser { CountryId = 1, DepartmentId = 10, CityId = 30, Address = "", FirstName = "Administrador", LastName = " - Sistema", GenreId = 1, Phone = "5555555", UserName = "admin@gmail.com", Password = "admin123", Role = "Administrador" });
        context.SaveChanges();
      }

      SeedUsers(userManager, mapper);
    }

    public static void SeedUsers(UserManager<AppUser> userManager, IMapper mapper)
    {
      if (userManager.FindByEmailAsync("admin@gmail.com").Result == null)
      {
        var user1 = mapper.Map<AppUser>(new RegistrationViewModel { FirstName = "Administrador", LastName = " - Sistema", Email = "admin@gmail.com", Password = "admin123" });

        IdentityResult result = userManager.CreateAsync
        (user1, "admin123").Result;
      }
    }
  }
}
