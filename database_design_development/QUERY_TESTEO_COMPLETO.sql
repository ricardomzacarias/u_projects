###################################### TESTEO ####################################################

############### TABLA AGRICULTOR ###################
-- testeo agricultor
# testeamos la tabla agricultor, insertando y borrando elementos 
select * from agricultor; 
insert into agricultor(nombre,cooperativa) values ("fernando", "si");
insert into agricultor(nombre,cooperativa) values ("joselito", "no");
insert into agricultor(nombre,cooperativa) values ("wanton", "no");
# borrado
delete from agricultor where id_agricultor="8";
# actualizacion 
update agricultor set nombre="saxon" where id_agricultor="9";

################### TABLA OLIVO #######################
-- testeo tabla olivo
select * from olivo;
# insertar 
insert into olivo(nombre) values ("olivo_super");
# borrado
delete from olivo where id_olivo="6";
# actualizacion
update olivo set nombre="olivo_su" where id_olivo="6";

-- ############## TESTEO TABLA CLIENTE ################
# testeo tabla cliente  
# insert into () values ("");
# delete from where id_="6";
# update set nombre="olivo_su" where id_="";

select * from cliente;
# insertar valores
insert into cliente(razon_social, cooperativa) values ("mallorca","si");
# borrado
delete from cliente where id_cliente="5";
# actualizamos 
update cliente set razon_social="mallorcasa" where id_cliente="6";

-- ############### TESTEO TABLA ALMACEN ####################

select * from almacen;
# insertamos los valores correspondientes al almacen
insert into almacen(cantidad_kgs,destino,id_agricultor,id_olivo) values (3000,"almacen",1,2);
# insertamos los valores correspondientes al prensado
insert into almacen(cantidad_kgs,destino,id_cuba,id_olivo) values (1000,"prensado",1,1);
# actualizamos
update almacen set cantidad_kgs=1500 where ref_almacen="15";

/* El borrado no esta permitido en esta tabla para verificar los datos correctamente
las llaves foreaneas mantienen informacion en sus respectivas tablas, (entrada_almacen y prensado) 
si se quiere borrar, algun elemento debe borrarse desde la llave foreanea.*/

/* la base de datos cuenta con triggers o disparadores que permiten un manejo mas comodo a la hora de
ingresar los datos, pero se debe seguir cierto patron a la hora del mismo, por ejemplo la tabla almacen
esta dividida en dos sectores, el almacen y el prensado. cuando se requiera ingresar valores positivos al 
almacen, debe llenarse la cantidad_kgs, destino ("almacen"), el agricultor que trajo los olivos, para el
prensado, se utilizan los campos de cantidad_kgs(que salen), destino(prensado), id_olivo y la cuba a la cual
sera destinada este prensado*/

select * from prensado;
select * from entrada_almacen;
select * from almacen;
select * from cubas_basica;

-- consultar la cantidad olivos que existe en el almacen, en cada momento

select * from almacen;
# saber la cantidad total del almacen
select sum(cantidad_kgs) as total_almacen from almacen;
# saber la cantidad por tipo olivo
select sum(cantidad_kgs) as tipo_olivo_kgs from almacen where id_olivo="1";
select sum(cantidad_kgs) as tipo_olivo_kgs from almacen where id_olivo="2";
# saber la cantidad que entro en un mes especifico
select sum(cantidad_kgs) as enero_total from almacen 
where fecha_actualizacion between "2023-01-01" and "2023-01-31";
select sum(cantidad_kgs) as febrero from almacen 
where fecha_actualizacion between "2023-02-01" and "2023-02-31";
# saber el porcentaje de llenado del almacen
select sum(cantidad_kgs/20000)*100 as porcentaje from almacen;
# saber si el agricultor es de la cooperativa o no en cada movimiento que realiza en el almacen
select a.ref_almacen, a.id_agricultor,ag.nombre,ag.cooperativa from almacen a 
left join agricultor ag on a.id_agricultor=ag.id_agricultor 
where ag.cooperativa="si"
group by a.ref_almacen, a.id_agricultor,ag.nombre,ag.cooperativa;
# cooperativa="no"
select a.ref_almacen, a.id_agricultor,ag.nombre,ag.cooperativa from almacen a 
left join agricultor ag on a.id_agricultor=ag.id_agricultor 
where ag.cooperativa="no"
group by a.ref_almacen, a.id_agricultor,ag.nombre,ag.cooperativa;
# saber la cantidad que va al prensado
select sum(cantidad_kgs*-1) total_prensado from almacen where destino="prensado";
# saber la cantidad de prensado este mes
select sum(cantidad_kgs*-1) total_prensado from almacen 
where destino="prensado" and fecha_actualizacion 
between "2023-01-01" and "2023-01-31";
# saber la cantidad de prensado por mes y tipo de olivo 
select sum(cantidad_kgs*-1) total_prensado from almacen 
where destino="prensado" and id_olivo="1" and fecha_actualizacion 
between "2023-01-01" and "2023-01-31";

