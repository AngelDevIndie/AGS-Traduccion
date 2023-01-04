## Requisitos

 - Notepad ++ en modo ANSI
 - World Replace free

## Procedimiento

Partiendo de un código ejemplo como el de abajo, vamos a dar los pasos necesarios.

    //#GameName=Detective208X
    // [game28.dta]
    //   [dialog topic 1]
    //   [global script strings]
    scrnshot.pcx
    
    //   [dialog script strings]
    &1 Get me more coffee Roger.
    Dame mas cafe Roger.
    &1 Filling your cup sir!
    &1 ¡Llenando su taza, señor!

 1. Borrar las líneas que empiezan por *//*
Para ello usamos Notepad++ haciendo una búsqueda de la cadena regular que se muestra abajo, y reemplazando por el campo vacío.

>     ^\/\/.*\r\n

Captura de pantalla:

![imagen](https://user-images.githubusercontent.com/63190654/210641697-55f5c39d-3f84-4676-b827-d9133539ee32.png)

Quedará así:

    scrnshot.pcx
    
    &1 Get me more coffee Roger.
    Dame mas cafe Roger.
    &1 Filling your cup sir!
    &1 ¡Llenando su taza, señor!

 2. Ahora toca buscar las líneas que están en blanco y borrar la línea superior y esa línea en blancon. Para ello usamos Notepad++ haciendo una búsqueda de la cadena regular que se muestra abajo, y reemplazando por el campo vacío.

>  .*\r\n\r\n

Captura de pantalla:

![imagen](https://user-images.githubusercontent.com/63190654/210658384-5f93c3da-4a4c-4237-b502-26f97a35ef29.png)

Quedará así:

    &1 Get me more coffee Roger.
    Dame mas cafe Roger.
    &1 Filling your cup sir!
    &1 ¡Llenando su taza, señor!

 3.  En este paso vamos a terminar de crear el diccionario. Para ello juntaremos la frase en inglés junto con su traducción en español en la misma línea, pero separadas entre ellas con una tabulación. Para ello usamos Notepad++ haciendo una búsqueda de la cadena regular que se muestra abajo, y reemplazando el retorno de carro y nueva línea por un tabulador.
Buscamos:

>  \r\n(.*\r\n)

Reemplazamos con:

> \t\1

Captura de pantalla:

![imagen](https://user-images.githubusercontent.com/63190654/210662601-e16dc923-3551-433f-a0df-ce5d5737ca62.png)

OJO!!! Desmarcar la casilla *"Todo el documento"*

Quedará así:

    &1 Get me more coffee Roger.	Dame mas cafe Roger.
    &1 Filling your cup sir!	&1 ¡Llenando su taza, señor!
    
 4. Ahora guardamos el resultado para luego abrirlo con el programa que lo usará como diccionario. El cual debería quedar como se muestra abajo. Hemos partido de una plantilla.

![imagen](https://user-images.githubusercontent.com/63190654/210663497-ea92e1d1-fbca-4e10-970d-95b53db7d604.png)

 5. Ejecutamos el programa *"World Replace"*, y abrimos el archivo donde queremos aplicar el diccionario.

![imagen](https://user-images.githubusercontent.com/63190654/210664032-33c996d3-c220-4a49-ac5a-abe19a936846.png)


