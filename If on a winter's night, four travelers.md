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

![imagen](https://user-images.githubusercontent.com/63190654/202896151-d1c3c0bd-29d7-4d5a-9bfd-c6e54a74ab97.png)

- Se puede ver que corresponde con Ctrl+A.
