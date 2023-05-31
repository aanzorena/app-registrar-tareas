# Se utiliza como imagen base una imagen de Node es un alpine a fin de usar una imagen liviana
FROM node:16.20.0-alpine

# Establecer el directorio de trabajo, donde se encuentra el codigo de la App
WORKDIR /app

# Copia el package.json
COPY package.json .

# Se instalan las dependencias
RUN npm install

# Se agregan etiquetas del Mantainer, nombre de la imagen de docker, descripcion del la aplicación y su versión actual
LABEL maintainer="Agustin Anzorena Ostengo <a.anzorena.ostengo@gmail.com>" \
image="harbor.tallerdevops.com/acttema3-anzorenaostengoagustin/app-registrar-tareas" \
description="Aplicacion de Registro de tareas" \
version="1.1.0"

# Se crea el volumen anonimo para persistencia de datos generados por la aplicación web
VOLUME /datos

# Se expone el puerto en el que escucha la aplicacion
EXPOSE 8081

# Se setea como ENTRYPOINT del contenedor a npm para luego pasarle en el CMD el argumento para iniciar la aplicación
ENTRYPOINT [ "npm" ]

# El proceso que ejecuta el contenedor sera el argumento start que inicia la aplicación
CMD [ "start" ]

# Copia el contenido del directorio de la app con el codigo fuente
COPY . .