--	CREACIÓN DE LA BASE	--
CREATE DATABASE Programasy;
use Programasy;

--	CREACIONES DE TABLAS	--
CREATE TABLE Cursos (
Codigo_Curso INT PRIMARY KEY, 
Nombre VARCHAR (50), 
Codigo_Empleado int
);

CREATE TABLE Usuarios (
Codigo_Usuario INT PRIMARY KEY, 
Nombre VARCHAR (30), 
Apellido VARCHAR (30),
Edad VARCHAR (2),
Correo varchar(40),
Direccion varchar(50),
Telefono varchar(15),
Codigo_Curso int,
Codigo_Estado int
);

CREATE TABLE Proveedores (
Codigo_Proveedor INT PRIMARY KEY, 
Nombre VARCHAR (30), 
Telefono VARCHAR (15), 
Correo VARCHAR (30), 
Codigo_Producto int
);

CREATE TABLE Empleados (
Codigo_Empleado INT PRIMARY KEY, 
Nombre VARCHAR (20), 
Apellido VARCHAR (20), 
Teléfono VARCHAR (10),
Correo VARCHAR (30), 
Edad VARCHAR (2),
Direccion VARCHAR (30),  
Cargo varchar(20)
);

CREATE TABLE Productos (
Codigo_Producto INT PRIMARY KEY, 
Nombre VARCHAR (20)
);

CREATE TABLE Estados (
Codigo_Estado INT PRIMARY KEY, 
Estado VARCHAR (20)
);

--	RELACIÓN DE LAS TABLAS	--
ALTER TABLE Proveedores 
ADD CONSTRAINT fk_AProducts FOREIGN KEY (Codigo_Producto) REFERENCES Productos(Codigo_Producto);

ALTER TABLE Usuarios 
ADD CONSTRAINT fk_ACursos FOREIGN KEY (Codigo_Curso) REFERENCES Cursos(Codigo_Curso);

ALTER TABLE Cursos 
ADD CONSTRAINT fk_AEmpleados FOREIGN KEY (Codigo_Empleado) REFERENCES Empleados(Codigo_Empleado);

ALTER TABLE Usuarios 
ADD CONSTRAINT fk_AEstados FOREIGN KEY (Codigo_Estado) REFERENCES Estados(Codigo_Estado);


--	INSERCIÓN DE DATOS EN LAS DIFERENTES TABLAS	--
INSERT INTO empleados VALUES (10928839,'Ana','Nuñez','3289173889','anamaria@gmail.com',23, 'Cra 74 #596-384','Diseñador'); 
INSERT INTO empleados VALUES (48826773,'Mario','Galindo','7354579274','mariozz@gmail.com',44, 'Av Jimenes 3783-34','Programador'); 
INSERT INTO empleados VALUES (99177387,'Juan','Ramires','3129647583','juan07@yahoo.com',52, 'Calle 182#7243-29','Diseñador');
INSERT INTO empleados VALUES (22334455,'Raul','Rodriguez','3118246700','rarodriguez@gmail.com',28, 'Tv 1902 912a- 64','Programador');
INSERT INTO empleados VALUES (98264736,'Leidy','Castillo','3008269367','castilloalto@gmail.com',34, 'Av 198S # 193-2983','Gestor DB');
INSERT INTO empleados VALUES (38849379,'Julian','Jimenez','5002783826','julianju@hotmail.com',41, 'Cra 1937  1829h -937','Asesor');
INSERT INTO empleados VALUES (00288923,'Eulices','Salazar','3339274378','Eulsa18298@gmail.com',18, 'Av 847 # 193F-273','Asesor');
INSERT INTO empleados VALUES (10028738,'Gerardo','Guzman','1002872364','starboy2743@gmail.com',64, 'Calle 2644# 2876S-826','Abogado');


INSERT INTO estados VALUES (1,'Activo');
INSERT INTO estados VALUES (2,'Inactivo');
INSERT INTO estados VALUES (3,'Por certificar');
INSERT INTO estados VALUES (4,'Certificado');


INSERT INTO Productos VALUES (100,'Hardware');
INSERT INTO Productos VALUES (200,'Software');
INSERT INTO Productos VALUES (300,'Hosting');


