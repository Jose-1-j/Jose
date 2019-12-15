create database BD_Valparaiso;
use BD_Valparaiso;

--CREAR TABLA PARA LOS EMPLEADOS
CREATE TABLE empleado
(	
	id_empleado int primary key not null,
	nombre Varchar (30) not null,
	telefono varchar (30)not null,
	salario decimal (10,2)not null
)
Insert into empleado VALUES (1,'Juan Jimenez','4514875',18);
Insert into empleado VALUES (2,'Ronaldo Rivera','285374',30);
Insert into empleado VALUES (3,'Ivan Castañeda','345218',9);
Insert into empleado VALUES (4,'Mauricio Cardenas','890',10);
Insert into empleado VALUES (5,'Carlos Lopez','565',87);
select * from empleado
truncate table empleado
--drop table empleado

--INSERTAR TABLA PARA LOS SERVICIOS
CREATE TABLE servicio
(
	cod_servicio int primary key not null,
	costo decimal(10,2) not null,
	descripcion varchar(90) not null, 
	disponibilidad varchar(10)not null,
	id_empleado int not null,
	foreign key (id_empleado) references empleado (id_empleado)
)
insert into servicio values (1,12000,'2 Habitaciones-cocina','si', 1);
insert into servicio values (2,13000,'2 Habitaciones-baño','si', 2);
insert into servicio values (3,14000,'2 Habitaciones-televisor','si', 3);
select * from servicio
truncate table servicio
--drop table servicio
go

--INSERTAR TABLA PARA LOS CLIENTES
create table cliente
(
	id_cliente int primary key not null,
	identificacion varchar(30) not null,
	nombre_cliente Varchar(30) not null,
	apellido_cliente Varchar(30) not null,
	telefono_cliente varchar(30) not null,
	dinero decimal (10,2) not null,
	fecha_llegada date not null,
	fecha_salida date not null,
	codigo_servicio int not null,
	foreign key (codigo_servicio) references servicio (cod_servicio)
)
insert into cliente values (1,'100076543','Gerardo','Galindo','4568568',12,GETDATE(),GETDATE(),1);
select * from cliente
truncate table cliente
--drop table cliente

--CREAR TABLA PARA LA FACTURA
create table factura
(
id_factura int primary key,
id_empleado int not null,
cod_servicio int not null,
id_cliente int not null,
fecha date not null,
subtotal decimal (10,2),
iva decimal (10,2),
total_pagar decimal (10,2),
foreign key (id_empleado) references empleado (id_empleado),
foreign key (id_cliente) references cliente (id_cliente),
foreign key (cod_servicio) references servicio (cod_servicio)
)
insert into factura values(1,1,1,1,GETDATE(),12,1.19,14.28)
truncate table factura
select * from factura
--drop table factura
go

--PROCEDIMIENTO PARA LISTAS LOS DATOS DE LA FACTURA
create procedure usp_factura
as
select f.id_factura, (select e.nombre from empleado e where e.id_empleado = f.id_empleado) as nombre_empleado,
(select s.descripcion from servicio s where s.cod_servicio = f.cod_servicio) as descripcion_servicio,
(select c.nombre_cliente from cliente c where c.id_cliente = f.id_cliente) as nombre_cliente, 
f.fecha, f.subtotal, f.iva, f.total_pagar from factura f
execute usp_factura

--PROCEDIMIENTO PARA SELECCIONAR EMPLEADOS 
create procedure usp_select_empleados
as
select 0 as id_empleado, 'Seleccione un Empleado' as nombre
union 
select id_empleado, nombre from empleado
order by id_empleado
execute usp_select_empleados

--PROCEDIMIENTO PARA SELECCIONAR SOLO UN CLIENTE
create procedure usp_select_solo
as
select 0 as id_cliente, 'Seleccione un Cliente' as nombre_cliente
union
select id_cliente, nombre_cliente from cliente
order by id_cliente
execute usp_select_solo

