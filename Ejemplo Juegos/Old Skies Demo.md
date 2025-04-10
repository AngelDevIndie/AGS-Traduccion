# Old Skies Demo
Trabajo realizado para la versión v1.01.
- Se ha conseguido traducir el texto de los diálogos mostrados en las burbujas.
- Modificar los tamaños de los GUI para que quepa el texto traducido.
- Explicar como se traduce algunos texto mostrados en la GUI de ChronoZen.
## BubbleSpeech
El texto se muestra en unas burbujas al estilo de comic como se puede ver en la imagen:

![imagen](https://github.com/user-attachments/assets/120af13b-ad76-4ed2-aba8-3b3ecd9d10af)

Este texto usa el archivo gamescript6.s que corresponde al script "SpeechBubble.asc" y hace este efecto.
Antes de mostrarse el texto en la burbuja, se usa un script llamado "TalkyManager.asc" que está en el archivo gamescript21.s, y que divide el texto en varias líneas gracias a la función "InsertLineBreaks".
Según he buscado en los plugins de AGS, su uso sería algo así:

    String Sentence = "This demo game is going to demonstrate how the LineBreak module can be used to manage line-breaking text. We'll start with the Labels below.";
    Sentence = LineBreak.AddLineBreaks(Sentence, eLineBreak_Word, 200, 2);
    LineBreak.Parse(Sentence);
    String Line = LineBreak.GetLine();
    while (Line != null) {
	    player.Say(Line);
	    Line = LineBreak.GetLine();
    }
Lo que hay que hacer si tuviéramos el código fuente, sería modificar la segunda línea de código con el comando GetTranslation:

    Sentence = LineBreak.AddLineBreaks(GetTranslation(Sentence), eLineBreak_Word, 200, 2);
Por tanto, para que haga efecto con nuestro archivo decompilado, es buscar todas las líneas que contenga el comando "InsertLineBreaks" que es equivalente a "AddLineBreaks" de nuestro ejemplo.
En el archivo gamescript21.s hay tres líneas con este comando. Muestro un ejemplo abajo:

![imagen](https://github.com/user-attachments/assets/18882bae-0c4b-4d2c-b83a-4a8223cc53d8)

El código con GetTranslation insertado de la manera que he explicado más arriba en el script decompilado quedaría así:

![imagen](https://github.com/user-attachments/assets/b13d9849-0e60-4ede-9949-8df827af7cf7)

## GUI

### ChronoZen
