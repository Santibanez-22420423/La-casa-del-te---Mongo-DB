--Registros tabla trabajadores--------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO trabajadores(nombre, apellido, fecha_contratacion, direccion, celular)
VALUES('Jovita lizeth', 'Galvan Rojas', '2022-01-13', 'Dámaso Cárdenas #187, Sahuayo, Michoacán', '3531007723');

INSERT INTO trabajadores(nombre, apellido, fecha_contratacion, direccion, celular)
VALUES('Mitzu Sayin', 'Galvan Rojas', '2023-01-03', 'Dámaso Cárdenas #187, Sahuayo, Michoacán', '3531233538');

INSERT INTO trabajadores(nombre, apellido, fecha_contratacion, direccion, celular)
VALUES('Israel', 'Galvan Rojas', '2023-01-03', 'Dámaso Cárdenas #187, Sahuayo, Michoacán', '3532053638');

INSERT INTO trabajadores(nombre, apellido, fecha_contratacion, direccion, celular)
VALUES('Sofia', 'García Hernández', '2023-04-30', 'Heriberto Jara #485, Sahuayo, Michoacán', '3531234567');

INSERT INTO trabajadores(nombre, apellido, fecha_contratacion, direccion, celular)
VALUES('Juan Pablo', 'López Ramírez', '2022-12-10', 'Avenida Sierra #456, Sahuayo, Michoacán', '3537890123');

INSERT INTO trabajadores(nombre, apellido, fecha_contratacion, direccion, celular)
VALUES('María Fernanda', 'Rodríguez Gómez', '2022-12-28', 'Vicente Guerrero #758, Sahuayo, Michoacán', '3532345678');

INSERT INTO trabajadores(nombre, apellido, fecha_contratacion, direccion, celular)
VALUES('Carlos Eduardo', 'Martínez Sánchez', '2023-05-03', 'Avenida Independencia #568, Sahuayo, Michoacán', '3532456789');

INSERT INTO trabajadores(nombre, apellido, fecha_contratacion, direccion, celular)
VALUES('Ana Karina', 'Velasco Morales', '2023-09-28', 'Vallarta #537, Sahuayo, Michoacán', '3539012345');

INSERT INTO trabajadores(nombre, apellido, fecha_contratacion, direccion, celular)
VALUES('Luis Enrique', 'Álvarez Reyes', '2024-01-23', 'Avenida Lázaro Cárdenas #568, Sahuayo, Michoacán', '3535678901');

INSERT INTO trabajadores(nombre, apellido, fecha_contratacion, direccion, celular)
VALUES('Daniela Alejandra', 'Torres Ortiz', '2024-05-03', 'Calzada Revolución #846, Sahuayo, Michoacán', '3531115897');

--código para actualizar los campos correo y contraseña de nuestros trabajadores.
UPDATE trabajadores SET correo = 'alvarezluen@gmail.com', contraseña = 'LE12345' WHERE id_trabajador = 9;

--Registros tabla jornadas-------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO  jornadas(id_jornada, hora_inicio, hora_fin) VALUES('2', '16:30', '20:00');

INSERT INTO jornadas(id_jornada, hora_inicio, hora_fin) VALUES('1', '9:00', '14:30');

--Registros tabla trabajadores_jornadas-------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO trabajadores_jornadas(id_trabajador, id_jornada, fecha) VALUES (1,1,'2024-09-16');

INSERT INTO trabajadores_jornadas(id_trabajador, id_jornada, fecha) VALUES(3,1,'2024-09-16');

INSERT INTO trabajadores_jornadas(id_trabajador, id_jornada, fecha) VALUES(5,1,'2024-09-16');

INSERT INTO trabajadores_jornadas(id_trabajador, id_jornada, fecha) VALUES(7,1,'2024-09-16');

INSERT INTO trabajadores_jornadas(id_trabajador, id_jornada, fecha) VALUES(9,1,'2024-09-16');

INSERT INTO trabajadores_jornadas(id_trabajador, id_jornada, fecha) VALUES(2,2,'2024-09-16');

