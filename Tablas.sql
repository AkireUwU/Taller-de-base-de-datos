--tabla registrada
CREATE TABLE clientes(
	codigoCliente INT NOT NULL,
	dni VARCHAR(40) NOT NULL,
	nombre VARCHAR(25) NOT NULL,
	pApellido VARCHAR(25) NOT NULL,
	mApellido VARCHAR(25),
	calle VARCHAR(25),
	num CHAR(5),
	ciudad VARCHAR(40) NOT NULL,
	
	CONSTRAINT PK_codigocliente PRIMARY KEY (codigoCliente)
	
);

--tabla registrada
CREATE TABLE telefonoClientes (
	codigoCliente INT NOT NULL,
	telefono CHAR(10) NOT NULL,
	
	CONSTRAINT PK_telefonoClientes PRIMARY KEY (telefono),
	CONSTRAINT PFK_codigoCliente FOREIGN KEY (codigoCliente)
		REFERENCES clientes (codigoCliente) ON DELETE CASCADE ON UPDATE CASCADE 

);
--tabla registrada
CREATE TABLE agencia (
	id_Agencia INT NOT NULL,
	nombre VARCHAR(25) NOT NULL,
	calle VARCHAR(25) NOT NULL,
	num CHAR(5) NOT NULL,
	poblacion VARCHAR(25) NOT NULL,
	
	CONSTRAINT PK_Agencia PRIMARY KEY (id_Agencia)

);

--tabla registrada
CREATE TABLE telefono_Agencia (
	id_Agencia INT NOT NULL,
	telefono CHAR(10) NOT NULL,
	
	CONSTRAINT PK_telefonoAgencia PRIMARY KEY(telefono),
	CONSTRAINT PFK_idAgencia FOREIGN KEY (id_Agencia)
		REFERENCES agencia (id_Agencia) ON DELETE CASCADE ON UPDATE CASCADE

);


CREATE TABLE ciudad (
	nombre_Ciudad VARCHAR(40) NOT NULL,
	numHabitantes VARCHAR(40) NOT NULL,
	provincia VARCHAR(40) NOT NULL,
	numPostal CHAR(5) NOT NULL,

	CONSTRAINT PK_nombreCiudad PRIMARY KEY(nombre_Ciudad)
);


CREATE TABLE garaje (
	nombre_Garaje VARCHAR(40) NOT NULL,
	nombre_Ciudad VARCHAR(40) NOT NULL,
	direccion VARCHAR(40) NOT NULL,
	
	CONSTRAINT PK_nombreGaraje PRIMARY KEY (nombre_Garaje),
	CONSTRAINT PFK_nombreCiudad FOREIGN KEY (nombre_Ciudad)
		REFERENCES ciudad (nombre_Ciudad) ON DELETE CASCADE ON UPDATE CASCADE

);

CREATE TABLE motocicletas (
	matricula VARCHAR(10) NOT NULL,
	numBastidor VARCHAR(25) NOT NULL,
	color VARCHAR(25),
	marca VARCHAR(25) NOT NULL,
	modelo VARCHAR(25) NOT NULL,
	fechaIngreso VARCHAR(25) NOT NULL,
	
	nombre_Ciudad VARCHAR(40) NOT NULL,
	id_Agencia INT NOT NULL,
	
	CONSTRAINT PK_matricula PRIMARY KEY (matricula),
	CONSTRAINT FK1_nombreCiudad FOREIGN KEY (nombre_Ciudad)
		REFERENCES ciudad (nombre_Ciudad) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT FK2_idAgencia FOREIGN KEY (id_Agencia)
		REFERENCES agencia (id_Agencia) ON DELETE CASCADE ON UPDATE CASCADE

);

CREATE TABLE reserva (
	codigoCliente INT NOT NULL,
	id_Agencia INT NOT NULL,
	matricula VARCHAR(10) NOT NULL,
	
	fechaInicio VARCHAR(25) NOT NULL, 
	precio VARCHAR(25) NOT NULL,
	agencia VARCHAR(25) NOT NULL,
	fechaReservacion VARCHAR(25) NOT NULL,
	cliente VARCHAR(25) NOT NULL,
	motoAlquilada VARCHAR(25) NOT NULL,
	fechaFin VARCHAR(25) NOT NULL,
	
	CONSTRAINT PFK1_codigoCliente FOREIGN KEY (codigoCliente)
		REFERENCES clientes (codigoCliente) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT PFK2_idAgencia FOREIGN KEY (id_Agencia)
		REFERENCES agencia (id_Agencia) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT PFK3_matricula FOREIGN KEY (matricula)
		REFERENCES motocicletas (matricula) ON DELETE CASCADE ON UPDATE CASCADE
	

);