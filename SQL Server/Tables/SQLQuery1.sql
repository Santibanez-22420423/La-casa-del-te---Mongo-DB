CREATE DATABASE	la_casa_del_te;

USE la_casa_del_te;

--Tabla trabajadores-------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE trabajadores(
	id_trabajador INTEGER IDENTITY(1,1),
	nombre VARCHAR(20) NOT NULL,
	apellido VARCHAR(30) NOT NULL,
	fecha_contratacion DATE NOT NULL,
	fecha_despido DATE,
	direccion VARCHAR(50) NOT NULL,
	celular VARCHAR(10) NOT NULL,
	referencias VARCHAR(100)
)

--Tabla jornadas------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE jornadas(
	id_jornada INTEGER NOT NULL,
	hora_inicio TIME(0) NOT NULL,
	hora_fin TIME(0) NOT NULL
)

--Tabla trabajadores_jornadas-----------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE trabajadores_jornadas(
	id_trabajador_jornada INTEGER IDENTITY(1,1) NOT NULL,
	id_trabajador INTEGER NOT NULL,
	id_jornada INTEGER NOT NULL,
	fecha DATE NOT NULL
)

--Tabla clasificaciones---------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE clasificaciones(
	id_clasificacion INTEGER IDENTITY(1,1) NOT NULL,
	nombre VARCHAR(30) NOT NULL,
	descripcion VARCHAR(250)
)

--Tabla proveedores-------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE proveedores(
	id_proveedor INTEGER NOT NULL,
	nombre VARCHAR(50) NOT NULL,
	direccion VARCHAR(90) NOT NULL,
	celular VARCHAR(12) NOT NULL,
)

--Tabla compras---------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE compras(
	id_compra INTEGER IDENTITY(1,1) NOT NULL,
	id_proveedor INTEGER NOT NULL,
	fecha DATE NOT NULL,
)

--Tabla productos-----------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE productos(
	id_producto INTEGER IDENTITY(1,1) NOT NULL,
	id_clasificacion INTEGER NOT NULL,
	nombre VARCHAR(30) NOT NULL,
	existencia INTEGER NOT NULL,
	costo MONEY, 
	precio AS (((costo*40)/100) + costo),
	caracteristicas VARCHAR(100)
)

--Tabla clientes-----------------------------------------------------------------------------------------------------------------------------------------------------
create table clientes(
	id_cliente integer identity(1,1) not null,
	nombre varchar(20) not null,
	apellido varchar(30) not null,
	direccion varchar(50) not null,
	celular varchar(10) not null,
)

--Tabla productos_compras-------------------------------------------------------------------------------------------------------------------------------------------------
create table productos_compras(
     id_producto_compra integer identity(1,1),
	 id_compra integer not null,
	 id_producto integer not null,
	 cantidad integer not null,
	 unitario integer,
	 subtotal money
)

SELECT * FROM productos_compras;

--Tabla ventas---------------------------------------------------------------------------------------------------------------------------------------------------------------
create table ventas(
    id_venta integer identity(1,1) not null,
	id_cliente integer not null,
	id_trabajador integer not null,
	fecha date not null
)

--Tabla productos_ventas-------------------------------------------------------------------------------------------------------------------------------------------------------------
create table productos_ventas(
     id_producto_venta integer identity(1,1),
	 id_venta integer not null,
	 id_producto integer not null,
	 cantidad integer not null,
	 unitario integer,
	 subtotal money
)

--Tabla devoluciones_compras-----------------------------------------------------------------------------------------------------------------------------------------------------------------
create table devoluciones_compras(
	id_devolucion_compra integer identity(1,1) not null,
	id_compra integer not null,
    id_producto integer not null,
	fecha date not null,
	cantidad integer not null,
	unitario integer,
	subtotal money,
)

SELECT * FROM devoluciones_compras;

--Tabla lotes.----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE lotes(
	id_lote INTEGER IDENTITY(1,1) NOT NULL,
	fecha_lote DATE NOT NULL,
	caducidad DATE NOT NULL
)
