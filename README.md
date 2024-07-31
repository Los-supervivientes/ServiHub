# SERVIHUB
Proyecto final del Bootcamp Desarrollo de Apps Móviles impartido por keepcoding. 
- Realizado por el equipo de alumnos **"Los últimos supervivientes"**.
## Descripción

**ServiHub** es una aplicación que ofrece una plataforma para conectar usuarios con profesionales de diversos servicios, desde fontaneros y peluqueros hasta abogados. La aplicación permite a los usuarios gestionar reservas, valorar servicios y comunicarse a través de un chat integrado.

### Funcionalidades
**Registro de Usuarios** 
- Los usuarios pueden registrarse como clientes o profesionales.
**Gestión de Reservas** 
- Los usuarios pueden reservar servicios de profesionales disponibles.
**Valoraciones** 
- Los clientes pueden valorar y dejar comentarios sobre los servicios recibidos.
**Perfil Profesional**
- Los profesionales pueden crear y gestionar su perfil de negocio.
**Chat en Tiempo Real** 
- Comunicación directa entre usuarios clientes y profesionales.
### Capturas de Pantalla



### Patrón de Arquitectura: MVVM
La aplicación se ha desarrollado utilizando el patrón de arquitectura MVVM (Model-View-ViewModel), lo que permite una separación clara de responsabilidades y facilita el mantenimiento y escalabilidad del código.

**Model** 
- Representa la capa de datos y lógica de negocio. En nuestra aplicación, incluye la gestión de datos de usuarios, reservas, y servicios, utilizando una base de datos creada con Vapor y PostgreSQL.
**View** 
- La interfaz de usuario de la aplicación, desarrollada con SwiftUI, que muestra los datos y permite la interacción del usuario.
**ViewModel** 
- Actúa como un intermediario entre el Model y la View, manejando la lógica de presentación y gestionando las respuestas a las interacciones del usuario.

### Tecnologías Utilizadas
- **Lenguaje:** Swift.
- **Backend:** Vapor con PostgreSQL.
- **Networking:** Async/Await.
- **Seguridad:** Keychain para almacenamiento seguro de credenciales.
- **Testing:** ViewInspector para pruebas de interfaz de usuario.
- **Diseño:** Figma para diseño y prototipado.

### Colaboradores
```
Cristian Contreras - https://github.com/Criscovez
Alejandro Gavira - https://github.com/agavgar
Rocio Martos - https://github.com/Rociomartos29
Diego Andrades - https://github.com/diegoao
Jose Bueno - https://github.com/Boncroix
Pablo Peragón - https://github.com/PabloPeragon
```
### Instalación
Clona este repositorio:

```
git clone git@github.com:Los-supervivientes/ServiHub.git
```
Inicializa y actualiza los submódulos para descargar el contenido de estos:
```
git submodule update --init --recursive
```
**- Dentro se encuentra la app para IOS ServiHub y el servidor Server- ServiHub**

**Contribución**

- Haz un fork del repositorio y crea una nueva rama:
```
git checkout -b feature/nueva-funcionalidad
```
- Realiza tus cambios y haz commit:
```
git commit -m 'Añadir nueva funcionalidad'
```
- Haz push a la rama:
 ```
 git push origin feature/nueva-funcionalidad
```
* #### Abre un Pull Request.


**Contacto:**
Si tienes preguntas o sugerencias, por favor contacta a cursos@keepcoding.io.
