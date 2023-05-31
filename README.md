# CRUD Node.js MySQL Handlebars

Aplicación basada del [repositorio](https://github.com/cornegramm/CRUDNodejsMySql/) con modificaciones en el archivo app.js para que reciba las variables de ambiente necesarias para la conexion a la base de datos Mysql. Se agregó imagenes de docker y docker-compose.

Futura Release:
- Integración con Github Actions


## Descripción

CRUD con javascript, nodejs, y mysql 8. Lista de tareas con javascript, donde podemos añadir tareas, visualizarlas en una tabla, editar las tareas y eliminarlas.

Entre las funciones que admite, se encuentran:

- Creación de una tarea compuesta por un título u una Descripción
- Modificación de la tarea
- Eliminación de la tarea
- Persistencia a traves de una DB Percona 5.7

## Instalación

Si desea probar la aplicacion, debe contar con los siguientes pre-requisitos:

- Docker
- Docker compose

Para ejecutar el docker-compose, hay que situarse en el directorio raiz del repositorio y ejecutar el siguiente comando:

```bash
docker compose up -d
```

## Desarrollo

Como pre-requisito se requiere:

- Docker
- [Node.js](https://nodejs.org/en/) v16.0+

1) Crear un directorio para los datos de la DB de prueba y otorgarles los permisos requeridos

```bash
    mkdir datos
    chmod -R a+rwx datos/
```

2) Ejecutar la imagen de docker de la DB percona 5.7

```bash
docker run -d --restart=unless-stopped --name db -e MYSQL_ROOT_PASSWORD=pass123 -v $(pwd)/datos:/var/lib/mysql -p3306:3306 aanzorena/percona-app-tareas:5.7
```

2) Instalar las dependencias

```bash
npm install
```
## Comando utiles

1) Ejecutar la aplicación

```bash
npm run
```

2) Ejecutar la aplicación en mode dev

```bash
npm dev
```

# Creditos
- [repositorio](https://github.com/cornegramm/CRUDNodejsMySql/)