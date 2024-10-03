<h1 align="center">MODELO DE NEGOCIO DE UNA EMPRESA DE ACEITE DE OLIVA</h1>

> `Explicaremos los detalles de nuestro codigo y como podemos adaptarlo a un modelo de negocios.`

<h1 align="center">INSTALACION</h1>
Dependera mucho de los sistemas operativos que utilices, sin embargo te dejo una pequeña guia en los que fue testeado este sistema

<h2>Linux</h2>


<h2>Windows</h2>


<h1 align="center">DISEÑO DE ALMACEN</h1>

![diseño almacen](images/diseno_almacen.png)

<h1 align="center">DISEÑO DE VENTAS</h1>

![diseño almacen](images/diseno_ventas.png)

<h1 align="center">CREACION DE LA BASE DE DATOS</h1>

<h2>CREANDO EL SCRIPT</h2>

> Lo recomendable es realizar la base de datos desde el mismo workbench, si no tienes experiencia, pero tambien puede realizarse a mano, dejo un script donde se ve el contenido de la misma. En mi caso particular, la he creado con workbench pero editado por mi propia cuenta para agregar parametros adicionales.

- [Base de datos](https://github.com/ricardomzacarias/u_projects/tree/main/database_design_development/SCRIPT_ACEITES_TARUDO_RICARDO_MARIN_ZACARIAS.sql)
\# ejemplo:
```sql
CREATE TABLE `agricultor` (
`id_agricultor` int NOT NULL AUTO_INCREMENT,
`nombre` varchar(45) DEFAULT NULL,
`cooperativa` enum('si','no') NOT NULL,
PRIMARY KEY (`id_agricultor`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
```

<h2>DESDE WORKBENCH</h2>

<h1 align="center">PRUEBAS</h1>

Podemos dividir las pruebas en las siguientes:

- Tabla Agricultor
```sql
# Ejemplo
select * from agricultor; 
insert into agricultor(nombre,cooperativa) values ("fernando", "si");
```
- Tabla Olivo
```sql
# Ejemplo
select * from olivo;
insert into olivo(nombre) values ("olivo_super");
```
- Tabla Cliente
```sql
# Ejemplo
select * from cliente;
insert into cliente(razon_social, cooperativa) values ("mallorca","si");
```
- Tabla Almacen
```sql
# Ejemplo
select * from almacen;
insert into almacen(cantidad_kgs,destino,id_agricultor,id_olivo) values (3000,"almacen",1,2);
```
- Tabla Ventas
```sql
# Ejemplo
SELECT * FROM VENTAS;
select * from recetas;
select * from cliente;
insert into ventas(id_receta, id_cliente, cantidad_lts) values (1,1,1000);
```
- Tabla Recetas
```sql
# Ejemplo
select * from recetas ;
insert into recetas(caracteristicas,olivos_usados) values ("10% / 90%", "picual,cornibranca");
```
- Tabla Cuba basica
```sql
# Ejemplo
select * from cubas_basica; 
insert into cubas_basica(id_cuba,capacidad_total,capacidad_actual) value (5,3000,1000);
```
- Tabla Cuba mix
```sql
# Ejemplo
select * from cuba_mix;
select * from recetas;
insert into cuba_mix(capacidad_total,capacidad_actual,id_recetas) values (3000,0,2);
```
- Tabla Entrada a almacen
```sql
# Ejemplo
select * from entrada_almacen ;
```
- Tabla Prensado
```sql
# Ejemplo
select * from prensado;
```

Encontraremos un documento detallado con todos los testeos en: 

- [Testeo](https://github.com/ricardomzacarias/u_projects/tree/main/database_design_development/QUERY_TESTEO_COMPLETO.sql)

<h1 align="center">TRIGGERS</h1>

> Aunque no contamos con bucles `for` en este proyecto (y hasta donde lo se no existen en sql) podemos usar triggers que simulen dicho comportamiento.

```sql
CREATE DEFINER = CURRENT_USER TRIGGER `aceituna_8`.`almacen`
AFTER INSERT ON `almacen` FOR EACH ROW
BEGIN
if new.destino="almacen" then
insert
into
entrada_almacen(ref_entrada,
id_agricultor,fecha_actualizacion)
values (new.ref_almacen, new.id_agricultor,new.fecha_actualizacion);
end if ;
if new.destino="prensado" then
insert into prensado(ref_prensado, cantidad_kgs, fecha_actualizacion,
id_olivo,id_cuba)
values (new.ref_almacen, new.cantidad_kgs*(-1),new.fecha_actualizacion,
new.id_olivo,new.id_cuba);
end if;
END ;
```
