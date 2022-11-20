# DIARIO DE TRADUCCIÓN
- Se ha añadido modo debug usando el método DEBUG.MD, pero solo funciona la tecla CTRL + D, mostrando información de la room.

![imagen](https://user-images.githubusercontent.com/63190654/202894518-609ca441-d806-4245-a3b5-0d6fdb513bf9.png)

- Se ha buscado en todos los archivos ".s" si existe el comando "debug", no encontrandose ninguno.
- Normalmente el globalscript viene con este código generado:

![imagen](https://user-images.githubusercontent.com/63190654/202895851-f1a5e832-94f8-48e9-b29b-6251cc48ea61.png)

- Así que busco algún comando que se encuentre en el "globalscript.s"

- Solo encuentro el comando "SaveScreenShot" que parece se ejecuta con una tecla, por defecto F12.

![imagen](https://user-images.githubusercontent.com/63190654/202895929-1eac2f16-da22-48da-81b2-18da5923d365.png)

- Para poder comparar que hace el comando debug en el que viene por defecto sería esto.

![imagen](https://user-images.githubusercontent.com/63190654/202896104-e767ab93-158e-4f0b-ac6d-3f960089a16b.png)

- El de color verde es la combinación de teclas. Miramos el manual del AGS para saber cuál corresponde.

![imagen](https://user-images.githubusercontent.com/63190654/202896210-eb659df2-9417-48df-aa56-1a96d81c6721.png)

- Se puede ver que corresponde con Ctrl+A.

- Recordemos que hacía.

![imagen](https://user-images.githubusercontent.com/63190654/202896332-31f0842f-1f5f-4142-8693-570be9c70dfc.png)

- Se ejecuta el comando "Debug (2,0)".
- Y vemos que el color morado está el parámetro "2" para "Debug".

![imagen](https://user-images.githubusercontent.com/63190654/202896104-e767ab93-158e-4f0b-ac6d-3f960089a16b.png)

- Como me interesa usar la opción teletransportarse, el comando a ejecutar es "Debug (3,0)" y también voy a usar la combinación de tecla CTRL + X.
- Cambio la línea de código que se hace el screenshot por lo que se muestra a continuació.

![imagen](https://user-images.githubusercontent.com/63190654/202896701-d5b60cd2-beb0-4233-8eb6-24046942b070.png)

- Funciona ahora...jejeje.

![imagen](https://user-images.githubusercontent.com/63190654/202905087-db4adff8-dc87-4309-98de-ab6b888fb454.png)

- Pero como el juego tiene varios personajes, siempre queda activo el principal y el juego se vuelve loco.
- Ahora tengo que pensar como hacerlo en código.