INSERT INTO proveedores VALUES(1000,'Tecapp','57328356','tecappsoport@tecapp.com.co',200);
INSERT INTO proveedores VALUES(1001,'Microsoft','+1992763729','sales@microsoft.com.co',100);
INSERT INTO proveedores VALUES(1002,'Microsoft','+1992763729','sales@microsoft.com.co',200);
INSERT INTO proveedores VALUES(1003,'Servic','45838629','AgentServic@servic.com.co',300); 
INSERT INTO proveedores VALUES(1004,'Asus','26839782','Ventaasus@asus.jp.co',100);


INSERT INTO cursos VALUES(1,'Fundamentos', 48826773);
INSERT INTO cursos VALUES(2,'Python',48826773);
INSERT INTO cursos VALUES(3,'JavaScript',22334455);
INSERT INTO cursos VALUES(4,'CSS',99177387);
INSERT INTO cursos VALUES(5,'HTML',22334455);


INSERT INTO usuarios VALUES (78237882, 'Antonio', 'Solis',39, 'sinotehubierasido@gmail.com','Dg 164 # 9962-1', '3205143808',1,1); 
INSERT INTO usuarios VALUES (19191927, 'Auron', 'Yutub',16,'wallapop@gmail.com', 'Cra 290#286-3286 Este', '320380888',  2, 1); 
INSERT INTO usuarios VALUES (58838748, 'Miss', 'Fortune',42,'haganleunbuf@gmail.com', 'Via Sogamoso-Duitama 128-34', '3154350986',  3,2);
INSERT INTO usuarios VALUES (77728638, 'Yoiber', 'Rojas',22,'miketowers@gmail.com', 'Calle 777 # 183- 183', '3154312675',  1,3);
INSERT INTO usuarios VALUES (88776672, 'Yone', 'Yasuo',23,'yonedif@gmail.com', 'Tv Carolina 1273-327', '3154112121',  1,3);
INSERT INTO usuarios VALUES (33322734, 'Vayne', 'Adeca',22,'voyfedeado@gmail.com', 'Wall Street 123-789', '3154350123',  2,2);
INSERT INTO usuarios VALUES (65656483, 'Olga', 'Buitrago',32,'obuitr4g0@gmail.com', 'Far Away 999-888', '3002664826',  4,3);
INSERT INTO usuarios VALUES (10203040, 'Samantha', 'Powers',18,'Samith011@gmail.com', 'Calle 9873 # 0001 A- 1823 North', '1000284362',  5,4);
INSERT INTO usuarios VALUES (81392849, 'James', 'Powers',20,'JpowerFULL@gmail.com', 'Av Wile Palace 123-182', '2229376187',  4,4);
INSERT INTO usuarios VALUES (91929394, 'Selena', 'Quintanilla',45,'ChicoApto512@gmail.com', 'Calle 1823#182-176 sur', '7726748270',  1, 1);

--	CREACIÓN DE LA FUNCIÓN PARA "nuevoEmple" INGRESAR NUEVOS EMPLEADOS	--
delimiter //
CREATE function nuevoEmple(cedula int, nombre varchar(20), apellido varchar(20),telefono varchar(10),correo varchar(30),edad varchar(2),direcc varchar(30),cargo varchar(20)) RETURNS VARCHAR(100)
BEGIN
		insert into empleados(Codigo_Empleado,Nombre,Apellido,Teléfono,Correo,Edad,Direccion,Cargo) values(cedula,nombre,apellido,telefono,correo,edad,direcc,cargo);
		RETURN 'Empleado creado con existo';
END;
//

--	LLAMAMOS LA FUNCIÓN INDICANDOLE LOS DATOS DEL NUEVO EMPLEADO	--
select nuevoEmple(11111,'Pedro','Fernandez','+57626532','pfernan@hotmail.com',35,'Ave 123#1233-243','Diseñador');

--	VISUALIZAMOS LA TABLA PARA VERIFICAR QUE SE HAYA INGRESADO EL NUEVO EMPLEADO	--
select * from empleados;