--PROCEMIENTO PARA SELECCIONAR UN SERVICIO
create procedure usp_select_servicio
@id_empleado int
as
select 0 as cod_servicio, 'Seleccione un Servicio' as descripcion
union 
select cod_servicio, descripcion from servicio where id_empleado = @id_empleado
order by cod_servicio
execute usp_select_servicio 1
execute usp_select_servicio 2
execute usp_select_servicio 3


--PROCEDIMIENTO PARA SELECCIONAR CLIENTES
create procedure usp_select_clientes
@cod_servicio int
as
select 0 as id_cliente, 'Seleccione un Cliente' as nombre_cliente
union 
select id_cliente, nombre_cliente from cliente where codigo_servicio = @cod_servicio
order by id_cliente
execute usp_select_clientes 1
execute usp_select_clientes 2
execute usp_select_clientes 3


--PROCEDIMIENTO PARA INSERTAR UN EMPLEADO
create procedure usp_insertar_empleado
@nombre varchar (30),
@telefono varchar (30),
@salario decimal (10,2),
@int_id_empleado int output
as
if not exists (select * from empleado where nombre = @nombre)
	begin
	begin transaction tx 
	declare @intId int 
	set @intId = (select max (id_empleado) + 1 from empleado)
	insert into empleado values (@intId, @nombre, @telefono, @salario)
	if @@ERROR > 0
		begin
			rollback transaction tx 
			set @int_id_empleado = 0 
			select @int_id_empleado 
			return
		end
	else
			commit transaction tx 
			set @int_id_empleado = @intId 
			select @int_id_empleado 
			return
		end
else
	begin 
	set @int_id_empleado = -1 
	select @int_id_empleado 
	return 
end  

/*declare @int_id_empleado int 
exec usp_insertar_empleado 'Ronaldo', '285374', '30', @int_id_empleado output 
select @int_id_empleado*/
select * from empleado


--PROCEDIMIENTOS PARA UN NUEVO SERVICIO
create procedure usp_insertar_servicio
@costo decimal (10,2),
@descripcion varchar (90),
@disponibilidad varchar (10),
@id_empleado int,
@int_cod_servicio int output
as
if not exists (select * from servicio where costo = @costo)
	begin
	begin transaction tx 
	declare @intCod int 
	set @intCod = (select max (cod_servicio) + 1 from servicio)
	insert into servicio values (@intCod, @costo, @descripcion, @disponibilidad, @id_empleado)
	if @@ERROR > 0
		begin
			rollback transaction tx 
			set @int_cod_servicio = 0 
			select @int_cod_servicio 
			return
		end
	else
			commit transaction tx 
			set @int_cod_servicio = @intCod 
			select @int_cod_servicio 
			return
		end
else
	begin 
	set @int_cod_servicio = -1 
	select @int_cod_servicio 
	return 
end 
/*declare @int_cod_servicio int 
exec usp_insertar_servicio 44, 'Restaurante de lujo', 'no', 4, @int_cod_servicio output 
select @int_cod_servicio*/
select * from servicio


--PROCEDIMIENTO PARA INSERTAR UN CLIENTE
create procedure usp_insertar_cliente
@identificacion varchar(30),
@nombre_cliente varchar(30),
@apellido_cliente varchar(30),
@telefono_cliente varchar(30),
@dinero decimal(10,2),
@fecha_llegada date,
@fecha_salida date,
@cod_servicio int,
@int_id_cliente int output
as
if not exists (select * from cliente where identificacion = @identificacion)
	begin
	begin transaction tx 
	declare @intId int 
	set @intId = (select max (id_cliente) + 1 from cliente)
	insert into cliente 
	values (@intId, @identificacion, @nombre_cliente, @apellido_cliente, @telefono_cliente, @dinero, @fecha_llegada, @fecha_salida, @cod_servicio)
	if @@ERROR > 0
		begin
			rollback transaction tx 
			set @int_id_cliente = 0 
			select @int_id_cliente 
			return
		end
	else
			commit transaction tx 
			set @int_id_cliente = @intId 
			select @int_id_cliente 
			return
		end
