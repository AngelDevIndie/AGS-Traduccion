# Editar Fuentes Tipográficas

En el archivo ***"ac2game.dta"*** tenemos lo necesario para modificar las fuentes.

El offset donde empieza los parámetros de la fuente es **F5Ah**, y siempre empieza por la fuente **agsfnt0**.

![imagen](https://user-images.githubusercontent.com/63190654/205697676-e1142360-7e18-469e-95a0-5371d60403dd.png)

En la imagen se ve que hay 3 fuentes, primer lote de 3 bytes es el tamaño de la fuentes y segundo lote de 3 bytes es el parámetro del outline de las fuentes.

![imagen](https://user-images.githubusercontent.com/63190654/205698950-a0df9986-2860-4ff1-ab89-0b33d0498f2f.png)

En el primer bloque se ven **00h** porque son fuentes de tipo *wfn* y vienen definidas con ese valor.

El el segundo bloque, el significado de cada valor es:
- **FFh** -> Sin outline
- **F6h** -> Con outline automático
- **xxh** -> Es el número de fuente que hará el outline a esta.

Más abajo podemos ver un ejemplo comparando dos *"ac2game.dta"* que paso a explicar.

![imagen](https://user-images.githubusercontent.com/63190654/205710106-1e44423f-dab8-4b95-b6eb-a134466a9c62.png)