INSERT INTO trabajadores_jornadas(id_trabajador, id_jornada, fecha) VALUES(4,2,'2024-09-16');

INSERT INTO trabajadores_jornadas(id_trabajador, id_jornada, fecha) VALUES(6,2,'2024-09-16');

INSERT INTO trabajadores_jornadas(id_trabajador, id_jornada, fecha) VALUES(8,2,'2024-09-16');

INSERT INTO trabajadores_jornadas(id_trabajador, id_jornada, fecha) VALUES(10,2,'2024-09-16');

INSERT INTO trabajadores_jornadas(id_trabajador, id_jornada, fecha) VALUES(1,1,'2024-09-17');

INSERT INTO trabajadores_jornadas(id_trabajador, id_jornada, fecha) VALUES(3,1,'2024-09-17');

INSERT INTO trabajadores_jornadas(id_trabajador, id_jornada, fecha) VALUES(5,1,'2024-09-17');

INSERT INTO trabajadores_jornadas(id_trabajador, id_jornada, fecha) VALUES(7,1,'2024-09-17');

INSERT INTO trabajadores_jornadas(id_trabajador, id_jornada, fecha) VALUES(9,1,'2024-09-17');

INSERT INTO trabajadores_jornadas(id_trabajador, id_jornada, fecha) VALUES(2,2,'2024-09-17');

INSERT INTO trabajadores_jornadas(id_trabajador, id_jornada, fecha) VALUES(4,2,'2024-09-17');

INSERT INTO trabajadores_jornadas(id_trabajador, id_jornada, fecha) VALUES(6,2,'2024-09-17');

INSERT INTO trabajadores_jornadas(id_trabajador, id_jornada, fecha) VALUES(8,2,'2024-09-17');

INSERT INTO trabajadores_jornadas(id_trabajador, id_jornada, fecha) VALUES(10,2,'2024-09-17');

INSERT INTO trabajadores_jornadas(id_trabajador, id_jornada, fecha) VALUES(1,1,'2024-09-18');

INSERT INTO trabajadores_jornadas(id_trabajador, id_jornada, fecha) VALUES(3,1,'2024-09-18');

INSERT INTO trabajadores_jornadas(id_trabajador, id_jornada, fecha) VALUES(5,1,'2024-09-18');

INSERT INTO trabajadores_jornadas(id_trabajador, id_jornada, fecha) VALUES(7,1,'2024-09-18');

INSERT INTO trabajadores_jornadas(id_trabajador, id_jornada, fecha) VALUES(9,1,'2024-09-18');

INSERT INTO trabajadores_jornadas(id_trabajador, id_jornada, fecha) VALUES(2,2,'2024-09-18');

INSERT INTO trabajadores_jornadas(id_trabajador, id_jornada, fecha) VALUES(4,2,'2024-09-18');

INSERT INTO trabajadores_jornadas(id_trabajador, id_jornada, fecha) VALUES(6,2,'2024-09-18');

INSERT INTO trabajadores_jornadas(id_trabajador, id_jornada, fecha) VALUES(8,2,'2024-09-18');

INSERT INTO trabajadores_jornadas(id_trabajador, id_jornada, fecha) VALUES(10,2,'2024-09-18');

UPDATE trabajadores_jornadas SET fecha_inicio = '2024-09-16', fecha_fin = '2024-09-16' WHERE id_trabajador_jornada = 1;

