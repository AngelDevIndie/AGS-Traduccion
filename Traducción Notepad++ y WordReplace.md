## Requisitos

 - Notepad ++
 - World Replace free
 - LibreOffice Calc o Excell

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
