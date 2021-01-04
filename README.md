
# Api Gateway

https://urbanio.herokuapp.com

## Configuración

| Path | Microservicio |
|--|--|
| "/api/v1/login" y "/api/v1/user" |  https://urbanio-autenticacion.herokuapp.com |
| /api/v1/facturacion* | https://urbanio-facturacion.herokuapp.com |
| /api/v1/reservas* | https://urbanio-reservas.herokuapp.com |
| /api/v1/vehicles* | https://urbanio-vehiculos.herokuapp.com |
| /api/v1/viajes* | https://urbanio-viajes.herokuapp.com |


## Seguridad y Usuario
El propio Api Gateway realiza la verificación del token y añade 2 nuevas cabeceras a la petición:

| Cabecera| Descripción|
|--|--|
| x-user | En esta cabecera llega el identificador del usuario que realiza la petición|
| x-rol | USER o ADMIN para diferenciar el perfil de acceso del usuario|
| Authorization | Esta cabecera es donde el front debe incluir el token JWT obtenido del login (al microservicio también le llega la cabecera, pero en principio no le va a hacer falta|


### Ejemplo de uso en código

```javascript
app.get(BASE_API_PATH + "/pruebas-auth", (req, res) => {
	idCliente = req.header('x-user')
	if (idCliente){
		var result = ObtenerReservas(idCliente);
		res.send(result)
	}else{
		res.status(400).send()
	}
});
```