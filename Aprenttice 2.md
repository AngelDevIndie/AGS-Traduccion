## Fuente

El offset donde empieza los parámetros de la fuente es F5Ah, y siempre empieza por la fuente agsfnt0.

![imagen](https://user-images.githubusercontent.com/63190654/205697676-e1142360-7e18-469e-95a0-5371d60403dd.png)

En la imagen se ve que hay 3 fuentes, primer lote de 3 bytes es el tamaño de la fuentes y segundo lote de 3 bytes es el parámetro del outline de las fuentes.

![imagen](https://user-images.githubusercontent.com/63190654/205698950-a0df9986-2860-4ff1-ab89-0b33d0498f2f.png)


El significado de cada valor es:
- FFh -> Sin outline
- F6h -> Con outline automático

![imagen](https://user-images.githubusercontent.com/63190654/203366744-1e288642-1a1f-4cac-a8f7-e60c7ae6f1af.png)