################## TESTEO TABLA VENTAS ###############
SELECT * FROM VENTAS;
select * from recetas;
select * from cliente;
# insertamos valores en la tabla
insert into ventas(id_receta, id_cliente, cantidad_lts) values (1,1,1000);
# borramos valores en la tabla
delete from ventas where id_ventas="1";
# actualizamos
update ventas set id_receta="2" where id_ventas="2";
update ventas set id_cliente="2" where id_ventas="2";
# consultamos que cliente compro o cual receta compro
select * from ventas v left join cliente c on v.id_cliente=c.id_cliente;
select v.id_ventas,v.cantidad_lts,c.razon_social 
from ventas v left join cliente c on v.id_cliente=c.id_cliente;
# consultamos si la venta fue realizada por una cooperativa(asociado)
select v.id_ventas,v.cantidad_lts,c.razon_social 
from ventas v left join cliente c on v.id_cliente=c.id_cliente
where cooperativa="si";

###################### TABLA RECETAS ##################
# insert into () values ("");
# delete from where id_="6";
# update set nombre="olivo_su" where id_="";
select * from recetas ;
# insertamos elementos en la tabla
insert into recetas(caracteristicas,olivos_usados) values ("10% / 90%", "picual,cornibranca");
# borramos 
delete from recetas where id_recetas="5";
# actualizamos 
update recetas set caracteristicas=("20% / 80%") where id_recetas="6";
# intentamos borrar una receta que tiene una venta 
# (al realizar una foreign key y estar asociada,
# no deja realizar el borrado) 
delete from recetas where id_recetas="2";
# queremos saber que clientes han comprado aceites con recetas
select v.cantidad_lts,c.razon_social from ventas v
left join cliente c on v.id_cliente=c.id_cliente 
where id_receta is not null; 
# queremos saber que clientes han comprado aceites sin recetas
select v.cantidad_lts,c.razon_social from ventas v
left join cliente c on v.id_cliente=c.id_cliente 
where id_receta is null; 
# una problematica que le cliente nos presentan es que no se borren, las recetas que tengan
# ventas el error que arroja nos indica que por medio de una par entre primary key o foreign key 
# no puede borrarse el producto 
# Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint
delete from recetas where id_recetas="1";


################### TABLA CUBA_BASICA #############################

