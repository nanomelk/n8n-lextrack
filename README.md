# n8n con Docker y Render

El proyecto puede ejecutarse en local con Docker Compose o desplegarse en Render.

## Local

Requisitos:
- Docker Desktop instalado y corriendo.
- Ngrok instalado y autenticado (`ngrok config add-authtoken <tu_token>`).

Para iniciar:
1. Asegúrate de que la URL en el archivo `.env` coincida con la que te asigna ngrok.
2. Haz doble clic en `iniciar.bat`.
3. Accede a la URL que aparece en la consola.

Para detener:
Abre una terminal en esta carpeta y ejecuta:
```bash
docker-compose down
```

## Render

1. Sube este repositorio a GitHub.
2. En Render, crea un **Blueprint** y selecciona el repositorio.
3. Render leerá `render.yaml`, usará la imagen oficial de n8n y creará un disco persistente.
4. Elige el plan `Starter` o superior, porque los discos persistentes no están disponibles en el plan gratuito.

La clave `N8N_ENCRYPTION_KEY` se genera automáticamente y queda guardada por Render. No uses el `.env` local en Render: configura allí cualquier credencial adicional como variable de entorno.