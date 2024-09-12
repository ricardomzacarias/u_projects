#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Autor: Ricardo Leonel Marin Zacarias / @rlmz93

Asignatura: Programming

"""

# Importamos el modulo random para que nos sirva de ayuda en la opcion_cpu_3 (IA Facil)
import random
# Modulo sys para salir del juego sin errores.
import sys

# Imprimimos la presentacion del juego.
print(60*"*"+"\n"+60*"*")
print(5*" ","     _ _   _  ____ _   _ _____ __  __  ___  ____  ")
print(5*" ","    | | | | |/ ___| | | | ____|  \/  |/ _ \/ ___| ")
print(5*" "," _  | | | | | |  _| | | |  _| | |\/| | | | \___ \ ")
print(5*" ","| |_| | |_| | |_| | |_| | |___| |  | | |_| |___) |")
print(5*" "," \___/ \___/ \____|\___/|_____|_|  |_|\___/|____/ \n")
print(18*" "," _____ ____  ___ _  _____")
print(18*" ","|_   _|  _ \|_ _| |/ /_ _|")
print(18*" ","  | | | |_) || || ' / | | ")
print(18*" ","  | | |  _ < | || . \ | | ")
print(18*" ","  |_| |_| \_\___|_|\_\___|\n")
print(60*"*"+"\n"+60*"*")

# Imprimimos una referencia del tablero, sin funciones, queremos que aparezca solo al principio
print("\n")
print(20*" ","REFERENCIA DE TABLERO:    ")
print(25*" ","     |    |      ") 
print(25*" ","  7  | 8  | 9    ")
print(25*" ","-----+----+----- ")
print(25*" ","     |    |      ")
print(25*" ","  4  | 5  | 6    ")
print(25*" ","-----+----+----- ")
print(25*" ","     |    |      ")
print(25*" ","  1  | 2  | 3    \n")

# Definimos una funcion para dibujar la pizarra, imprimimos todos los caracteres
# necesarios para imprimir la pantalla, y dentro de ella colocamos los valores
# de la pizarra del numero 1 al 9 (asociando cada uno de los elementos de la lista)
# todos caracteres vacios(ya que el 0 esta reservado para un caracter vacio el cual nos representara el 0 y esto nos 
# permitira trabajar comodamente con valores del 1 al 9).
# La funcion fue realizada con la finalidad de parecer lo mas posible a un 
# num_pack de los teclados de ordenador convencionales, de manera que podamos 
# jugar y tener tanto la referencia que se imprime en pantalla, tanto como la 
# referencia que tenemos del teclado num_pack en cuestion.
def dibujar_pizarra():
    print("\n")
    print(10*" "+"|"+45*"#" +"|"+"\n          |" + 45*" " + "|" )
    print(10*" "+"| " + "Tablero de Triki              Referencia:"+3*" "+"|" + "\n          |" + 45*" " + "|" )
    print(10*" "+"| " +"     |    |     "+10*" "+"     |    |   "+4*" "+"|")
    print(10*" "+"| " +"  "+pizarra[7]+"  | "+pizarra[8]+"  | "+pizarra[9]+"   "+10*" "+"  7  | 8  | 9  "+"   |")
    print(10*" "+"| " +"-----+----+-----"+10*" "+"-----+----+-----"+"  |")
    print(10*" "+"| " +"     |    |     "+10*" "+"     |    |     "+"  |")
    print(10*" "+"| " +"  "+pizarra[4]+"  | "+pizarra[5]+"  | "+pizarra[6]+"   "+10*" "+"  4  | 5  | 6  "+"   |")
    print(10*" "+"| " +"-----+----+-----"+10*" "+"-----+----+-----"+"  |")
    print(10*" "+"| " +"     |    |     "+10*" "+"     |    |     "+"  |")
    print(10*" "+"| " +"  "+pizarra[1]+"  | "+pizarra[2]+"  | "+pizarra[3]+"   "+10*" "+"  1  | 2  | 3  "+"   |"+"\n          |"+ 45*" " + "|")
    print(10*" "+"|"+45*"#" +"|"+"\n")

# Creamos una funcion que define la eleccion de la ficha ya sea X o O en una casilla vacia
def entrada_jugador(eleccion):
    eleccion = eleccion.upper()

# 1) Aplicamos un bucle que se inicializa como verdadero si los datos no 
# corresponden con lo solicitados, los numeros deben de ser del 1 al 9, sin espacios 
# ni letras ni cadenas de texto
# 2) Esta funcion sera aplicada tanto para la X como para la O, tambien verifica que
# la posicion escogida tiene que ser igual igual a un espacio vacio " ", de manera que la si
# el espacio esta ocupado, imprima que la posicion no esta disponible e inicie el bucle 
# nuevamente
# 3) Si la posicion esta vacia pero la persona coloca un dato que no se encuentre 
# en los valores requeridos imprima que indique un valor valido y se mantenga en el 
# bucle while.
    while True:
        inp_preg1 = input(f"{eleccion} Es tu turno: Elige tu opcion, recuerda seguir el\norden de referencia que se ha colocado a tu mano derecha:  ")
# El condicional if pregunta si el input tiene un numero dentro, devolviendo un verdadero
# si contiene dicho numero o False si no, aplicando cada una de las condiciones para validar
# y continuar con el siguiente paso.
        if inp_preg1.isdigit() and int(inp_preg1) <10 and int(inp_preg1) >0:
            inp_preg1 = int(inp_preg1)
            if pizarra[inp_preg1] == " ":
                return inp_preg1
            else:
                print(f"{eleccion} Esta opcion ya esta ocupada.")
        else:
            print(f"{eleccion} Porfavor elige una opcion entre los numeros 1 al 9 ")

# 1) Definimos una funcion que verifique si existe algun ganador, con las casillas
# y combinaciones ganadores, primero realizamos las posibles combinaciones en forma
# de lista, para que con un bucle for itere en cada uno de los valores dentro de la
# lista ganador_lugar. Si pizarra[casilla_jugador] 0,1,2 son iguales a eleccion que 
# es X o O dependiendo de las casillas jugadas.
# entonces se cumple la condicion y retornamos con un booleano True que utilizaremos mas adelante
# para terminar la partida.
def ganador(eleccion,pizarra):
    ganador_lugar = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
    for casilla_jugador in ganador_lugar:
        if pizarra[casilla_jugador[0]] == pizarra[casilla_jugador[1]] == pizarra[casilla_jugador[2]] == eleccion:
            return True

# Realizamos una funcion que defina el movimiento ganador con valores obtenidos de la 
# funcion opcion_cpu y entrada_jugador, guardaremos la variable pizarra en una lista
# temporal que llamaremos pizarra_temporal, la ventaja es que podemos almacenar los datos
# cumpliendo ciertas caracteristicas como no rescribir los valores que hemos colocado y
# a su vez poder dibujar una pizarra nueva cuando juguemos de nuevo.
# Cumpliendose que si la funcion ganador se cumple, tendremos como valores la eleccion
# "X" o "Y" y el valor arrojado por la iteracion de la variable I en la opcion_cpu
# cumpliendose todo esto, debe retornar el booleano True el cual nos ayudara a realizar
# el proximo movimiento.
def movimiento_pizarra_temp(i,pizarra,eleccion):
    pizarra_temporal = list(pizarra)
    pizarra_temporal[i] = eleccion
    if ganador(eleccion,pizarra_temporal):
        return True
    else:
        return False
 
# Dificil
# Creamos el valor de la jugada de cpu, por medio de bucles for que examinan las
# jugadas tanto del cpu como del jugador, buscando en los movimientos casillas vacias
# tanto en las jugadas del cpu como en las jugadas del jugador en cuestion.
# Si en el movimiento del jugador, hemos escogido la casilla numero 1, el bucle for
# del jugador no indicara esta opcion, como valida por ende las opciones validas seran
# del 2 al 9 que serian las casillas vacias en cuestion, retornamos estos valores para
# el siguiente for, el cual va a iterar por cada uno de sus valores pero la primera 
# casilla que cumpla las condiciones de estar vacia y no estar ocupada por cualquier
# juagada, retornara la jugada de la cpu haciendo que el primera valor en este bucle,
# libre sea la siguiente jugada, en este caso en el numero 5
def opcion_cpu_1(cpu , Jugador , pizarra):
# Examina las fichas donde cpu pueda ganar y las ejecuta
    for i in range(1,10):
        if pizarra[i] == " " and movimiento_pizarra_temp(i,pizarra,cpu):
            return i
# Examina las fichas donde jugador pueda ganar y las bloquea
    for i in range(1,10):
        if pizarra[i] == " " and movimiento_pizarra_temp(i,pizarra,Jugador):
            return i
# Si alguna de las opciones anteriores no existe, juga en busca del centro y las esquinas
# segun el esquema planteado en la siguiente lista.
    for i in [5,1,7,3,9,2,8,6,4]:
        if pizarra[i] == " ":
            return i

# Medio
def opcion_cpu_2(cpu , Jugador , pizarra):
# Examina las fichas donde jugador pueda ganar y las bloquea
    for i in range(1,10):
        if pizarra[i] == " " and movimiento_pizarra_temp(i,pizarra,Jugador):
            return i
# Si alguna de las opciones anteriores no existe, juga en busca del centro y las esquinas
# segun el esquema planteado en la siguiente lista.
    for i in [5,1,7,3,2,9,8,6,4]:
        if pizarra[i] == " ":
            return i

# Facil
def opcion_cpu_3(cpu , Jugador , pizarra):
# Simplemente cumple la condicion de generar una lista aleatoriamente, con numeros del
# 1 al 9, iterados por un bucle for y almacenados en la variable aleatorios, el cual entra
# en otro bucle for para verificar si alguno de los numeros tomado en la lista es un espacio
# vacio y asi, poder llevar este valor a la variable pizarra_temporal para albergarse como una
# eleccion "X" o "O" dependiendo del turno del jugador.
    aleatorios = [random.randint(1,9) for j in range(9)]
    for i in aleatorios:
        if pizarra[i] == " ":
            return i

# Definimos una funcion para jugar de nuevo al tres en raya, activando un bucle, while
# que se mantiene como verdadero, si no colocamos la opcion correcta.
# Entrando en las condicionales del juego, dependiendo de nuestra decision retorna un
# valor booleano sea verdadero o falso dependiendo de nuestra eleccion lo cual finalizara
# el juego o nos dejara jugar nuevamente, en caso de ser verdadero la ultima condicional,
# nos lleva al juego_fuente() donde podemos comenzar la partida, de lo contrario retorna
# un False el cual terminara con nuestro juego.
def jugar_de_nuevo():
    while True:
        ciclo = input("Quieres jugar nuevamente, digita Si, para continuar o No para salir ")
        if ciclo in["y","Y", "si", "Si", "SI", "sI", "s", "S"]:
            validar_nuevo_juego = True
            break
        elif ciclo in ["n","N","No","no","nO","NO","not"]:
            print("Gracias por jugar conmigo! ")
            validar_nuevo_juego = False
            sys.exit()
            break
        else:
            print("Entrada incorrecta, intentalo nuevamente, ")
    if validar_nuevo_juego:
        print("\n",10*" ","__________SIGUIENTE PARTIDA!!!!__________")
        juego_fuente()
    else:
        return False

# Chequea los jugadores, mediante las combinaciones establecidas por las reglas de tres en raya, las cuales son
# que tres fichas del mismo jugador esten en forma horizontal, vertical, o diagonal, realizamos una lista la cual
# estara albergada en la variable ganador_lugar, la cual vamos a iterar con un bucle for para recorrer cada una de las
# posiciones que tenga dentro, si dentro de la lista pizarra la casilla_ganadora, 0, 1 y 2 tomaran el valor de X o O
# para con un ultimo chequeo igualar si estas cuatro variables son iguales, encontraremnos un ganador y continuaremos
# con la siguiente funcion del juego, la cual seria jugar_de_nuevo()
# Cabe destacar que casilla, ganadora sera una lista que albergara las posicion ganadora, por ejemplo [1,5,9], que serian
# mismas que encontraremos en la variable ganador_lugar.
def chequear_ganador(jugador_1, jugador_2):
    ganador_lugar = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
    for casilla_ganadora in ganador_lugar:
        if pizarra[casilla_ganadora[0]] == pizarra[casilla_ganadora[1]] == pizarra[casilla_ganadora[2]] == jugador_1:
            jugador_1 = jugador_1.upper()
            print(10*" ",17*"-",f"{jugador_1} GANASTE!",17*"-","\n")
            if not jugar_de_nuevo():
                return False
        elif pizarra[casilla_ganadora[0]] == pizarra[casilla_ganadora[1]] == pizarra[casilla_ganadora[2]] == jugador_2:
                jugador_2 = jugador_2.upper()
                print(10*" ",17*"-",f"{jugador_2} GANASTE!",17*"-","\n")
                if not jugar_de_nuevo():
                    return False
    if " " not in pizarra:
        jugador_1 = jugador_1.upper()
        jugador_2 = jugador_2.upper()
        print(10*" ",14*"-",f"{jugador_1} y {jugador_2} han empatado",12*"-","\n")
        if not jugar_de_nuevo():
            return False
    return True

# Define la funcion que nos ayudara a elegir el modo de juego y el nombre de los 
# jugadores 
def ficha_jugador(modo):
    jugador_1 = input("\n-------Jugador 1, indicame tu nombre-----  ")
    jugador_1 = jugador_1.upper()
    if (modo == "1"):
        jugador_2 = input("\n-------Jugador 2, indicame tu nombre-----  ")
        jugador_2 = jugador_2.upper()
    else:
        jugador_2 = "CPU"
    while True:
        ficha_elegida = input(f"{jugador_1} Indica, cual sera tu ficha, X o O ")
        if ficha_elegida in ["x" , "X"]:
            print(50*"-")
            print(f"{jugador_1} tu opcion fue la X. (JUEGAS PRIMERO)")
            print(35*"-")
            print(f"{jugador_2} tu juegas con la O.")
            print(20*"-")
            return "x","o"
        elif ficha_elegida in ["O","o"]:
            print(50*"-")
            print(f"{jugador_1} tu opcion fue la O.")
            print(35*"-")
            print(f"{jugador_2} tu juegas con la X. (JUEGAS PRIMERO)")
            print(50*"-")
            return "o","x"
        else:
            print(f"{jugador_1} indica una de las fichas X o O!\n")


# Funcion Modo de juego, aplica un bucle while que se encarga de pedir la opcion correcta,
# cuando la variable modo no sea 1,2,3,4 este entra en un bucle pidiendo el modo de juego
# correcto que se encuentra en 1,2,3,4.
def modo_de_juego():
    print("\nBienvenido a TRIKI (Tres en raya)\n\nElija el modo de juego:\n\n [1] Vs otro Jugador\n [2] VS Cpu Dificil\n [3] VS Cpu Medio\n [4] VS Cpu Facil");
    modo = input ("Modo de juego: ")
    while modo not in ["1","2","3","4"]:
        print("Modo de juego desconocido")
        print("Elija el modo de juego:\n [1] Vs otro Jugador\n [2] VS Cpu Dificil\n [3] VS Cpu Medio\n [4] VS Cpu Facil")
        modo = input ("Modo de juego: ")
    return modo

# Indica el modo de juego y lo contiene en una sola variable llamada modo la cual utilizaremos como
# variable para acceder a los diferentes modos del juego
modo=modo_de_juego()

# entra en las funciones para indicar el jugador y la ficha
jugador_1,jugador_2=ficha_jugador(modo)

# La funcion Juego_fuente(), se encarga de albergar la gran mayoria de funciones y variables
# que permiten el verdadero funcionamiento del juego, por ejemplo, que necesitamos para
# inicializar el juego, que ficha juega primero, que ficha juega despues, en que modo se
# encuentra esa ficha, que debe imprimir y en que momento debe hacerlo, cuando agregar los
# valores para "X" o "O"
def juego_fuente():
    # ---------------Variables global---------------#
    global pizarra
# La variable jugar se inicializa con un True esperando cambiar al False cuando el juego acaba
    jugar=True

# Pizarra es una lista, la cual contendra los valores de X y O, pizarra tambien puede ser usada
# asociar valores directamente como un diccionario que alberga pares y elementos, ejemplo: {1:" "}
# y utilizar el metodo .keys para examinar cada uno de ellos por separado.
# Pero a modo practico utilizare cada uno de los valores de pizarra como una lista individual para
# asociada a la variable pizarra, ejemplo: pizarra[6]
    pizarra=[""," "," "," "," "," "," "," "," "," "]

# Funcion que dibuja la pizarra, sin incluir la variable pizarra dentro, ya que indica posicion.
    dibujar_pizarra()

# Un bucle while que inicia como verdadero, esperando que cambie la variable jugar a false para
# acabar con el bucle
    while jugar:
        if jugador_1 == "x":

# La variable entrada_jugador(jugador_1) sera igual a la posicion elegida por el jugador
# "X" la cual se almacenara en X, que su vez sera verificada por la pizarra[x] y cambiara
# su valor por la ficha X en cuestion almacenandola en la variable pizarra, sustituyendo el
# la cadena vacia por la X, siguiendo con la funcion dibujar pizarra el cual iniciara un nuevo
# bucle que dibujara ahora la jugada efectuada por el jugador X, chequeando si hay algun ganador
# permitiendo retornar un valor True o False, que espera el cambio de booleano por parte, de
# cualquiera de las funciones chequear ganador,perdedor,empate que se han realizado.
            x = entrada_jugador(jugador_1)
            pizarra[x] = jugador_1
            dibujar_pizarra()
            jugar = chequear_ganador(jugador_1 , jugador_2)
            print(10*" ",15*"-",f"X ELIGIO {x}",15*"-")

# Basicamente todas las funciones a partir de este punto, realizan la funcion contraria de
# la eleccion que haya tomado el jugador_1, el jugador con la ficha restante espera la entrada,
# este la almacena en pizarra, convirtiendo el numero en cuestion en la ficha que corresponde
# en esa jugada, en este caso la ficha "O" y realiza el mismo procedimiento que las ya explicadas
# en el comentario anterior. 
# Cabe destacar que se cumplen un caracteristica diferente en este parte la cual es que si hemos
# elegido el modo 1, tendremos la oportunidad de ingresar los datos manualmente, pero si hemos
# elegido la opcion del 2 al 4, estaremos en presencia de una eleccion que elegira los siguientes
# movimientos, por ende necesitamos mas datos para que efectue su proximo paso.
            if jugar and modo == "1":
                o = entrada_jugador(jugador_2)
                pizarra[o] = jugador_2
                dibujar_pizarra()
                print(10*" ",15*"-",f"O ELIGIO {o}",15*"-")

# Si tu opcion es jugar contra la cpu, la opcion_cpu valorara mas variables para su ejecucion
# las cuales estan determinadas en cada de sus Funciones, pero basicamente, evalua la pizarra,
# para saber en donde tiene posiciones vacias, jugador_1 para saber las posibles combinaciones
# de bloqueo y jugador_2 que es la misma cpu que evalua las posibles jugadas ganadoras. Todo
# esto se explica mucho mejor en cada de las funciones que albergan cada una de las variables
# del resto, sigue el mismo patron del modo anterior.
            elif jugar and modo == "2":
                o = opcion_cpu_1(jugador_2 , jugador_1 , pizarra)
                pizarra[o] = jugador_2
                dibujar_pizarra()
                jugar = chequear_ganador(jugador_1 , jugador_2)
                print(10*" ",15*"-",f"O ELIGIO {o}",15*"-")
# Aplicamos un elif para que se cumpla una funcion y olvide el resto de condicionales.
            elif jugar and modo == "3":
                o = opcion_cpu_2(jugador_2 , jugador_1 , pizarra)
                pizarra[o] = jugador_2
                dibujar_pizarra()
                jugar = chequear_ganador(jugador_1 , jugador_2)
                print(10*" ",15*"-",f"O ELIGIO {o}",15*"-")
# Aplicamos un elif para que se cumpla una funcion y olvide el resto de condicionales.
            elif jugar and modo == "4":
                o = opcion_cpu_3(jugador_2 , jugador_1 , pizarra)
                pizarra[o] = jugador_2
                dibujar_pizarra()
                jugar = chequear_ganador(jugador_1 , jugador_2)
                print(10*" ",15*"-",f"O ELIGIO {o}",15*"-")
# Si la opcion del jugador_1 = "O" aplica los mismo criterios pero al contrario, ya jugador_1
# no seria la "X" si no la "O"
        else:
            if jugador_1 == "o" and modo == "1":
                x = entrada_jugador(jugador_2)
                pizarra[x] = jugador_2
                dibujar_pizarra()
                jugar = chequear_ganador(jugador_1, jugador_2)
                print(10*" ",15*"-",f"X ELIGIO {x}",15*"-")
                if jugar:
                    o = entrada_jugador(jugador_1)
                    pizarra[o] = jugador_1
                    dibujar_pizarra()
                    jugar = chequear_ganador(jugador_1, jugador_2)
                    print(10*" ",15*"-",f"O ELIGIO {o}",15*"-")
# Utilizamos una condicional en cada uno de los modos para que se inicien por dependiendo de las 
# variables que pide como por ejemplo que el modo sea igual a un numero en especifico.
            if jugador_1 == "o" and modo == "2":
                x = opcion_cpu_1(jugador_2,jugador_1, pizarra)
                pizarra[x] = jugador_2
                dibujar_pizarra()
                jugar = chequear_ganador(jugador_1, jugador_2)
                print(10*" ",18*"-",f"X CPU ELIGIO {x}",18*"-")
                if jugar:
                    o = entrada_jugador(jugador_1)
                    pizarra[o] = jugador_1
                    dibujar_pizarra()
                    jugar = chequear_ganador(jugador_1, jugador_2)
                    print(10*" ",15*"-",f"O ELIGIO {o}",15*"-")
            
            if jugador_1 == "o" and modo == "3":
                x = opcion_cpu_2(jugador_2,jugador_1, pizarra)
                pizarra[x] = jugador_2
                dibujar_pizarra()
                jugar = chequear_ganador(jugador_1, jugador_2)
                print(10*" ",14*"-",f"X CPU ELIGIO {x}",14*"-")
                if jugar:
                    o = entrada_jugador(jugador_1)
                    pizarra[o] = jugador_1
                    dibujar_pizarra()
                    jugar = chequear_ganador(jugador_1, jugador_2)
                    print(13*" ",15*"-",f"O ELIGIO {o}",15*"-")
            
            if jugador_1 == "o" and modo == "4":
                x = opcion_cpu_3(jugador_2,jugador_1, pizarra)
                pizarra[x] = jugador_2
                dibujar_pizarra()
                jugar = chequear_ganador(jugador_1, jugador_2)
                print(10*" ",14*"-",f"X CPU ELIGIO {x}",14*"-")
                if jugar:
                    o = entrada_jugador(jugador_1)
                    pizarra[o] = jugador_1
                    dibujar_pizarra()
                    jugar = chequear_ganador(jugador_1, jugador_2)
                    print(13*" ",15*"-",f"O ELIGIO {o}",15*"-")

# Un modulo puede definir funciones, clases y variables.Entonces, cuando el intérprete ejecuta
# un módulo, la variable __name__ se establecerá como __main__ si el módulo que se está ejecutando
# es el programa principal, en este caso como mi programa ejecuta los modulos desde el mismo programa
# principal su __name__ es igual al __main__ y no ha otro modulo que se encuentre fuera del programa
# principal. Es necesario colocarlo para el correcto funcionamiento del programa
if __name__ == "__main__":
    juego_fuente()