/* La tabla cuba_basica cuenta con disparadores que vienen desde la tabla prensado, pero eso no quiere
decir que la tabla no pueda llenarse manualmente. Tendremos en cuenta que por cada vez que se realize
un prensado tendremos una referencia de prensado, que no esta vinculada a la tabla cuba_basica, pero
que si deberiamos tener en cuenta, ya que por cada prensado una cantidad de litros saldran de la misma
y esta cantidad, sera llevada a la tabla cuba_basica, en la entrada capacidad_actual, donde realiza una
sumatoria de todas las veces que se realiza un prensado y se va aumentando sin necesidad de querys, pero
esta puede ser alterada sin problemas con una query (solo se busca integridad referencia y que los valores
correspondan). La tabla cuenta con formulas que se generan automaticamente con solo realizar una entrada.
por ejemplo capacidad_restante es la resta de capacidad_total y capacidad_actual, el porcentajes es la formula
de capacidad_total y capacidad_actual multiplicada por 100 y dividida entre capacidad_total. La capacidad_total
son valores fijos.  */
select * from cubas_basica; 
# insertamos valores
insert into cubas_basica(id_cuba,capacidad_total,capacidad_actual) value (5,3000,1000);
# actualizamos 
update cubas_basica set capacidad_actual="3000" where id_cuba="3";
# borramos
delete from cubas_basica where id_cuba="5";
# una de las exigencias de nuestro cliente es que 
# las cubas no pueden ser llenadas
# de un aceite diferente, a menos que la cuba este vacia. 
# se recuelve mediante la siguiente query
update cubas_basica set capacidad_actual="5000" 
where id_cuba="4" and porcentaje_llenado="0";
select * from cubas_basica;
# el olivo debe ser igual al tipo de olivo que se use en la cuba de lo contrario no puede llenarse la cuba
update cubas_basica set capacidad_actual="500" 
where id_cuba="2" and porcentaje_llenado<=0 and id_olivo_usado="1" ;
# probamos un caso donde el tipo de olivo no sea el seleccionado en la cuba
# respuesta: 0 row(s) affected Rows matched: 0  Changed: 0  Warnings: 0
update cubas_basica set capacidad_actual="2500" 
where id_cuba="2" and porcentaje_llenado<=0 and id_olivo_usado="2" ;
# probamos una caso donde el porcentaje sea igual al 100%, por lo tanto 
# la cuba esta llena y no podra actualizarse
select * from cubas_basica;
update cubas_basica set capacidad_actual="5000" 
where id_cuba="2" and porcentaje_llenado>0 
and porcentaje_llenado<=100 and id_olivo_usado=1;
# realizamos una prueba con la capacidad restante, que nos permitira saber 
# si hemos sobrepasado el limite
# de llenado de las cubas, si el limite es sobrepasado no realizara 
# ningun cambio en la base de datos
select * from cubas_basica;
update cubas_basica set capacidad_actual="3000" 
where id_cuba="3" and porcentaje_llenado>=0 and porcentaje_llenado<=100
and id_olivo_usado="1" and capacidad_restante>=0;
/* la query que nos ayudara a realizar la verificacion exacta de todos los requerimientos 
del cleinte seria esta ultima, ya que si el porcentaje de llenado es igual o mayor que 0, puede
continuar, si porcentaje de llenado es menor o igual a 100 puede continuar y si la capacidad restante
es mayor o igual a 0 ejecuta la query, cabe destacar que tambien se aplica la condicion de si el 
olivo es el mismo que tiene la cuba, dejando todas las posibilidades de llenado completas.
la query recibio varios testeos sin necesidad de colocarlos todos en la tabla, pero se dejara un apartado
donde se explique cada proceso por separado y algunos ocasiones mas*/

####################### TABLA CUBA_MIX #########################

/* la tabla cuba_mix depende enteremanete de los valores que pueden ser sacados de la tabla cubas_basica
por lo tanto si se quiere realizar un llenado de la cuba_mix se tendra que tomar los datos de la cuba_basica
realizar la mezcla correspondiente dependiendo del llenado que se le quiera dar. Las tablas no estan 
relacionadas en el modelo, por desicion del mismo programador, los valores que se tengan que retirar de 
la cuba_basica tendran que realizarse a mano sin ningun tipo de trigger (disparador) y ningun tipo de la relacion
de foreign keys y primary keys. Las tablas estan totalmente desvinculadas en cuanto al modelo. Lo que
nos ayuda a realizar pruebas e ingresar los valores mediante recetas y no un proceso automatico que pueda
afectar el resultado de cualquiera de las dos tablas. el id_receta = significa que no existen recetas (para mantener
una llave de conexion con el id_recetas)*/

select * from cuba_mix;
select * from recetas;
# insertamos valores 
insert into cuba_mix(capacidad_total,capacidad_actual,id_recetas) values (3000,0,2);
# actualizamos valores
update cuba_mix set id_recetas="0" where id_cuba_mix in ("1","2");
# borramos
delete from cuba_mix where id_cuba_mix="2";

####################### ENTRADA_ALMACEN #########################

select * from entrada_almacen ;

/* la entrada_almacen nos realiza una referencia directa entre el agricultor y el almacen, cada vez que el almacen
sea actualizado por una entrada del agricultor, un trigger en almacen enviara los datos correspondientes a la referencia
lo que mantendra una referencia integral de cada movimiento que realize nuestro agricultor con el almacen. Es una tabla
de solo lectura y que solo podra ser modificada en cascada desde el almacen.*/

####################### PRENSADO #########################

select * from prensado;

/* una tabla de solo lectura que se comporta de igual forma a nuestra tabla de entrada_almacen, podemos decir que
es la referencia de integridad que se mantiene en el almacen, ya que cada envio que se realize desde el almacen, 
sera enviado a nuestra tabla prensado. el cual realizara los calculos pertinentes y enviara a nuestra tabla cuba_basica
los datos que necesita (cantidad_lts) la cual se actualizara mediante un trigger que fue creado para realizar 
dicha operacion. Una forma de mejorar esta tabla es colocar un orden de referencia como lo fue colocado entre el agricultor
y el almacen, la cual fue llamada entrada_almacen, asi tendriamos una referencia directa de las cubas y las referencias
de prensado, una forma mas visual de realizar todo.*/




