--Trigger tabla productos_compras----------------------------------------------------------------------------------------------------------------------
create trigger trg_cantidad_comprados
on productos_compras
after insert
as
begin  
    declare @id_producto integer, @cantidad integer;

    -- Obtener el id_producto y la cantidad de la tabla inserted que son los datos de productos_compras.
    select @id_producto = i.id_producto, @cantidad = i.cantidad
    from inserted i;

    begin
        -- Actualizar la existencia del producto.
        update productos
        set existencia = existencia + @cantidad
        where id_producto = @id_producto;
    end
end;

--Pasar el valor de costo de la tabla productos asignándolo a el atributo unitario de la tabla productos_compras.

create trigger trg_DarAUnitarioCosto
on productos_compras
after insert
as
begin
    declare @id_producto integer, @unitario money;

    -- Obtener el id_producto de la tabla inserted.
    select @id_producto = i.id_producto
    from inserted i;

    -- Obtener el precio actual del producto.
    select @unitario = costo
    from productos
    where id_producto = @id_producto;


    update productos_compras
	set subtotal = @unitario * cantidad, unitario = @unitario
	where id_producto = @id_producto
  
  end;


 --Trigger tabla productos_ventas--------------------------------------------------------------------------------------------------------------------------------------
 -- Verificar que exista la cantidad de productos a vender.

create trigger trg_existencia_para_ventas
on productos_ventas
instead of insert
as
begin  
    declare @id_producto integer, @cantidad integer, @existencia integer;

    -- Obtener el id_producto y la cantidad de la tabla inserted que son los datos de productos_ventas.
    select @id_producto = i.id_producto, @cantidad = i.cantidad
    from inserted i;

    -- Obtener la existencia actual del producto.
    select @existencia = existencia
    from productos
    where id_producto = @id_producto;

    -- Verificar si hay suficiente existencia.
    if @cantidad <= @existencia
    begin
        -- Si hay suficiente existencia, realizar la inserción.
        insert into productos_ventas ( id_producto, id_venta, cantidad, unitario)
        select id_producto, id_venta, cantidad, unitario
        from inserted;

        -- Actualizar la existencia del producto.
        update productos
        set existencia = existencia - @cantidad
        where id_producto = @id_producto;
    end
    else
    begin
        -- Si no hay suficiente existencia, lanzar un error.
        raiserror('No es posible realizar la venta: cantidad solicitada excede la existencia.', 16, 1);
    end
end;

-- Pasar el valor de precio de la tabla productos asignándolo a el atributo unitario de la tabla productos_ventas.

create trigger trg_DarAUnitarioValor
on productos_ventas
after insert
as
begin
    declare @id_producto integer, @unitario money;

    -- Obtener el id_producto de la tabla inserted
    select @id_producto = i.id_producto
    from inserted i;

    -- Obtener el precio actual del producto
    select @unitario = precio
    from productos
    where id_producto = @id_producto;


    update productos_ventas
	set subtotal = @unitario * cantidad, unitario = @unitario
	where id_producto = @id_producto
  
  end;

--Pasar el valor de descuento de la tabla clientes a desc_porcentaje de productos_ventas, además calcular los campos de desc_pesos y subtotal_con_desc.
  create trigger trg_descuentos_productos_ventas
  on productos_ventas
  after insert, update
  as 
  begin

  declare @id_producto integer

  -- Obtener el id_producto de la tabla inserted
    select @id_producto = i.id_producto
    from inserted i;

		update pv
		set pv.descuento_porcentaje = c.descuento
		from productos_ventas pv
		inner join ventas v
		on v.id_venta = pv.id_venta
		inner join clientes c
		on c.id_cliente = v.id_cliente
		where pv.id_producto = @id_producto;

		update productos_ventas
		set descuento_pesos = subtotal * descuento_porcentaje / 100
		where id_producto = @id_producto;

		update productos_ventas
		set subtotal_con_descuento = subtotal - descuento_pesos
		where id_producto = @id_producto;
end;

--Triggers tabla devoluciones_compras-------------------------------------------------------------------------------------------------------------
-- Verificar que exista la cantidad a devolver de la compra realizada.

create trigger trg_cantidad_devolucion_compra
on devoluciones_compras
instead of insert
as
begin  
    declare @id_producto integer, @cantidad integer, @comprados integer, @id_compra integer;

    -- Obtener el id_producto y la cantidad de la tabla inserted que son los datos de devoluciones_compras.
    select @id_producto = i.id_producto, @cantidad = i.cantidad, @id_compra = i.id_compra
    from inserted i;


	--saca la cantidad desde la tabla de productos_compras para verificar que no sea mayor a la cantidad comprada.
    -- Obtener la cantidad de productos de la compra.
    select @comprados = cantidad
    from productos_compras
    where id_producto = @id_producto and id_compra = @id_compra;

    -- Verificar si hay suficiente existencia.
    if @cantidad <= @comprados
    begin
        -- Si hay comprados suficientes para la devolución, realizar la inserción.
        insert into devoluciones_compras ( id_compra, id_producto, fecha, cantidad, unitario)
        select id_compra, id_producto, fecha, cantidad, unitario
        from inserted;

        -- Actualizar la existencia del producto.
        update productos
        set existencia = existencia - @cantidad
        where id_producto = @id_producto;
    end
    else
    begin
        -- Si no hay suficiente cantidad de comprados para la devolución, lanzar un error.
        raiserror('No es posible realizar la devolución sobre compra: cantidad a devolver excede la cantidad comprada.', 16, 1);
    end
end;

--Pasar el valor de costo de la tabla productos asignándolo a el atributo unitario de la tabla devoluciones_compras.

create trigger trg_DarAUnitarioValorDevCompra
on devoluciones_compras
after insert
as
begin
    declare @id_producto integer, @unitario money;

    -- Obtener el id_producto de la tabla inserted
    select @id_producto = i.id_producto
    from inserted i;

    -- Obtener el costo actual del producto
    select @unitario = costo
    from productos
    where id_producto = @id_producto;

    update devoluciones_compras
	set subtotal = @unitario * cantidad, unitario = @unitario
	where id_producto = @id_producto
  
  end;


--Triggers tabla productos--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--todos los nuevos productos a registrar serán calculados con su precio siempre y cuando se agrege la ganancia

-- Calcular el valor de precio de la tabla productos.

CREATE TRIGGER trg_calcular_precio
ON productos
AFTER INSERT
AS
BEGIN
    DECLARE @id_producto INTEGER;

    -- Obtener el id_producto de la tabla inserted
    SELECT @id_producto = i.id_producto  
    FROM inserted i;

    UPDATE productos
	SET precio = (costo + (costo * ganancia / 100))
	WHERE id_producto = @id_producto
  
  END;