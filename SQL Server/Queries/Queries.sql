--Consultas tabla trabajadores----------------------------------------------------------------------------------------------------------------------------------------
SELECT * FROM trabajadores;

--Consultas tabla jornadas----------------------------------------------------------------------------------------------------------------------------------------------
SELECT * FROM jornadas;

--Consultas tabla trabajadores_jornadas------------------------------------------------------------------------------------------------------------------------
SELECT * FROM trabajadores_jornadas;

--Consultas tabla clasificaciones--------------------------------------------------------------------------------------------------------------------------------
SELECT * FROM clasificaciones;

--Consultas tabla proveedores------------------------------------------------------------------------------------------------------------------------------------
SELECT * FROM proveedores;

--Consultas tabla compras-----------------------------------------------------------------------------------------------------------------------------------------
SELECT * FROM compras;

--Consultas tabla productos------------------------------------------------------------------------------------------------------------------------------------------
select * from productos;

--Consultas tabla clientes-----------------------------------------------------------------------------------------------------------------------------------------
select * from clientes;

--Consultas tabla productos_compras-----------------------------------------------------------------------------------------------------------------------------------------
select * from productos_compras;

--Consultas tabla ventas-------------------------------------------------------------------------------------------------------------------------------------------------------
select * from ventas;

--Consutlas tabla productos_ventas----------------------------------------------------------------------------------------------------------------------------------
select * from productos_ventas;

--Consultas tabla lotes-------------------------------------------------------------------------------------------------------------------------------------------
SELECT * FROM lotes;

--Consultas tabla devoluciones_compras------------------------------------------------------------------------------------------------------------------------
SELECT * FROM devoluciones_compras;

