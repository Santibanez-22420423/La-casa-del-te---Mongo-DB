--Tabla clasificaciones
    SELECT
        cl.id_clasificacion,
        cl.nombre,
        cl.descripcion
    FROM clasificaciones cl
    fOR JSON PATH;

--Tabla compras
    SELECT
        c.id_compra,
        c.fecha,
        c.metodo_pago,
        c.fecha_entrega,
        c.id_proveedor AS [proveedor.id_proveedor],
        pro.nombre AS [proveedor.nombre],
        (
            SELECT  
                pc.id_producto_compra,
                pc.id_producto,
                p.nombre,
                pc.cantidad,
                cast(pc.unitario AS DECIMAL(6, 2)) AS 'unitario',
                cast(pc.subtotal AS DECIMAL(6, 2)) AS 'subtotal'
            FROM productos_compras pc
            INNER JOIN productos p
            ON pc.id_producto = p.id_producto
            WHERE pc.id_compra = c.id_compra
            FOR JSON PATH
         ) AS 'detalle_productos_compras',
        --Obtener el total de la compra.
        (
            SELECT
                cast(sum(pc.subtotal) AS DECIMAL (6, 2))
            FROM productos_compras pc
            WHERE pc.id_compra = c.id_compra
        ) AS 'total'
    FROM compras c
    INNER JOIN proveedores pro
    ON pro.id_proveedor = c.id_proveedor
    FOR JSON PATH;

--Devoluciones_compras
select 
    dc.id_devolucion_compra,
    dc.id_compra,
    dc.id_producto,
    dc.fecha,
    dc.cantidad,
    dc.unitario,
    dc.subtotal
from devoluciones_compras dc
for json path;

--Lotes
select 
    l.id_lote,
    l.fecha_lote,
    l.caducidad
from lotes l
for json path;

--Productos
select 
    p.id_producto,
    p.id_clasificacion,
    p.id_lote,
    p.id_proveedor,
    p.nombre,
    p.existencia,
    FORMAT(p.costo, 'N') as 'costo',
    FORMAT(p.precio, 'N') as 'precio',
    p.caracteristicas
from productos p
for json path;

--Clientes
select 
    c.id_cliente,
    c.nombre as [nombre_cliente.nombre],
    c.apellido as [nombre_cliente.apellido],
    c.direccion as [direccion.calle],
    c.celular,
    c.descuento
from clientes c
for json path;

--Proveedores
select 
    p.id_proveedor,
    p.nombre,
    p.direccion,
    p.celular
from proveedores p
for json path;

--Trabajadores
select 
    t.id_trabajador,
    t.nombre,
    t.apellido,
    t.fecha_contratacion,
    t.fecha_despido,
    t.direccion,
    t.celular,
    t.referencias,
    t.correo,
    t.contraseña
from trabajadores t
for json path;

--Trabajadores_jornadas
select 
    tj.id_trabajador_jornada,
    tj.id_trabajador,
    j.id_jornada as [jornadas.id_jornada],
    concat(j.hora_inicio, '') as [jornadas.hora_inicio],
    concat(j.hora_fin, '') as [jornadas.hora_fin],
    tj.fecha_inicio,
    tj.fecha_fin
from trabajadores_jornadas tj
inner join jornadas j
on tj.id_jornada = j.id_jornada
for json path;

--Ventas
select
    v.id_venta,
    v.fecha,
    v.metodo_pago,
    v.id_cliente as [cliente.id_cliente],
    concat(c.nombre, ' ', c.apellido) as [cliente.nombre],
    v.id_trabajador as [trabajador.id_trabajador],
    concat(t.nombre, ' ', t.apellido) as [trabajador.nombre_t],

    --Arreglo de objetos "detalles_productos_ventas".
    (
        select  
            pv.id_producto_venta,
            pv.id_producto,
            p.nombre,
            pv.cantidad,
            cast(pv.unitario as decimal(6, 2)) as 'unitario',
            cast(pv.subtotal as decimal(6, 2)) as 'subtotal',
            pv.descuento_porcentaje,
            cast(pv.descuento_pesos as decimal(6, 2)) as 'descuento_pesos',
            cast(pv.subtotal_con_descuento as decimal(6, 2)) as 'subtotal_con_descuento'
        from productos_ventas pv
        inner join productos p
        on pv.id_producto = p.id_producto
        where pv.id_venta = v.id_venta
        for json path
    ) as 'detalle_productos_ventas',

    --Obtener el total de la venta.
    (
        select
            cast(sum(pv.subtotal_con_descuento) as decimal (6, 2))
        from productos_ventas pv
        where pv.id_venta = v.id_venta
    ) as 'total'
    
from ventas v
inner join clientes c
on v.id_cliente = c.id_cliente
inner join trabajadores t
on v.id_trabajador = t.id_trabajador
for json path;