else
	begin 
	set @int_id_cliente = -1 
	select @int_id_cliente 
	return 
end 
/*declare @int_id_cliente int 
exec usp_insertar_cliente '11', 'Federico', 'Gutierres', '50', 58, '2020-02-02', '2020-02-02', 1, @int_id_cliente output 
select @int_id_cliente*/
select * from cliente
select * from factura
go

--PROCEDIMIENTO PARA GENERAR DETALLE DE FACTURACION
create procedure usp_generar_factura
@id_empleado int,
@cod_servicio int,
@id_cliente int,
@fecha date,
@subtotal decimal (10,2),
@iva decimal (10,2),
@total_a_pagar decimal (10,2),
@int_id_factura int output
as
if not exists (select * from factura where fecha = @fecha)
	begin
	begin transaction tx 
	declare @intId int 
	set @intId = (select max (id_factura) + 1 from factura)
	insert into factura values (@intId, @id_empleado, @cod_servicio, @id_cliente, @fecha, @subtotal, @iva, @total_a_pagar)
	if @@ERROR > 0
		begin
			rollback transaction tx 
			set @int_id_factura = 0 
			select @int_id_factura 
			return
		end
	else
			commit transaction tx 
			set @int_id_factura  = @intId 
			select @int_id_factura  
			return
		end
else
	begin 
	set @int_id_factura  = -1 
	select @int_id_factura 
	return 
end
/*declare @int_id_factura int 
exec usp_generar_factura 1, 2, 3, '06-06-2014', '10-10-2014', '15-10-2014', 18, 1.19, 23.8, @int_id_factura output
select @int_id_factura*/
select * from factura
go

--PROCEDIMIENTO PARA LISTAR EMPLEADOS
create procedure usp_listar_empleados
as
begin
select * from empleado 
end
exec usp_listar_empleados
go

--PROCEDIMIENTO PARA LISTAR SERVICIOS
create procedure usp_listar_servicios
as
begin
select * from servicio
end
exec usp_listar_servicios
go

--PROCEDIMIENTO PARA LISTAR CLIENTES
create procedure usp_listar_clientes
as
begin 
select * from cliente
end
exec usp_listar_clientes
go 

--PROCEDIMIENTO PARA BUSCAR EMPLEADOS
create procedure usp_buscar_empleados
@id_empleado int
as
begin
select * from empleado where id_empleado = @id_empleado
end
exec usp_buscar_empleados 1
go

--PROCEDIMIENTO PARA BUSCAR SERVICIOS
create procedure usp_buscar_servicios
@cod_servicio int
as
begin
select * from servicio where cod_servicio = @cod_servicio
end
exec usp_buscar_servicios 1
go

--PROCEDIMIENTO PARA BUSCAR CLIENTES
create procedure usp_buscar_clientes
@id_cliente int
as
begin 
select * from cliente where id_cliente = @id_cliente
end
exec usp_buscar_clientes 1
go 

--PROCEDIMIENTO PARA BORRAR EMPLEADO
create procedure usp_borrar_empleado
@id_empleado int
as
begin
delete empleado where id_empleado = @id_empleado
end
execute usp_borrar_empleado 5
go

--PROCEDIMIENTO PARA BORRAR SERVICIO
create procedure usp_borrar_servicio
@cod_servicio int
as
begin
delete servicio where cod_servicio = @cod_servicio
end
execute usp_borrar_servicio 1
go

--PROCEDIMIENTO PARA BORRAR CLIENTE
create procedure usp_borrar_cliente
@id_cliente int
as
begin
delete cliente where id_cliente = @id_cliente
end
execute usp_borrar_cliente 1