--Consultas que resuelven los procesos de La Casa del Té. --------------------------------------------------------------------------------------------------------------
	--1.Proceso de accesar a la información de los trabajadores como administrador (dueño de la tienda).--------------------------------------------------------------------------
		-- 1.1 Mostrar los datos de todos los trabajadores.--
			SELECT * FROM trabajadores;

		-- 1.2 Mostrar los datos de un trabajador usando el id_trabajador.--
		--Ejemplo: Mostrar los datos del trabajador con el id_trabajador = 3.
			SELECT * FROM trabajadores WHERE id_trabajador = 3;

		-- 1.3 Mostrar los datos de un trabajador usando el nombre.--
		--Ejemplo: Mostrar los datos del trabajador Mitzu Sayin. 
			SELECT * FROM trabajadores WHERE nombre = 'Mitzu Sayin';

		-- 1.4 Mostrar los datos de un trabajador usando el apellido.--
		--Ejemplo: Mostrar los datos del trabajador Galvan Rojas. 
			SELECT * FROM trabajadores WHERE apellido = 'Galvan Rojas';

		-- 1.5 Mostrar los datos de los trabajadores que su nombre comience con una letra definida.--
		--Ejemplo: Mostrar los datos de los trabajadores cuyo nombre comience con A. 
			SELECT * FROM trabajadores WHERE nombre LIKE ('A%');

		-- 1.6 Mostrar los datos de los trabajadores que su apellido comience con una letra definida.--
		--Ejemplo: Mostrar los datos de los trabajadores cuyo apelido comience con G. 
			SELECT * FROM trabajadores WHERE apellido LIKE ('G%');

		-- 1.7 Mostrar los datos de los trabajadores que no han sido despedidos.
			SELECT * FROM trabajadores WHERE fecha_despido IS NULL;

	--2.Proceso de accesar a la información de las compras.----------------------------------------------------------------------------------------------------------------------------
		--2.1 Revisar si es necesario realizar una compra de productos:
			--2.1.A Revisar si es necesario realizar una compra de un producto en específico consultando el id_producto.
			--Ejemplo: Revisar si es necesario realizar una compra del producto con el id_producto = 3.
				SELECT id_producto, nombre, existencia FROM productos WHERE id_producto = 2;

			--2.1.B Revisar si es necesario realizar una compra de un producto en específico consultando el nombre.
			--Ejemplo: Revisar si es necesario realizar una compra del producto Abango.
				SELECT id_producto, nombre, existencia FROM productos WHERE nombre = 'Abango';

		--2.2 Revisar si el producto a comprar es el único necesario con respecto al proveedor que lo vende.
		--Ejemplo: Mostrar el id_producto, nombre y existencia de los productos que tengas una existencia menor a 15 y que sean comprados al mismo proveedor.
			SELECT id_producto, nombre, existencia FROM productos WHERE id_proveedor = 3 AND existencia < 15;

		--2.3 Conocer los datos necesarios del proveedor al que se realizará la compra (id_proveedor, nombre empresa, celular).
		--Ejemplo: Conocer los datos necesarios del proveedor con el id_proveedor = 3.
			SELECT pr.id_proveedor, pr.nombre, pr.celular FROM productos p INNER JOIN proveedores pr ON p.id_proveedor = pr.id_proveedor WHERE p.id_proveedor = 3;

		--2.4 Luego de realizar la(s) compra(s). Conocer los datos de la(s) compra(s) realizada(s):
			--2.4.A Conocer los datos de una compra usando el id_compra.
			--Ejemplo: Conocer los datos de la compra con el id_compra = 2.
				SELECT * FROM compras WHERE id_compra = 2;

		--2.5 Conocer los detalles productos_compras que conforman la compra realizada.
		--Ejemplo: Conocer los detalles de la compra con id_compra = 2;
				SELECT * FROM productos_compras WHERE id_compra IN (SELECT id_compra FROM compras WHERE id_compra = 2);

		--2.6 Mostrar el id_compra y obtener el total de la compra, sumando los detalles que la conforman.
		--Ejemplo:  Mostrar el id_compra y obtener el total de la compra con el id_compra = 2.
			SELECT id_compra, SUM(subtotal) AS 'Total' FROM productos_compras WHERE id_compra in (SELECT id_compra FROM compras WHERE id_compra = 2) GROUP BY id_compra;

	--3.Proceso de accesar a la información de compras en conjunto.
		--3.1 Consultar las compras realizadas en un día.
		--Ejemplo: Consultar las compras realizadas el día 2022-01-10.
			SELECT * FROM compras WHERE fecha = '2022-01-10'

		--3.2 Consultar el total de las compras realizadas en un día (sumando los detalles que las conforman).
		--Ejemplo: Consultar el total de las compras realizadas el día 2022-01-10.
			SELECT SUM(pc.subtotal) AS 'Costo total de lo comprado en el día' FROM productos_compras pc WHERE id_compra IN (SELECT c.id_compra FROM compras c WHERE fecha = '2022-01-10')

		--3.3 Consultar el total de las compras realizadas en un periodo (sumando los detalles que las conforman).
		--Ejemplo: Consultar el total de las compras realizadas entre el día 2022-01-10 y 2022-04-10.
			SELECT SUM(pc.subtotal) AS 'Costo total de lo comprado en el día' FROM productos_compras pc WHERE id_compra IN (SELECT c.id_compra FROM compras c WHERE fecha BETWEEN '2022-01-10' AND '2022-04-10')

		--3.4 Consultar el total de las compras realizadas en un mes de un año en específico(sumando los detalles que las conforman).
		--Ejemplo: Consultar el total de las compras realizadas en el mes 01 del 2022.
			SELECT SUM(pc.subtotal) AS 'Costo total de lo comprado en un mes' FROM productos_compras pc WHERE id_compra IN (SELECT c.id_compra FROM compras c WHERE MONTH(fecha) = 1 AND YEAR(fecha) = 2022)

		--3.5 Consultar el total de las compras realizadas en un año en específico(sumando los detalles que las conforman).
		--Ejemplo: Consultar el total de las compras realizadas en año del 2022.
			SELECT SUM(pc.subtotal) AS 'Costo total de lo comprado en un año' FROM productos_compras pc WHERE id_compra IN (SELECT c.id_compra FROM compras c WHERE YEAR(fecha) = 2022)

		--3.6 Consultar los totales de cada compra realizada en un día (sumando los detalles que las conforman).
		--Ejemplo: Consultar los totales de las compras realizadas el día 2022-01-10.
			SELECT pc.id_compra, SUM(pc.subtotal) AS 'Costos totales de las compras en el día' FROM productos_compras pc WHERE id_compra IN (SELECT c.id_compra FROM compras c WHERE fecha = '2022-01-10') GROUP BY pc.id_compra;

		--3.7 Consultar los totales de cada compra realizada en un periodo (sumando los detalles que las conforman).
		--Ejemplo: Consultar los totales de las compras realizadas entre el día 2022-01-10 y 2022-04-10.
			SELECT pc.id_compra, SUM(pc.subtotal) AS 'Costos totales de las compras en el periodo' FROM productos_compras pc WHERE id_compra IN (SELECT c.id_compra FROM compras c WHERE fecha BETWEEN '2022-01-10' AND '2022-04-10') GROUP BY pc.id_compra;

		--3.8 Consultar los totales de cada compra realizada en un mes (sumando los detalles que las conforman).
		--Ejemplo: Consultar los totales de las compras realizadas en el mes 01 del 2022.
			SELECT pc.id_compra, SUM(pc.subtotal) AS 'Costos totales de las compras en el mes' FROM productos_compras pc WHERE id_compra IN (SELECT c.id_compra FROM compras c WHERE YEAR(fecha) = 2022 AND MONTH(fecha) = 1) GROUP BY pc.id_compra;

		--3.9 Consultar los totales de cada compra realizada en un año (sumando los detalles que las conforman).
		--Ejemplo: Consultar los totales de las compras realizadas en el año 2022.
			SELECT pc.id_compra, SUM(pc.subtotal) AS 'Costos totales de las compras en el año' FROM productos_compras pc WHERE id_compra IN (SELECT c.id_compra FROM compras c WHERE YEAR(fecha) = 2022) GROUP BY pc.id_compra;

		--3.10 Mostrar el nombre, la cantidad, valor unitario y subtotal de los productos que conforman una compra.
		--Ejemplo: Mostrar el nombre, la cantidad, valor unitario y subtotal de los productos que conforman compra con id_compra = 2.
			SELECT p.nombre, pc.cantidad, pc.unitario, pc.subtotal FROM productos p INNER JOIN productos_compras pc ON p.id_producto = pc.id_producto WHERE pc.id_compra = 2;

		--3.11 Mostrar el id_compra, nombre, la cantidad, valor unitario y subtotal de los productos que conforman las compras de un día.
		--Ejemplo: Mostrar el id_compra, nombre, la cantidad, valor unitario y subtotal de los productos que conforman las compras del día 2022-02-09.
			SELECT pc.id_compra, p.nombre, pc.cantidad, pc.unitario, pc.subtotal FROM productos p INNER JOIN productos_compras pc ON p.id_producto = pc.id_producto INNER JOIN compras c ON pc.id_compra = c.id_compra WHERE c.fecha = '2022-01-25';

		--3.12 Mostrar el id_compra, nombre, la cantidad, valor unitario y subtotal de los productos que conforman las compras de un periodo.
		--Ejemplo: Mostrar el id_compra, nombre, la cantidad, valor unitario y subtotal de los productos que conforman las compras en el periodo 2022-01-25 a 2023-03-12.		
			select pc.id_compra, p.nombre, pc.cantidad, pc.unitario, pc.subtotal from productos p inner join productos_compras pc on p.id_producto = pc.id_producto inner join compras c on pc.id_compra = c.id_compra where c.fecha between '2022-01-25' and '2023-03-12';

		--3.13 Mostrar el id_compra, nombre, la cantidad, valor unitario y subtotal de los productos que conforman las compras de un mes.
		--Ejemplo: Mostrar el id_compra, nombre, la cantidad, valor unitario y subtotal de los productos que conforman las compras del año 2023.
			select pc.id_compra, p.nombre, pc.cantidad, pc.unitario, pc.subtotal from productos p inner join productos_compras pc on p.id_producto = pc.id_producto inner join compras c on pc.id_compra = c.id_compra where year(c.fecha) = 2023; 

	--4.Proceso de accesar a la información de una devolución sobre compras.--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	--Luego de realizar la(s) devolución(es) sobre compra(s). Conocer los datos de la(s) devolución(es) sobre compra(s):

		--4.1 A Conocer los datos de una devolución sobre compra usando el id_devolucion_compra.
		--Ejemplo: Conocer los datos de la compra con el id_devolucion_compra = 2.
			SELECT * FROM devoluciones_compras WHERE id_devolucion_compra = 2;

		--4.2 Conocer las devoluciones sobre compras que tenga una compra realizada.
		--Ejemplo: Conocer las devoluciones_compras de la compra con id_compra = 2;
			select * from devoluciones_compras where id_compra in (select id_compra from compras where id_compra = 2);

		--4.3 Mostrar el id_compra y obtener el total de la devolucion_compra, sumando las devoluciones que la conforman.
		--Ejemplo:  Mostrar el id_compra y obtener el total de las devoluciones_compras de la compra con el id_compra = 2.
			select id_compra, sum(subtotal) as 'Total de la devolución' from devoluciones_compras where id_compra in (select id_compra from compras where id_compra = 2) group by id_compra;

	--5.Proceso de accesar a la información de devoluciones_compras en conjunto.

		--5.1 Consultar las devoluciones_compras realizadas en un día.
		--Ejemplo: Consultar las compras realizadas el día 2022-01-11.
			select * from devoluciones_compras where fecha = '2022-01-11'

		--5.2 Consultar el total de las devoluciones_compras realizadas en un día.
		--Ejemplo: Consultar el total de las devoluciones_compras realizadas el día 2022-01-26.
			select sum(dc.id_devolucion_compra) as 'Costo total de las devoluciones_compras en el día' from devoluciones_compras dc where id_compra in (select c.id_compra from compras c where fecha = '2022-01-26')

		--5.3 Consultar el total de las devoluciones_compras realizadas en un periodo.
		--Ejemplo: Consultar el total de las devoluciones_compras realizadas entre el día 2022-01-10 y 2022-04-10.
			select sum(dc.subtotal) as 'Costo total de las devoluciones_compras en el periodo' from devoluciones_compras dc where id_compra in (select c.id_compra from compras c where fecha between '2022-01-10' and '2022-04-10')

		--5.4 Consultar el total de las devoluciones_compras realizadas en un mes de un año en específico.
		--Ejemplo: Consultar el total de las devoluciones_compras realizadas en el mes 01 del 2022.
			select sum(dc.subtotal) as 'Costo total de las devoluciones_compras en un mes' from devoluciones_compras dc where id_compra in (select c.id_compra from compras c where month(fecha) = 1 and year(fecha) = 2022)

		--5.5 Consultar el total de las devoluciones_compras realizadas en un año en específico.
		--Ejemplo: Consultar el total de las devoluciones_compras realizadas en año del 2022.
			select sum(dc.subtotal) as 'Costo total de las devoluciones_compras en un año' from devoluciones_compras dc where id_compra in (select c.id_compra from compras c where year(fecha) = 2022)

		--5.6 Consultar los totales de cada devoluciones_compras realizada en un día.
		--Ejemplo: Consultar los totales de las compras realizadas el día 2022-03-27.
			select dc.id_compra, sum(dc.subtotal) as 'Costos totales de las devoluciones_compras en el día' from devoluciones_compras dc where id_compra in (select c.id_compra from compras c where fecha = '2022-03-27') group by dc.id_compra;

		--5.7 Consultar los totales de cada devolucion_compra realizada en un periodo.
		--Ejemplo: Consultar los totales de las devoluciones_compras realizadas entre el día 2022-02-10 y 2022-04-10.
			select dc.id_compra, sum(dc.subtotal) as 'Costos totales de las devoluciones_compras en el periodo' from devoluciones_compras d where id_compra in (select c.id_compra from compras c where fecha between '2022-02-10 ' and '2022-04-10') group by dc.id_compra;

		--5.8 Consultar los totales de cada devoluciones_compras realizada en un mes.
		--Ejemplo: Consultar los totales de las devoluciones_compras realizadas en el mes 03 del 2022.
			select dc.id_compra, sum(dc.subtotal) as 'Costos totales de las devoluciones_compras en el mes' from devoluciones_compras d where id_compra in (select c.id_compra from compras c where year(fecha) = 2022 and month(fecha) = 3) group by dc.id_compra;

		--5.9 Consultar los totales de las devoluciones_compras realizada en un año.
		--Ejemplo: Consultar los totales de las compras realizadas en el año 2022.
			select dc.id_compra, sum(dc.subtotal) as 'Costos totales de las devoluciones_compras en el año' from devoluciones_compras dc where id_compra in (select c.id_compra from compras c where year(fecha) = 2022) group by dc.id_compra;

		--5.10 Mostrar el nombre, la cantidad, valor unitario y subtotal de los productos que conforman una devolucion_compra.
		--Ejemplo: Mostrar el nombre, la cantidad, valor unitario y subtotal de los productos que conforman devolucion_compra de la compra con id_compra = 2.
			select p.nombre, dc.cantidad, dc.unitario, dc.subtotal from productos p inner join devoluciones_compras dc on p.id_producto = dc.id_producto where dc.id_compra = 2;

		--5.11 Mostrar el id_compra, nombre, la cantidad, valor unitario y subtotal de los productos que conforman las devoluciones_compras de un día.
		--Ejemplo: Mostrar el id_compra, nombre, la cantidad, valor unitario y subtotal de los productos que conforman las devoluciones_compras del día 2022-02-09.
			select dc.id_compra, p.nombre, dc.cantidad, dc.unitario, dc.subtotal from productos p inner join devoluciones_compras dc on p.id_producto = dc.id_producto inner join compras c on dc.id_compra = c.id_compra where c.fecha = '2022-02-25';

		--5.12 Mostrar el id_compra, nombre, la cantidad, valor unitario y subtotal de los productos que conforman las devoluciones_compras de un periodo.
		--Ejemplo: Mostrar el id_compra, nombre, la cantidad, valor unitario y subtotal de los productos que conforman las devoluciones_compras en el periodo 2022-01-25 a 2023-03-12.
			select pc.id_compra, p.nombre, pc.cantidad, pc.unitario, pc.subtotal from productos p inner join productos_compras pc on p.id_producto = pc.id_producto inner join compras c on pc.id_compra = c.id_compra where c.fecha between '2022-01-25' and '2023-03-12';

		--5.13 Mostrar el id_compra, nombre, la cantidad, valor unitario y subtotal de los productos que conforman las devoluciones_compras de un año.
		--Ejemplo: Mostrar el id_compra, nombre, la cantidad, valor unitario y subtotal de los productos que conforman las devoluciones_compras del año 2022.
			select dc.id_compra, p.nombre, dc.cantidad, dc.unitario, dc.subtotal from productos p inner join devoluciones_compras dc on p.id_producto = dc.id_producto inner join compras c on dc.id_compra = c.id_compra where year(c.fecha) = 2022; 

	--6.Proceso de accesar a la información de las ventas.----------------------------------------------------------------------------------------------------------------------------
		--6.1.A Revisar si todas las ventas realizadas.
				SELECT * FROM ventas;

		--6.2 Revisar cuántas ventas ha comprado un cliente.
		--Ejemplo: Mostrar el id_venta, id_trabajador, fecha y metodo_pago del id_cliente = 3.
			SELECT id_venta, id_trabajador, fecha, metodo_pago FROM ventas WHERE id_cliente = 3;

		--6.3 Conocer los datos necesarios del cliente que realizó la compra (venta) (id_cliente, nombre, apellido, celular).
		--Ejemplo: Conocer los datos necesarios del cliente con el id_cliente = 3.
			SELECT DISTINCT c.id_cliente, c.nombre, c.apellido, c.celular FROM clientes c INNER JOIN ventas v ON c.id_cliente = v.id_cliente WHERE v.id_cliente = 3;

		--6.4 Luego de realizar la(s) venta(s). Conocer los datos de la(s) venta(s) realizada(s):
			--6.4.A Conocer los datos de una venta usando el id_venta.
			--Ejemplo: Conocer los datos de la venta con el id_venta = 2.
				SELECT * FROM ventas WHERE id_venta = 2;

		--6.5 Conocer los detalles productos_ventas que conforman la venta realizada.
		--Ejemplo: Conocer los detalles de la venta con id_venta = 2;
				SELECT * FROM productos_ventas WHERE id_venta IN (SELECT id_venta FROM ventas WHERE id_venta = 2);

		--6.6 Mostrar el id_venta y obtener el total de la venta, sumando los detalles que la conforman.
		--Ejemplo:  Mostrar el id_venta y obtener el total de la venta con el id_venta = 2.
			SELECT id_venta, SUM(subtotal) AS 'Total' FROM productos_ventas WHERE id_venta in (SELECT id_venta FROM ventas WHERE id_venta = 2) GROUP BY id_venta;

	--7.Proceso de accesar a la información de ventas en conjunto.
		--7.1 Consultar las ventas realizadas en un día.
		--Ejemplo: Consultar las ventas realizadas el día 2024-10-10.
			SELECT * FROM ventas WHERE fecha = '2024-10-10'

			SELECT * FROM ventas;

		--7.2 Consultar el total de las ventas realizadas en un día (sumando los detalles que las conforman).
		--Ejemplo: Consultar el total de las ventas realizadas el día 2024-09-18.
			SELECT SUM(pv.subtotal) AS 'Costo total de lo comprado en el día' FROM productos_ventas pv WHERE id_venta IN (SELECT v.id_venta FROM ventas v WHERE fecha = '2024-09-18');

		--7.3 Consultar el total de las ventas realizadas en un periodo (sumando los detalles que las conforman).
		--Ejemplo: Consultar el total de las ventas realizadas entre el día 2024-09-18 y 2024-10-10.
			SELECT SUM(pv.subtotal) AS 'Costo total de lo comprado en el periodo' FROM productos_ventas pv WHERE id_venta IN (SELECT v.id_venta FROM ventas v WHERE fecha BETWEEN '2024-09-18' AND '2024-10-10')

		--7.4 Consultar el total de las ventas realizadas en un mes de un año en específico(sumando los detalles que las conforman).
		--Ejemplo: Consultar el total de las ventas realizadas en el mes 09 del 2024.
			SELECT SUM(pv.subtotal) AS 'Costo total de lo comprado en un mes' FROM productos_ventas pv WHERE id_venta IN (SELECT v.id_venta FROM ventas v WHERE MONTH(fecha) = 9 AND YEAR(fecha) = 2024)

		--7.5 Consultar el total de las ventas realizadas en un año en específico(sumando los detalles que las conforman).
		--Ejemplo: Consultar el total de las ventas realizadas en año del 2024.
			SELECT SUM(pv.subtotal) AS 'Costo total de lo comprado en un año' FROM productos_ventas pv WHERE id_venta IN (SELECT v.id_venta FROM ventas v WHERE YEAR(fecha) = 2024)

		--7.6 Consultar los totales de cada venta realizada en un día (sumando los detalles que las conforman).
		--Ejemplo: Consultar los totales de las ventas realizadas el día 2024-09-18.
			SELECT pv.id_venta, SUM(pv.subtotal) AS 'Costos totales de las compras en el día' FROM productos_ventas pv WHERE id_venta IN (SELECT v.id_venta FROM ventas v WHERE fecha = '2024-09-18') GROUP BY pv.id_venta;

		--7.7 Consultar los totales de cada venta realizada en un periodo (sumando los detalles que las conforman).
		--Ejemplo: Consultar los totales de las ventas realizadas entre el día 2024-09-18 y 2024-10-10.
			SELECT pv.id_venta, SUM(pv.subtotal) AS 'Costos totales de las compras en el periodo' FROM productos_ventas pv WHERE id_venta IN (SELECT v.id_venta FROM ventas v WHERE fecha BETWEEN '2024-09-18' AND '2024-10-10') GROUP BY pv.id_venta;

		--7.8 Consultar los totales de cada venta realizada en un mes (sumando los detalles que las conforman).
		--Ejemplo: Consultar los totales de las compras realizadas en el mes 09 del 2024.
			SELECT pv.id_venta, SUM(pv.subtotal) AS 'Costos totales de las compras en el mes' FROM productos_ventas pv WHERE id_venta IN (SELECT v.id_venta FROM ventas v WHERE YEAR(fecha) = 2024 AND MONTH(fecha) = 9) GROUP BY pv.id_venta;

		--7.9 Consultar los totales de cada venta realizada en un año (sumando los detalles que las conforman).
		--Ejemplo: Consultar los totales de las ventas realizadas en el año 2024.
			SELECT pv.id_venta, SUM(pv.subtotal) AS 'Costos totales de las compras en el año' FROM productos_ventas pv WHERE id_venta IN (SELECT v.id_venta FROM ventas v WHERE YEAR(fecha) = 2024) GROUP BY pv.id_venta;

		--7.10 Mostrar el nombre, la cantidad, valor unitario y subtotal de los productos que conforman una venta.
		--Ejemplo: Mostrar el nombre, la cantidad, valor unitario y subtotal de los productos que conforman venta con id_venta = 2.
			SELECT p.nombre, pv.cantidad, pv.unitario, pv.subtotal FROM productos p INNER JOIN productos_ventas pv ON p.id_producto = pv.id_producto WHERE pv.id_venta = 2;

		--7.11 Mostrar el id_venta, nombre, la cantidad, valor unitario y subtotal de los productos que conforman las ventas de un día.
		--Ejemplo: Mostrar el id_venta, nombre, la cantidad, valor unitario y subtotal de los productos que conforman las compras del día 2024-09-18.
			SELECT pv.id_venta, p.nombre, pv.cantidad, pv.unitario, pv.subtotal FROM productos p INNER JOIN productos_ventas pv ON p.id_producto = pv.id_producto INNER JOIN ventas v ON pv.id_venta = v.id_venta WHERE v.fecha = '2024-09-18';

		--7.12 Mostrar el id_venta, nombre, la cantidad, valor unitario y subtotal de los productos que conforman las ventas de un periodo.
		--Ejemplo: Mostrar el id_venta, nombre, la cantidad, valor unitario y subtotal de los productos que conforman las ventas en el periodo 2024-09-18 a 2024-10-10.		
			select pv.id_venta, p.nombre, pv.cantidad, pv.unitario, pv.subtotal from productos p inner join productos_ventas pv on p.id_producto = pv.id_producto inner join ventas v on pv.id_venta = v.id_venta where v.fecha between '2024-09-18' and '2024-10-10';

		--7.13 Mostrar el id_venta, nombre, la cantidad, valor unitario y subtotal de los productos que conforman las ventas de un mes.
		--Ejemplo: Mostrar el id_venta, nombre, la cantidad, valor unitario y subtotal de los productos que conforman las ventas del año 2024.
			select pv.id_venta, p.nombre, pv.cantidad, pv.unitario, pv.subtotal from productos p inner join productos_ventas pv on p.id_producto = pv.id_producto inner join ventas v on pv.id_venta = v.id_venta where year(v.fecha) = 2024; 