--Registros tabla clasificaciones----------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO clasificaciones(nombre, descripcion)
VALUES('Sistema circulatorio', 'También conocido como sistema cardiovascular, es el sistema responsable de transportar sangre y nutrientes a todas las células del
		y eliminar los desechos.');

INSERT INTO clasificaciones(nombre, descripcion)
VALUES('Sistema cardiovascular', 'Es el sistema responsable de eliminar el dióxido de carbono y desechos, regular la temperatura corporal y mantener la presión arterial.');

INSERT INTO clasificaciones(nombre, descripcion)
VALUES('Sistema nervioso', 'Es el sistema responsable de controlar y coordinar los movimientos voluntarios, registrar y procesar la información sensorial,
		controlar las funciones autónomas (respiración, digestión, circulación), procesar la información emocional y cognitiva.');

INSERT INTO clasificaciones(nombre, descripcion)
VALUES('Sistema respiratorio', 'Es el sistema responsable de intercambiar oxígeno y dióxido de carbono, regular el pH sanguíneo, eliminar dióxido de carbono,
		proporcionar oxígeno a las células.');

INSERT INTO clasificaciones(nombre, descripcion)
VALUES('Sistema inmunológico', 'Es el sistema responsable de proteger al cuerpo contra patógenos, células cancerígenas, tóxinas y agentes extraños.');

--Registros tabla proveedores----------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO proveedores(id_proveedor, nombre, direccion, celular)
VALUES('1', 'El ángel de tu salud', 'C.Ignacio Zaragoza 181, Centro, 44100 Guadalajara, Jalisco', '3336144830');

INSERT INTO proveedores(id_proveedor, nombre, direccion, celular)
VALUES('2', 'Centro Botánico Azteca', 'C. San Felipe 369, Zona Centro, 44100 Guadajalara, Jalisco', '3336585664');

INSERT INTO proveedores(id_proveedor, nombre, direccion, celular)
VALUES('3', 'Grupo Ypenza de México S.A. de C.V.', 'Volcán Quinceo 201, Paraísos del Colli, 45069 Zapopan, Jalisco', '3336204228');

INSERT INTO proveedores(id_proveedor, nombre, direccion, celular)
VALUES('4', 'Dacdaraf', 'C. Ignacio Zaragoza 159, Zona Centro, 44100 Guadalajara, Jalisco', '3336144009');

INSERT INTO proveedores(id_proveedor, nombre, direccion, celular)
VALUES('5', 'Shanaturals', 'Av. Tabachines 3514, Loma Bonita Ejidal, 45085 Zapopan, Jalisco', '3318148007');

--Registros tabla productos------------------------------------------------------------------------------------------------------------------------------------------------
insert into productos (id_clasificacion, nombre, existencia, costo, caracteristicas)
values('1', 'Castaño de indias', '5', '46', '60 cápsulas de 650mg');

insert into productos (id_clasificacion, nombre, existencia, costo, caracteristicas)
values('1', 'No varis', '8', '89', '60 cápsulas de 500mg');

insert into productos (id_clasificacion, nombre, existencia, costo, caracteristicas)
values('1', 'Hemorrostop', '10', '138', '120 cápsulas de 450mg');

insert into productos (id_clasificacion, nombre, existencia, costo, caracteristicas)
values('1', 'Varisalud', '2', '95', '60 tabletas de 500mg');

insert into productos (id_clasificacion, nombre, existencia, costo, caracteristicas)
values('2' , 'Ajo negro', '8', '76', '50 cápsulas de 400mg');

insert into productos (id_clasificacion, nombre, existencia, costo, caracteristicas)
values('2', 'Hierba del sapo', '12', '85', '50 tabletas de 400mg');

insert into productos (id_clasificacion, nombre, existencia, costo, caracteristicas)
values('2', 'Omega 3 Alaska', '10', '250', '100 cápsulas de 1000mg');

insert into productos (id_clasificacion, nombre, existencia, costo, caracteristicas)
values('2', 'Omega 3 premium', '7', '270', '60 cápsulas de 2150mg');

insert into productos (id_clasificacion, nombre, existencia, costo, caracteristicas)
values('3', 'Neo San Juan', '6', '85', '100 cápsulas de 400mg');

insert into productos (id_clasificacion, nombre, existencia, costo, caracteristicas)
values('3', 'Espinoforte', '10', '85', '30 cápsulas de 450mg');

insert into productos (id_clasificacion, nombre, existencia, costo, caracteristicas)
values('3', 'Taflavix', '4', '103', '40 cápsulas');

insert into productos (id_clasificacion, nombre, existencia, costo, caracteristicas)
values('3', 'Valeriana', '8', '53', '50 cápsulas de 450mg');

insert into productos (id_clasificacion, nombre, existencia, costo, caracteristicas)
values('4', 'Vitabronc', '2', '58', '30 cápsulas de 450mg');

insert into productos (id_clasificacion, nombre, existencia, costo, caracteristicas)
values('4', 'Abango', '1', '76', '220 ml');

insert into productos (id_clasificacion, nombre, existencia, costo, caracteristicas)
values('4', 'Guayacol', '7', '80', '30 cápsulas de 650mg');

insert into productos (id_clasificacion, nombre, existencia, costo, caracteristicas)
values('4', 'Eucamiel', '16', '74', '70 ml');

SELECT * FROM productos;
SELECT * FROM lotes;
SELECT * FROM proveedores;

UPDATE productos SET id_lote = 2 WHERE id_producto = 1;

UPDATE productos SET id_proveedor = 1 WHERE id_producto = 1;

--actualizar la ganacia nula de los productos ya registrados
UPDATE productos SET ganancia = 10 WHERE id_producto = 1;

-- actualizar el precio de los productos ya registrados (Ejecutar hasta haber llenado los otros campos y solamente una vez).
UPDATE productos SET precio = costo + costo * ganancia / 100 WHERE id_producto <= 32;

--Registros de la tabla clientes----------------------------------------------------------------------------------------------------------------------------------------
insert into clientes (nombre, apellido, direccion, celular)
values('Juan', 'Pérez García', 'Vicente Guerrero #4587, Sahuayo, Michoacán', '3531489678');

insert into clientes (nombre, apellido, direccion, celular)
values('María', 'Gómez López', 'Heriberto Jara #891, Sahuayo, Michoacán', '3531024876');

insert into clientes (nombre, apellido, direccion, celular)
values('Luis', 'Rodríguez Martínez', 'Constitución #8431, Sahuayo, Michoacán', '3534896510');

insert into clientes (nombre, apellido, direccion, celular)
values('Ana', 'López Sánchez', 'Calzada Revolución #515, Sahuayo, Michoacán', '3531008896');

insert into clientes (nombre, apellido, direccion, celular)
values('Carlos', 'Sánchez Torres', 'Miguel Hidalgo #854, Sahuayo, Michoacán', '3534886951');

insert into clientes (nombre, apellido, direccion, celular)
values('Laura', 'Martínez Fernández', 'California #485, Sahuayo, Michoacán', '3534669751');

insert into clientes (nombre, apellido, direccion, celular)
values('Javier', 'Díaz Castro', 'Avenida de la Paz #456, Sahuayo, Michoacán', '3532269842');

insert into clientes (nombre, apellido, direccion, celular)
values('Sofia', 'Herrera Morales', 'Avenida de los Jardines #404, Sahuayo, Michoacán', '3534896001');

insert into clientes (nombre, apellido, direccion, celular)
values('Miguel', 'Torres Jiménez', 'Bolivia #856, Sahuayo, Michoacán', '3532682003');

insert into clientes (nombre, apellido, direccion, celular)
values('Elena', 'Fernández Ruiz', 'Paseo del Río, Guadalajara, Jalisco', '3358964871');

insert into clientes (nombre, apellido, direccion, celular)
values('Andrés', 'Castro Pérez', 'José María Morelos y Pavón #54, Cojumatlan, Michoacán', '3536894110');

insert into clientes (nombre, apellido, direccion, celular)
values('Patricia', 'Morales Ortega', 'Paris #58, Jiquilpan, Michoacán', '3531002804');

SELECT * FROM clientes;

UPDATE clientes SET descuento = '0' WHERE id_cliente = 7;

--Registros tabla compras-----------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO compras (id_proveedor, fecha) VALUES('1', '2022-01-10');

INSERT INTO compras (id_proveedor, fecha) VALUES('2', '2022-01-25');

INSERT INTO compras (id_proveedor, fecha) VALUES('3', '2022-02-09');

INSERT INTO compras (id_proveedor, fecha) VALUES('4', '2022-02-24');

INSERT INTO compras (id_proveedor, fecha) VALUES('1', '2022-03-12');

INSERT INTO compras (id_proveedor, fecha) VALUES('2', '2022-03-27');

INSERT INTO compras (id_proveedor, fecha) VALUES('3', '2022-04-11');

INSERT INTO compras (id_proveedor, fecha) VALUES('4', '2022-04-26');

INSERT INTO compras (id_proveedor, fecha) VALUES('1', '2022-05-11');

INSERT INTO compras (id_proveedor, fecha) VALUES('2', '2022-06-26');

INSERT INTO compras (id_proveedor, fecha) VALUES('3', '2022-07-11');

INSERT INTO compras (id_proveedor, fecha) VALUES('4', '2022-07-26');

INSERT INTO compras (id_proveedor, fecha) VALUES('1', '2022-08-10');

INSERT INTO compras (id_proveedor, fecha) VALUES('2', '2022-08-25');

INSERT INTO compras (id_proveedor, fecha) VALUES('2', '2022-09-09');

INSERT INTO compras (id_proveedor, fecha) VALUES('4', '2022-09-24');

SELECT * FROM compras;

UPDATE compras SET metodo_pago = 'Tarjeta', fecha = '2023-03-12', fecha_entrega = '2023-03-13' WHERE id_compra = 21;

--Registros tabla productos_compras-----------------------------------------------------------------------------------------------------------------------------
insert into productos_compras(id_compra, id_producto, cantidad, unitario)
values('1', '1', '5', '46');

insert into productos_compras(id_compra, id_producto, cantidad, unitario)
values('1', '5', '2', '76');

insert into productos_compras(id_compra, id_producto, cantidad, unitario)
values('1', '7', '3', '250');

insert into productos_compras(id_compra, id_producto, cantidad, unitario)
values('1', '10', '5', '85');

insert into productos_compras(id_compra, id_producto, cantidad, unitario)
values('2', '2', '5', '89');

insert into productos_compras(id_compra, id_producto, cantidad, unitario)
values('2', '3', '9', '138');

insert into productos_compras(id_compra, id_producto, cantidad, unitario)
values('2', '12', '1', '53');

--
insert into productos_compras(id_compra, id_producto, cantidad, unitario)
values('3', '8', '10', '270');

--
insert into productos_compras(id_compra, id_producto, cantidad, unitario)
values('4', '15', '4', '80');

insert into productos_compras(id_compra, id_producto, cantidad, unitario)
values('4', '12', '1', '53');

insert into productos_compras(id_compra, id_producto, cantidad, unitario)
values('4', '6', '3', '85');

insert into productos_compras(id_compra, id_producto, cantidad, unitario)
values('4', '10', '5', '85');

insert into productos_compras(id_compra, id_producto, cantidad, unitario)
values('4', '1', '3', '46');

--
insert into productos_compras(id_compra, id_producto, cantidad, unitario)
values('5', '4', '5', '95');

insert into productos_compras(id_compra, id_producto, cantidad, unitario)
values('5', '11', '6', '103');

--
insert into productos_compras(id_compra, id_producto, cantidad, unitario)
values('6', '15', '8', '80');

--
insert into productos_compras(id_compra, id_producto, cantidad, unitario)
values('7', '2', '2', '89');

insert into productos_compras(id_compra, id_producto, cantidad, unitario)
values('7', '9', '4', '85');

insert into productos_compras(id_compra, id_producto, cantidad, unitario)
values('7', '16', '7', '74');

--
insert into productos_compras(id_compra, id_producto, cantidad, unitario)
values('8', '13', '3', '58');

insert into productos_compras(id_compra, id_producto, cantidad, unitario)
values('8', '9', '5', '85');

insert into productos_compras(id_compra, id_producto, cantidad, unitario)
values('8', '2', '7', '89');

insert into productos_compras(id_compra, id_producto, cantidad, unitario)
values('8', '8', '4', '270');

insert into productos_compras(id_compra, id_producto, cantidad, unitario)
values('8', '15', '3', '80');

insert into productos_compras(id_compra, id_producto, cantidad, unitario)
values('8', '11', '6', '103');

SELECT * FROM productos_compras;
--Registros tabla ventas---------------------------------------------------------------------------------------------------------------------------------------------------------------
insert into ventas (id_cliente, id_trabajador)
values('5', '1');

insert into ventas (id_cliente, id_trabajador)
values('1', '1');

insert into ventas (id_cliente, id_trabajador)
values('12', '2');

insert into ventas (id_cliente, id_trabajador)
values('7', '2');

insert into ventas (id_cliente, id_trabajador)
values('3', '2');

insert into ventas (id_cliente, id_trabajador)
values('2', '4');

insert into ventas (id_cliente, id_trabajador)
values('10', '6');

insert into ventas (id_cliente, id_trabajador)
values('7', '10');

insert into ventas (id_cliente, id_trabajador)
values('9', '6');

insert into ventas (id_cliente, id_trabajador)
values('1', '5');

insert into ventas (id_cliente, id_trabajador)
values('11', '9');

insert into ventas (id_cliente, id_trabajador)
values('3', '3');

insert into ventas (id_cliente, id_trabajador)
values('5', '8');

insert into ventas (id_cliente, id_trabajador)
values('2', '3');

insert into ventas (id_cliente, id_trabajador)
values('12', '7');

SELECT * FROM ventas;

UPDATE ventas SET metodo_pago = 'Efectivo' WHERE id_venta = 29;

--Registros tabla productos_ventas-----------------------------------------------------------------------------------------------------------------------------
insert into productos_ventas (id_venta, id_producto, cantidad, unitario)
values('1', '1', '2', '46');

insert into productos_ventas (id_venta, id_producto, cantidad, unitario)
values('1', '10', '1', '85');

insert into productos_ventas (id_venta, id_producto, cantidad, unitario)
values('1', '7', '1', '250');

insert into productos_ventas (id_venta, id_producto, cantidad, unitario)
values('2', '2', '2', '89')

insert into productos_ventas (id_venta, id_producto, cantidad, unitario)
values('2', '12', '3', '53')

insert into productos_ventas (id_venta, id_producto, cantidad, unitario)
values('3', '4', '1', '95');

insert into productos_ventas (id_venta, id_producto, cantidad, unitario)
values('3', '9', '2', '85');

insert into productos_ventas (id_venta, id_producto, cantidad, unitario)
values('4', '8', '3', '270');

insert into productos_ventas (id_venta, id_producto, cantidad, unitario)
values('5', '11', '1', '103');

insert into productos_ventas (id_venta, id_producto, cantidad, unitario)
values('6', '15', '2', '80');

insert into productos_ventas (id_venta, id_producto, cantidad, unitario)
values('6', '13', '1', '58');

insert into productos_ventas (id_venta, id_producto, cantidad, unitario)
values('6', '3', '3', '138');

insert into productos_ventas (id_venta, id_producto, cantidad, unitario)
values('6', '4', '1', '95');

insert into productos_ventas (id_venta, id_producto, cantidad, unitario)
values('7', '10', '1', '85');

insert into productos_ventas (id_venta, id_producto, cantidad, unitario)
values('8', '16', '2', '74');

insert into productos_ventas (id_venta, id_producto, cantidad, unitario)
values('8', '9', '1', '85');

insert into productos_ventas (id_venta, id_producto, cantidad, unitario)
values('9', '5', '3', '76');

insert into productos_ventas (id_venta, id_producto, cantidad, unitario)
values('10', '7', '1', '250');

insert into productos_ventas (id_venta, id_producto, cantidad, unitario)
values('10', '8', '1', '270');

insert into productos_ventas (id_venta, id_producto, cantidad, unitario)
values('11', '2', '4', '89');

insert into productos_ventas (id_venta, id_producto, cantidad, unitario)
values('11', '6', '1', '85');

insert into productos_ventas (id_venta, id_producto, cantidad, unitario)
values('11', '11', '2', '103');

insert into productos_ventas (id_venta, id_producto, cantidad, unitario)
values('11', '15', '3', '80');

insert into productos_ventas (id_venta, id_producto, cantidad, unitario)
values('12', '1', '5', '46');

insert into productos_ventas (id_venta, id_producto, cantidad, unitario)
values('13', '10', '2', '85');

insert into productos_ventas (id_venta, id_producto, cantidad, unitario)
values('13', '12', '3', '53');

insert into productos_ventas (id_venta, id_producto, cantidad, unitario)
values('13', '12', '3', '53');

insert into productos_ventas (id_venta, id_producto, cantidad, unitario)
values('13', '1', '1', '46');

SELECT * FROM productos_ventas;
SELECT * FROM productos;
SELECT * FROM ventas;
SELECT * FROM clientes;

UPDATE productos_ventas SET unitario = 265.00 WHERE id_producto = 7;

UPDATE productos_ventas SET descuento_pesos = descuento_porcentaje / 100 WHERE id_producto <= 32;

--Registros tabla lotes-----------------------------------------------------------------------------------------------------------------------------
INSERT INTO lotes(fecha_lote, caducidad) VALUES('2022-01-01', '2027-01-01');

INSERT INTO lotes(fecha_lote, caducidad) VALUES('2022-01-15', '2027-01-15');

INSERT INTO lotes(fecha_lote, caducidad) VALUES('2022-02-01', '2027-02-01');

INSERT INTO lotes(fecha_lote, caducidad) VALUES('2022-02-15', '2027-02-15');

INSERT INTO lotes(fecha_lote, caducidad) VALUES('2022-03-01', '2027-03-01');

INSERT INTO lotes(fecha_lote, caducidad) VALUES('2022-03-15', '2027-03-15');

INSERT INTO lotes(fecha_lote, caducidad) VALUES('2022-04-01', '2027-04-01');

INSERT INTO lotes(fecha_lote, caducidad) VALUES('2022-04-15', '2027-04-15');

INSERT INTO lotes(fecha_lote, caducidad) VALUES('2022-05-01', '2027-05-01');

INSERT INTO lotes(fecha_lote, caducidad) VALUES('2022-05-15', '2027-05-15');

INSERT INTO lotes(fecha_lote, caducidad) VALUES('2022-06-01', '2027-06-01');

INSERT INTO lotes(fecha_lote, caducidad) VALUES('2022-06-15', '2027-06-15');

INSERT INTO lotes(fecha_lote, caducidad) VALUES('2022-07-01', '2027-07-01');

INSERT INTO lotes(fecha_lote, caducidad) VALUES('2022-07-15', '2027-07-15');

INSERT INTO lotes(fecha_lote, caducidad) VALUES('2022-08-01', '2027-08-01');

INSERT INTO lotes(fecha_lote, caducidad) VALUES('2022-08-15', '2027-08-15');

INSERT INTO lotes(fecha_lote, caducidad) VALUES('2022-09-01', '2027-09-01');

INSERT INTO lotes(fecha_lote, caducidad) VALUES('2022-09-15', '2027-09-15');

INSERT INTO lotes(fecha_lote, caducidad) VALUES('2022-10-01', '2027-10-01');

INSERT INTO lotes(fecha_lote, caducidad) VALUES('2022-10-15', '2027-10-15');

INSERT INTO lotes(fecha_lote, caducidad) VALUES('2022-11-01', '2027-11-01');

INSERT INTO lotes(fecha_lote, caducidad) VALUES('2022-11-15', '2027-11-15');

INSERT INTO lotes(fecha_lote, caducidad) VALUES('2022-12-01', '2027-12-01');

INSERT INTO lotes(fecha_lote, caducidad) VALUES('2022-12-15', '2027-12-15');

INSERT INTO lotes(fecha_lote, caducidad) VALUES('2023-01-01', '2028-01-01');

INSERT INTO lotes(fecha_lote, caducidad) VALUES('2023-01-15', '2028-01-15');

INSERT INTO lotes(fecha_lote, caducidad) VALUES('2023-02-01', '2028-02-01');

INSERT INTO lotes(fecha_lote, caducidad) VALUES('2023-02-15', '2028-02-15');

INSERT INTO lotes(fecha_lote, caducidad) VALUES('2023-03-01', '2028-03-01');

INSERT INTO lotes(fecha_lote, caducidad) VALUES('2023-03-15', '2028-03-15');

INSERT INTO lotes(fecha_lote, caducidad) VALUES('2023-04-01', '2028-04-01');

INSERT INTO lotes(fecha_lote, caducidad) VALUES('2023-04-15', '2028-04-15');

INSERT INTO lotes(fecha_lote, caducidad) VALUES('2023-05-01', '2028-05-01');

INSERT INTO lotes(fecha_lote, caducidad) VALUES('2023-05-15', '2028-05-15');

INSERT INTO lotes(fecha_lote, caducidad) VALUES('2023-06-01', '2028-06-01');

INSERT INTO lotes(fecha_lote, caducidad) VALUES('2023-06-15', '2028-06-15');

INSERT INTO lotes(fecha_lote, caducidad) VALUES('2023-07-01', '2028-07-01');

--Registros tabla devoluciones_compras--------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO devoluciones_compras(id_compra, id_producto, fecha, cantidad) VALUES('1', '5', '2022-01-11', '1');

INSERT INTO devoluciones_compras(id_compra, id_producto, fecha, cantidad) VALUES('1', '7', '2022-01-11', '2');

INSERT INTO devoluciones_compras(id_compra, id_producto, fecha, cantidad) VALUES('8', '8', '2022-04-27', '2');

INSERT INTO devoluciones_compras(id_compra, id_producto, fecha, cantidad) VALUES('2', '2', '2022-01-26', '3');

INSERT INTO devoluciones_compras(id_compra, id_producto, fecha, cantidad) VALUES('2', '3', '2022-01-26', '2');

INSERT INTO devoluciones_compras(id_compra, id_producto, fecha, cantidad) VALUES('2', '12', '2022-01-26', '1');

INSERT INTO devoluciones_compras(id_compra, id_producto, fecha, cantidad) VALUES('3', '8', '2022-02-10', '2');

INSERT INTO devoluciones_compras(id_compra, id_producto, fecha, cantidad) VALUES('3', '8', '2022-02-10', '1');

INSERT INTO devoluciones_compras(id_compra, id_producto, fecha, cantidad) VALUES('3', '8', '2022-02-10', '1');

INSERT INTO devoluciones_compras(id_compra, id_producto, fecha, cantidad) VALUES('4', '15', '2022-02-25', '2');

INSERT INTO devoluciones_compras(id_compra, id_producto, fecha, cantidad) VALUES('4', '6', '2022-02-25', '1');

INSERT INTO devoluciones_compras(id_compra, id_producto, fecha, cantidad) VALUES('4', '10', '2022-02-25', '3');

INSERT INTO devoluciones_compras(id_compra, id_producto, fecha, cantidad) VALUES('5', '4', '2022-03-13', '1');

INSERT INTO devoluciones_compras(id_compra, id_producto, fecha, cantidad) VALUES('5', '11', '2022-03-13', '2');

INSERT INTO devoluciones_compras(id_compra, id_producto, fecha, cantidad) VALUES('5', '4', '2022-03-13', '1');

INSERT INTO devoluciones_compras(id_compra, id_producto, fecha, cantidad) VALUES('6', '15', '2022-03-27', '2');

INSERT INTO devoluciones_compras(id_compra, id_producto, fecha, cantidad) VALUES('6', '15', '2022-03-27', '2');

INSERT INTO devoluciones_compras(id_compra, id_producto, fecha, cantidad) VALUES('6', '15', '2022-03-27', '2');

INSERT INTO devoluciones_compras(id_compra, id_producto, fecha, cantidad) VALUES('7', '9', '2022-04-12', '2');

INSERT INTO devoluciones_compras(id_compra, id_producto, fecha, cantidad) VALUES('7', '16', '2022-04-12', '3');