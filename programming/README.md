# TRES EN RAYA
> Este proyecto Universitario, se baso en aprender los fundamentos necesarios para la utilizar el lenguaje de programacion python, para diferentes fines. Aprendiendo de esta forma los conceptos que ayudarian a crear dicho proyecto.
## Modulos
> Para este proyecto solo se necesitaron 2 modulos, `sys` y `random`. Sin embargo el modulo `sys` no es del todo necesario, en nuestro proyecto, como veremos mas adelante en el codigo, este nos ayuda a realizar una salida del juego sin errores en la pantalla.
## Funciones
### dibujar_pizarra()
Esta funcion realiza un simple trabajo y es la de dibujar la pizarra en los diferentes estados en los que se encuentra nuestro juego, podemos observar que esta funcion se puede repetir de forma recursiva por lo que debemos tener en cuenta su esta de actualizacion continua mediante la sustitucion de la posicion `pizarra[]`.

### entrada_jugador(eleccion)
Marca cada una de las elecciones de los jugadores, incluyendo tambien estrucuturas de control para el correcto "input" en cada turno del juego. Tambien debemos de tener en cuenta que si la pizarra esta vacia, este podra realizar una jugada, no sobrescribiendo, las fichas ya jugadas.

### ganador(eleccion,pizarra)
Se realizo un pequeño algoritmo con las posibles combinaciones para ganar el juego, en lo que detecta si alguna de estas fue realizada retorna un booleano que nos permitira ganar el juego y salir de la partida en cuestion.

### movimiento_pizarra_temp(i,pizarra,eleccion)
`movimiento_pizarra_temporal` nos brinda una pizarra temporal donde guardarmos las variables en una lista temporal, para no rescribir los datos, ademas dibuja una nueva pizarra. Tambien realiza una estructura de control que permite saber si hemos ganado o no, retornando el booleano que le indica a la funcion "juego_fuente" el ganador de la partida.

### opcion_cpu_1(cpu , Jugador , pizarra)
Algoritmo desarrollado para jugar en modo facil, por ejemplo este tiene una secuencia para realizar jugadas, siempre de forma lineal.

### opcion_cpu_2(cpu , Jugador , pizarra)
Algoritmo desarrollado para jugar en modo intermedio, por ejemplo este tiene una secuencia para realizar jugadas, siempre de forma lineal y random.

### opcion_cpu_3(cpu , Jugador , pizarra)
Evalua la casilla jugada, dando un numero al azar, este es evaluado por la pizarra temporal, viendo la combinacion posible ganadora, de lo contrario, solo evalua si hay un espacio vacio y ejecuta su jugada.

### jugar_de_nuevo()
Esta funcion resetea o sale del juego, se encuentra de forma recursiva en otras funciones.

### chequear_ganador(jugador_1, jugador_2)
Realiza una comprobacion de las posibles posiciones ganadores para ambos jugadores, de lo contrario es capaz de iniciar la funcion jugar_de_nuevo(). La estructura de control verificara si las tres casillas corresponden a un mismo jugador y si esta son validadas, declara ganador al jugador, esto retornando el valor booleano "True" en la funcion, que estara inspeccionado bajo otra estructura de control.

### ficha_jugador(modo)
Con esta funcion podemos escoger la ficha del jugador.

### modo_de_juego()
Con esta funcion podemos escoger el modo del jugador.

### juego_fuente()
Recopila las funciones y el orden en que se van a ejecutar ademas de realizar un bucle en el que cada pieza es indicada de la posicion jugada y verificar si el juego entra en empate, o existe un ganador.

## Consideraciones
Este juego fue realizado en mi primer año de carrera en lo que se procuro utilizar los fundamentos de la programacion para el correcto funcionamiento de la misma, por lo que hay carencias de librerias externas y se abordo el proyecto desde una parte mas funcional y no se intento refactorizar el codigol

Sientete libre de realizar comentarios y aportes al codigo.
