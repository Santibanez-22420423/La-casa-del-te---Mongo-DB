--Restricciones tabla trabajadores-----------------------------------------------------------------------------------------------------------------------------
ALTER TABLE trabajadores
ADD CONSTRAINT unique_trabajadores_celular UNIQUE(celular);

ALTER TABLE trabajadores
ADD CONSTRAINT pk_trabajadores_id_trabajador PRIMARY KEY (id_trabajador);

EXEC sp_helpconstraint trabajadores;

-- Modificaciones de la tabla trabajadores-------------------------------------------------------------------------------------------------------------------------------------------------
ALTER TABLE trabajadores
ADD correo VARCHAR(50) NULL;

ALTER TABLE trabajadores
ADD contraseña VARCHAR(50) NULL;

--Restricciones tabla jornadas---------------------------------------------------------------------------------------------------------------------------------------------
ALTER TABLE jornadas
ADD CONSTRAINT pk_jornadas_id_jornada PRIMARY KEY (id_jornada);

ALTER TABLE jornadas
ADD CONSTRAINT chk_jornadas_id_jornada CHECK (id_jornada = 1 OR id_jornada = 2);

EXEC sp_helpconstraint jornadas;

--Restricciones tabla trabajadores_jornadas-----------------------------------------------------------------------------------------------------------------------------------
ALTER TABLE trabajadores_jornadas
ADD CONSTRAINT pk_trabajadores_jornadas_id_trabajador_jornada PRIMARY KEY (id_trabajador_jornada);

ALTER TABLE trabajadores_jornadas
ADD CONSTRAINT fk_trabajadores_jornadas_id_trabajador FOREIGN KEY (id_trabajador) REFERENCES trabajadores (id_trabajador);

ALTER TABLE trabajadores_jornadas
ADD CONSTRAINT fk_trabajadores_jornadas_id_jornada FOREIGN KEY (id_jornada) REFERENCES jornadas (id_jornada);

EXEC sp_helpconstraint trabajadores_jornadas;

DROP TABLE trabajadores_jornadas;

--Restricciones tabla clasificaciones----------------------------------------------------------------------------------------------------------------------------------
ALTER TABLE clasificaciones
ADD CONSTRAINT pk_clasificaciones_id_clasificacion PRIMARY KEY (id_clasificacion);

DROP TABLE clasificaciones;

EXEC sp_helpconstraint clasificaciones;

--Restricciones tabla proveedores----------------------------------------------------------------------------------------------------------------------------------
ALTER TABLE proveedores
ADD CONSTRAINT unique_proveedores_celular UNIQUE(celular);

ALTER TABLE proveedores
ADD CONSTRAINT pk_proveedores_id_proveedor PRIMARY KEY (id_proveedor);

DROP TABLE proveedores;

EXEC sp_helpconstraint proveedores;

--Restricciones tabla compras --------------------------------------------------------------------------------------------------------------------------------------------------
ALTER TABLE compras
ADD CONSTRAINT pk_compras_id_compra PRIMARY KEY (id_compra);

ALTER TABLE compras
ADD CONSTRAINT fk_compras_id_proveedor FOREIGN KEY (id_proveedor) REFERENCES proveedores(id_proveedor);

DELETE FROM compras;

DROP TABLE compras;

EXEC sp_helpconstraint compras;

--Modificaciones tabla compras--------------------------------------------------------------------------------------------------------------------------------------------------------------
ALTER TABLE compras
ADD metodo_pago VARCHAR(20);

ALTER TABLE compras
ADD fecha_entrega DATE;

--Restricciones tabla productos-----------------------------------------------------------------------------------------------------------------------------------------------------
ALTER TABLE productos
ADD CONSTRAINT pk_productos_id_producto PRIMARY KEY (id_producto);

ALTER TABLE productos
ADD CONSTRAINT fk_productos_id_clasificacion FOREIGN KEY (id_clasificacion) REFERENCES clasificaciones (id_clasificacion);

ALTER TABLE productos
ADD CONSTRAINT chk_productos_existencia CHECK (existencia >= 0);

ALTER TABLE productos
ADD CONSTRAINT fk_productos_id_proveedor FOREIGN KEY (id_proveedor) REFERENCES proveedores (id_proveedor);