--CREAMOS TABLA PARA EL INICIO DE SESION
create table usuario
(
	id int identity primary key,
	usuario varchar(30),
	contrasena varchar(30)
)
insert into usuario (usuario,contrasena) values('jose','987')
go

--CREAMOS PROCEDIMIENTO ALMACENADO PARA VALIDAR EL USUARIO
create procedure usp_validar
@usuario varchar(30),
@contrasena varchar(30)
as 
begin
select * from usuario where usuario=@usuario and contrasena=@contrasena
end
exec usp_validar 'jose@gmail.com', 'hey'
go

--CREAMOS PROCEDIMIENTO PAR EL CAMBIO DE CONTRASEÑA
create procedure usp_cambio_clave
@usuario varchar(30),
@contrasena varchar(30)
as
begin
update usuario set contrasena = @contrasena where usuario = @usuario
end
exec usp_cambio_clave 'jose@gmail.com', 'juan'
select * from usuario
go

--CREAR PROCEDIMIENTO ALMACENADO PARA CONSULTAR CORREO
create procedure usp_buscar_correo
@usuario varchar(30)
as
begin
select * from usuario where usuario = @usuario
end
exec usp_buscar_correo 'jose@gmail.com'

--PRIMERO CREAR LA TABLA CORRESPONDIENTE PARA GUARDAR HISTORIALES
create table historial
(
	cliente int,
	descripcion varchar(100),
	fecha date
)
go

--CREAR TRIGGER PARA PAGO DE SERVICIO
create trigger tr_pago
on factura after insert
as
set nocount on 
update cliente set cliente.dinero = cliente.dinero - inserted.total_pagar from inserted
inner join cliente on cliente.id_cliente = inserted.id_cliente

--HACEMOS LA INSERCION DE FACTURA ESPECIFICANDO EL CLIENTE QUE LA PAGA
insert into factura values(2,2,1,1,GETDATE(),45,1.19,34.24)
delete from factura where id_factura = 2
go

--CREAR UN TRIGGER QUE GUARDE UN HISTORICO DE LOS CLIENTES QUE PAGARON
create trigger tr_historial_registro
on cliente for insert
as
set nocount on
declare @id_cliente int
select @id_cliente = id_cliente from inserted
insert into historial values(@id_cliente, 'Registro insertado',  GETDATE())
go 
truncate table historial
select * from factura
select * from cliente
select * from historial
delete from factura where id_factura = 1
insert into cliente values (1,'100076846','Ivan','Uribe','4568568',99,GETDATE(),GETDATE(),1);

--CREAR UNA TABLA PARA EL HISTORIAL DE ELIMINACION
create table historial_borrado
(
	cliente int,
	descripcion varchar(100),
	fecha date
)
go

--CREAR UN TRIGGER QUE MUESTRE UN HISTORICO DE CLIENTES ELIMINADOS DEL SISTEMA
create trigger tr_historial_eliminacion
on cliente for delete
as
set nocount on
declare @id_cliente int
select @id_cliente = id_cliente from deleted
insert into historial_borrado values(@id_cliente, 'Registro eliminado',  GETDATE())

truncate table historial_borrado
select * from historial_borrado
select * from historial
select * from cliente
delete from cliente where id_cliente = 2
go

--CREAR TRIGGER PARA INSERTAR ELIMINADO Y BORRAR INSERTADO ESPECIFICADO
create trigger tr_inserte_elimine
on cliente for delete
as
set nocount on
declare @id_cliente int
select @id_cliente = id_cliente from deleted
delete from historial where cliente = @id_cliente
go

--CREAR PROCEDIMIENTO PARA AUMENTAR EL PRECIO DEL SERVICIO
create procedure usp_aumentar_precio_servicio
@cod_servicio int,
@costo decimal (10,2)
as
begin
update servicio set costo = @costo where cod_servicio = @cod_servicio
end

execute usp_aumentar_precio_servicio 1, 15
select * from servicio