# Modificar imágenes en versión 2.xx
Existen juegos que usan imágenes PNG de 8 bits, las cuales llevan una paleta indexada de hasta 256 colores. Cuando se quiere editar hay que tener en cuenta que esta paleta debe usarse, de lo contrario aparecen colores diferentes.
Partiendo de esta base, si se nos da el caso de usar imágenes de 24 o 32 bits y al pasarla a 8 bits se nos muestra colores diferentes podemos realizar un *"truco"* que paso a describir:

 - Abrir con un editor gráfico como GIMP  (Photoshop debería valer también) la imágen original.
 - Se añade una segunda capa con la imagen modificada ya convertida en 8 bits.
 - Al exportar a PNG usará la paleta de la imagen original.
