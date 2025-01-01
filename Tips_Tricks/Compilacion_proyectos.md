
# COMO GENERAR EJECUTABLES DE C Y C++ DE PROYECTOS

## AGS

### EN LINUX

 1. Ir a la carpeta donde esté el *cmakelist.txt* y ejecutar:

> cmake .

 2. Se creará el makefile necesario para hacer la *build*. El siguiente paso es ejecutar:

> make

 3. Y con esto ya se creará la build y podemos ejecutar.

### WINDOWS

 1. Instalar Microsoft Visual Studio Community, con las opciones de C++ y Cmake.
 2. Ir hasta las soluciones y resolver conflictos que lo arregla el IDE solo.
 3. Compilar la solución.


## AGSUTILS

### LINUX

Como no hay Cmakelist, y existe un Makefile. Tan solo basta con ejecutar:

    make

### WINDOWS

Hay que usar *Cygwin* e instalar el paquete *make*, para luego abrir la consola y ejecutar:

    make
