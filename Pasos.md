Pasos para meter modo debug.

![imagen](https://user-images.githubusercontent.com/63190654/202892136-1e5afa94-2714-4719-bec4-3b657ead82f1.png)

Desde que empieza el nombre del juego incluyendo el último byte, debe haber x35 bytes. Ese último byte hay que colocar a 01 como aparece en la imagen.

Luego nos dirigimos al final del archivo.

![imagen](https://user-images.githubusercontent.com/63190654/202892228-652669de-5f80-4467-9e97-a6508fcb2ad6.png)

Buscamos la cadena hexadecimal "FF FF FF FF" como el naranja, y añadimos la cadena hexa que aparece en amarillo -> "01 00 00 00 01 00 00 00 00"


OTRO MÉTODO

Usamos el IDE engine con la misma versión, creamos un proyecto con el modo debug activado.
Guardamos el proyecto.
Decompilamos con AGSUTILS y extraemos el game28.dta.
Del juego que queremos traducir extraemos todos los scripts ".o" del game28.dta.
Ahora importamos estos scripts en nuestro game28.dta creado con el modo debug activado.
Se ha probado en una pequeña demo y me ha funcionado.
