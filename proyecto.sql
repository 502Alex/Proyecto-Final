create table usuarios(
Nit int primary key not null,
Nombre varchar(45),
Contra varchar(45)
);

insert into usuarios values(0123456,'Admin','451278');
commit;

create table cuentas(
Id int primary key not null,
Nombre varchar(45),
Saldo float not null
);


create table Clientes (
Id int primary key not null,
id_cuenta int not null,
Nombre varchar(45),
Cuenta varchar(45),
Dpi varchar(45),
Telefono int not null,
Email varchar (45)
);
/*cada que se ingrese un nuevo cliente se hara una cuenta de forma automatica*/
create or replace trigger t1
after insert on Clientes
for each row
begin
insert into cuentas values(:new.id_cuenta,:new.Nombre,0);
end;

create table Prestamos(
Id_pres int primary key not null,
Id_cuenta int not null,
Prestamo_total float not null,
nit_cliente int not null
);


/* cada vez que se haga un prestamo se va a sumar al saldo de la cuenta del cliente*/
create or replace trigger sam
after insert on Prestamos
for each row 
begin
update cuentas set Saldo = Saldo + :new.Prestamo_total where Id = :new.Id_cuenta;  
end;


create table Transferencias(
Id int primary key not null,
Cuenta_salida int not null,
Cuenta_entrada int not null,
Cantidad float not null
);



create or replace trigger trans
after insert on Transferencias
for each row
begin
update cuentas set Saldo = Saldo - :new.Cantidad where Id = :new.Cuenta_salida;
update cuentas set Saldo = Saldo + :new.Cantidad where Id = :new.Cuenta_entrada;
end;



create table depositos_retiros(
id int primary key not null,
cuenta int not null,
monto float not null,
tipo varchar(35)
);


create or replace trigger dep
after insert on depositos_retiros
for each row
begin 
if :new.tipo = 'deposito' then
update cuentas set Saldo = Saldo + :new.monto where Id = :new.cuenta;
else
update cuentas set Saldo = Saldo - :new.monto where Id = :new.cuenta;
end if;
end;
select user
from dual;
select * from usuarios;