ALTER TABLE productos
ADD CONSTRAINT fk_productos_id_lote FOREIGN KEY (id_lote) REFERENCES lotes (id_lote);

EXEC sp_helpconstraint productos;

--Modificaciones tabla productos-------------------------------------------------------------------------------------------------------------------------------------------------
ALTER TABLE productos
ADD ganancia INTEGER;

ALTER TABLE productos
ADD id_lote INTEGER;

ALTER TABLE productos
ADD id_proveedor INTEGER;

ALTER TABLE productos
ADD precio MONEY;

--Restricciones tabla clientes------------------------------------------------------------------------------------------------------------------------------------
alter table clientes
add constraint pk_clientes_id_cliente primary key (id_cliente);

alter table clientes
add constraint unique_clientes_celular unique(celular);

delete from clientes;

drop table clientes;

exec sp_helpconstraint clientes;

--Modificaciones tabla clientes------------------------------------------------------------------------------------------------------------------------------------------------
alter table clientes
add descuento integer;

--Restricciones tabla productos_compras------------------------------------------------------------------------------------------------------------------------------------
alter table productos_compras
add constraint pk_productos_compras_id_producto_compra primary key (id_producto_compra);

alter table productos_compras
add constraint fk_productos_compras_id_producto foreign key (id_producto) references productos (id_producto);

alter table productos_compras
add constraint fk_productos_compras_id_compra foreign key (id_compra) references compras (id_compra);

alter table productos_compras
add constraint chk_productos_compras_cantidad check (cantidad >= 0);

drop table productos_compras;

exec sp_helpconstraint productos_compras;

--Restricciones table ventas------------------------------------------------------------------------------------------------------------------------------------------------------------------
alter table ventas
add constraint pk_ventas_id_venta primary key (id_venta);

alter table ventas
add constraint fk_ventas_id_trabajador foreign key (id_trabajador) references trabajadores (id_trabajador);

alter table ventas
add constraint fk_ventas_id_cliente foreign key (id_cliente) references clientes (id_cliente);

alter table ventas
add constraint df_ventas_fecha DEFAULT (cast(getdate() as date)) for fecha;

exec sp_helpconstraint ventas;

--Modificaciones tabla ventas-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
alter table ventas 
add metodo_pago varchar(20);


--Restricciones tabla productos_ventas-------------------------------------------------------------------------------------------------------------------------------
alter table productos_ventas
add constraint pk_productos_ventas_id_producto_venta primary key (id_producto_venta);

alter table productos_ventas
add constraint fk_productos_ventas_id_producto foreign key (id_producto) references productos (id_producto);

alter table productos_ventas
add constraint fk_productos_ventas_id_venta foreign key (id_venta) references ventas (id_venta);

alter table productos_ventas
add constraint chk_productos_ventas_cantidad check (cantidad >= 0);

exec sp_helpconstraint productos_ventas;

--Modificaciones tabla productos_ventas--------------------------------------------------------------------------------------------------------------------------------------------------
alter table productos_ventas
add descuento_porcentaje integer

alter table productos_ventas
add descuento_pesos money

alter table productos_ventas
add subtotal_con_descuento money 

alter table productos_ventas
alter column unitario money;

--Restricciones tabla devoluciones_compras------------------------------------------------------------------------------------------------------------------------------------------------------------
alter table devoluciones_compras
add constraint pk_devoluciones_compras_id_devolucion_compra primary key (id_devolucion_compra);

alter table devoluciones_compras
add constraint fk_devoluciones_compras_id_compra foreign key (id_compra) references compras (id_compra);

alter table devoluciones_compras
add constraint fk_devoluciones_compras_id_producto foreign key (id_producto) references productos (id_producto);

alter table devoluciones_compras
add constraint chk_devoluciones_compras_cantidad check (cantidad >= 0);

exec sp_helpconstraint devoluciones_compras;

alter table devoluciones_compras
add subtotal money;

--Restricciones tabla lotes---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
ALTER TABLE lotes
ADD CONSTRAINT pk_lotes_id_lote PRIMARY KEY (id_lote);

EXEC sp_helpconstraint lotes;

