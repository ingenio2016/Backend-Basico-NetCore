# Backend Base para iniciar proyectos con autenticacion de usuarios

Pasos para Correr el proyectos
1. Descargar NodeJs de la pagina oficial para poder habilitar la instalacion de paquetes de Node.

2. Luego de descargado iniciar una ventana de comandos dentro de la raiz de Este proyecto y ejecutar el siguiente comando.

-> npm install

(Este comando se ejecuta para instalar las dependencias del proyecto para que éste pueda trabajar. Este proceso solo se realiza una UNICA vez cuando se plantea arrancar un nuevo proyecto).
RECORDAR: Este proyecto debe ser siempre copiado para tener la versión básica siempre en cero.

3. Abrir el archivo appsettings.json y appsettings.Development.json para configurar el nombre de la Base de Datos donde se almacenara la informacion.
En este paso es donde se define la cadena de conexión del sistema

ejm de la cadena de conexión a cambiar:

"ConnectionStrings": {
    "DefaultConnection": "Server=DESKTOP-4ENIJNG\\SQLEXPRESS;Database=TestDatabase;Trusted_Connection=True;MultipleActiveResultSets=true"
}

Donde: DESKTOP-4ENIJNG\\SQLEXPRESS = Nombre del Servidor de SQL Server
	   TestDatabase = Nombre de la Base de Datos que se usara.
	   
NOTA: La base de datos no necesita estar creada. Al correr el sistema la crea automaticamente

4. El siguiente paso es correr las migraciones para que la base de datos reciba las tablas y modelos que vienen por defecto.
Para ello se deben ejecutar este comando.

-> dotnet ef database update

5. Con estos pasos ya el sistema se encuentra listo para iniciar su funcionamiento. Correr el proyecto en visual studio cuidando que no existan errores y abrir
postman para verificar el inicio de sesión en el sistema

6. Para verificar que el funcionamiento sea el correcto se debe realizar una peticion de tipo POST en PostMan de la siguiente manera

URL: http://localhost:5000/api/auth/login
HEADERS: Content-Type -> application/json
BODY: {
		"UserName":"admin@gmail.com",
		"Password":"admin123"
      }
	  
7. Si todo está correcto se debería recibir una respuesta de Código 200 y un JSON similar al siguiente:

{
    "success": true,
    "result": 200,
    "data": {
        "id": 1,
        "firstName": "Administrador",
        "lastName": " - Sistema",
        "phone": "5555555",
        "address": "",
        "genreId": 1,
        "genreName": "Masculino",
        "countryId": 1,
        "countryName": "Colombia",
        "departmentId": 10,
        "departmentName": "Norte de Santander",
        "cityId": 30,
        "cityName": "Cúcuta",
        "fullName": "Administrador  - Sistema",
        "userEmail": "admin@gmail.com",
        "password": ":)",
        "role": "Administrador",
        "auth_token": "{\r\n  \"id\": \"2a926ee3-3db5-485f-b89c-4b991a08677d\",\r\n  \"auth_token\": \"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZG1pbkBnbWFpbC5jb20iLCJqdGkiOiJjN2Y3MzkwMC0xM2RjLTQwMjQtYTUxMi1lYTEyZWU1NTE2NmYiLCJpYXQiOjE1NTk5NTYzMjcsInJvbCI6ImFwaV9hY2Nlc3MiLCJpZCI6IjJhOTI2ZWUzLTNkYjUtNDg1Zi1iODljLTRiOTkxYTA4Njc3ZCIsIm5iZiI6MTU1OTk1NjMyNywiZXhwIjoxNTYwMDQyNzI3LCJpc3MiOiJ3ZWJBcGkiLCJhdWQiOiJodHRwOi8vbG9jYWxob3N0OjUwMDAifQ.8oKzZP4u1bHCH_umO04aaukVMtBLUKUlvozngaBgPxQ\",\r\n  \"expires_in\": 86400\r\n}",
        "imageUrl": null
    },
    "message": "El usuario ha sido logueado exitosamente"
}

8. Si llegamos a éste paso sin problemas ya tenemos todo listo para poder continuar construyendo nuestra aplicación.

Recordar el orden cada vez que se necesite un nuevo Modelo

1. Crear el modelo de lo que se quiere hacer en la carpeta Models
2. Registrar el Modelo creado en la carpeta Data/ApplicationDbContext
3. Abrir una ventana de consola y crear la nueva migración de la siguiente manera:
   -> dotnet ef migrations add nombreDeLaMigracionQueSeLeQuiereDarEscribiendolaEnCamelCase
4. Luego de creada la migración es muy importante ir a la carpeta Migrations y buscar la migración creada, luego de encontrada abrirla y revisar si existen lineas de Codigo que contengan la palabra
ReferentialAction.XXXXXXXXXXX y cambiarlas a ReferentialAction.NoAction

5. Luego de verificado se guardan cambios y se ejecuta el segundo comando en la linea de comandos que es
   -> dotnet ef database update
   
6. Si todo esta bien hasta aca lo siguiente seria crear los controladores y los ViewModels que se han repazado