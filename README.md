# SERVIHUB
Proyecto final del Bootcamp Desarrollo de Apps Móviles impartido por keepcoding. 
- Realizado por el equipo de alumnos **"Los últimos supervivientes"**.
## Descripción

**ServiHub** es una aplicación que ofrece una plataforma para conectar usuarios con profesionales de diversos servicios, desde fontaneros y peluqueros hasta abogados. La aplicación permite a los usuarios gestionar reservas, valorar servicios y comunicarse a través de un chat integrado.

### Funcionalidades
#### Registro de Usuarios
- Los usuarios pueden registrarse como clientes o profesionales.
#### Gestión de Reservas 
- Los usuarios pueden reservar servicios de profesionales disponibles.
#### Valoraciones 
- Los clientes pueden valorar y dejar comentarios sobre los servicios recibidos.
#### Perfil Profesional
- Los profesionales pueden crear y gestionar su perfil de negocio.
#### Chat en Tiempo Real
- Comunicación directa entre usuarios clientes y profesionales.

### Capturas de Pantalla
| ![Simulador1](https://github.com/Los-supervivientes/ServiHub/blob/main/Photos%20for%20git/Captura1.png) | ![Simulador2](https://github.com/Los-supervivientes/ServiHub/blob/main/Photos%20for%20git/Captura2.png) | ![Simulador3](https://github.com/Los-supervivientes/ServiHub/blob/main/Photos%20for%20git/Captura3.png) | ![Simulador4](https://github.com/Los-supervivientes/ServiHub/blob/main/Photos%20for%20git/Captura4.png) |![Simulador5](https://github.com/Los-supervivientes/ServiHub/blob/main/Photos%20for%20git/Captura5.png) | ![Simulador6](https://github.com/Los-supervivientes/ServiHub/blob/main/Photos%20for%20git/Captura6.png) |
| --- | --- | --- | --- | --- | --- | 
| Login | Register | Error | Charge | Home | Setting |

```
1. Login -> Pantalla en la cual tenemos que logearnos.
Previamente tenemos que crearnos un usuario. Si
obtenemos un error al ingresar el usuario o contraseña nos
Llevará a la ventana de error. Si iniciamos sesion no volverá
a salir hasta que pulsemos el botón logOut!
```
```
2. Ventana de Registro -> Podemos registrarno como usuario
consumidor de servicios o como profesional para gestionar
un negocio.
```
```
3. Ventana Error -> Nos muestra cualquier error producido
durante el login o el registro de usuario.
```
```
4. Ventana de Carga -> Se nos mostrará entre transiciones
de la App.
```
```
5. Ventana de Home -> En esta ventana podemos ver todos
los servicios registrados en la App y gestionar nuestro
propio servicio.
```
```
6 Ventana de Setting -> Setting de la APP.
```




### Patrón de Arquitectura: MVVM
La aplicación se ha desarrollado utilizando el patrón de arquitectura MVVM (Model-View-ViewModel), lo que permite una separación clara de responsabilidades y facilita el mantenimiento y escalabilidad del código.

#### Model 
- Representa la capa de datos y lógica de negocio. En nuestra aplicación, incluye la gestión de datos de usuarios, reservas, y servicios, utilizando una base de datos creada con Vapor y PostgreSQL.
#### View 
- La interfaz de usuario de la aplicación, desarrollada con SwiftUI, que muestra los datos y permite la interacción del usuario.
#### ViewModel
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
