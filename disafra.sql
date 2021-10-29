CREATE DATABASE DISAFRA;
USE DISAFRA;

-- TABLAS --

CREATE TABLE IF NOT EXISTS TIPO_TELEFONO(
	ID_TIPO_TELEFONO INT NOT NULL,
	TIPO VARCHAR(15)
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS TELEFONO(
	NUM_TELEFONO VARCHAR(16) NOT NULL,
	TIPO_TELEFONO_ID INT,
	EXTENSION VARCHAR(5)
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS PERSONA(
	ID_PERSONA INT NOT NULL,
	NOMBRE VARCHAR(50) NOT NULL,
	APELLIDO VARCHAR(50) NOT  NULL,
	FECHA_NACIMIENTO DATE NOT NULL,
	EDAD INT NOT NULL,
    TELEFONO_NUM VARCHAR(16),
    DIRECCION_ID INT
)ENGINE=InnoDB;

CREATE TABLE DEPARTAMENTO(
	ID_DEPARTAMENTO INT NOT NULL,
	DEPARTAMENTO VARCHAR(25)
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS MUNICIPIO(
	ID_MUNICIPIO INT NOT NULL,
	MUNICIPIO VARCHAR(35) NOT NULL,
	DEPARTAMENTO_ID INT
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS DIRECCION(
	ID_DIRECCION INT NOT NULL,
	DIRECCION VARCHAR(150) NOT NULL,
	REFERENCIA VARCHAR(150) NULL,
	MUNICIPIO_ID INT
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS CLIENTE(
	NIT_CLIENTE VARCHAR(15) NOT NULL,
	PERSONA_ID INT,
	MAYORISTA TINYINT(1) NOT NULL
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS SUCURSAL(
	ID_SUCURSAL INT NOT NULL,
	NOMBRE VARCHAR(35) NOT NULL,
	CORREO VARCHAR(100) NOT NULL,
	DIRECCION_ID INT,
	TELEFONO_NUM VARCHAR(16)
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS USUARIO_SUCURSAL(
	USUARIO_SUCURSAL VARCHAR(50) NOT NULL,
	PASS VARCHAR(64) NOT NULL,
	ACTIVO TINYINT(1) NOT NULL,
	FECHA_CREADO DATE,
	SUCURSAL_ID INT
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS PERMISO(
    NUM_PERMISO INT NOT NULL,
	PERMISO VARCHAR(30) NOT NULL
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS DETALLE_PERMISO(
	ID_DETALLE_PERMISO INT NOT NULL,
	SUCURSAL_USUARIO VARCHAR(50),
    PERMISO_NUM INT
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS PUESTO(
	ID_PUESTO INT NOT NULL,
	NOMBRE VARCHAR(50) NOT NULL,
	REQUISITOS VARCHAR(255),
	DESCRIPCION VARCHAR(255),
	SALARIO DECIMAL(7,2) NOT NULL,
	HORARIO_ENTRADA TIME NOT NULL,
	HORARIO_SALIDA TIME NOT NULL,
	JEFE_PUESTO INT
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS EMPLEADO(
	COD_EMPLEADO INT NOT NULL,
	PASS VARCHAR(64) NOT NULL,
	PERSONA_ID INT,
	CORREO VARCHAR(100) NULL,
    SUCURSAL_ID INT,
	PUESTO_ID INT
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS PROVEEDOR(
	ID_PROVEEDOR INT NOT NULL,
	NOMBRE VARCHAR(35) NOT NULL,
	CORREO VARCHAR(100) NOT NULL,
	DIRECCION_ID INT,
	TELEFONO_NUM VARCHAR(16)
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS VISITADOR(
	ID_VISITADOR INT,
	PERSONA_ID INT,
	PROVEEDOR_ID INT
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS MARCA(
	ID_MARCA INT NOT NULL,
	MARCA VARCHAR(35) NOT NULL
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS CATEGORIA(
	ID_CATEGORIA INT NOT NULL,
	NOMBRE VARCHAR(35) NOT NULL,
	DESCRIPCION VARCHAR(255) NULL,
    CATEGORIA INT
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS PRODUCTO(
	COD_PRODUCTO VARCHAR(25) NOT NULL,
	NOMBRE VARCHAR(35) NOT NULL,
	DESCRIPCION VARCHAR(255) NULL,
	PORCENTAJE_GANANCIA DECIMAL(4,2) NOT NULL,
	PRECIO_VENTA DECIMAL(7,2) NOT NULL,
	FECHA_AGREGADO DATE NOT NULL,
	FECHA_VENCIMIENTO DATE NOT NULL,
	RECIEN_INGRESO TINYINT(1) NOT NULL,
	CANTIDAD INT NOT NULL,
	MARCA_ID INT,
	SUCURSAL_ID INT,
	CATEGORIA_ID INT
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS DETALLE_PRODUCTO(
	ID_DETALLE_PRODUCTO INT NOT NULL,
	PROVEEDOR_ID INT,
	PRODUCTO_COD VARCHAR(25),
	PRECIO_COSTO DECIMAL(7,2) NOT NULL
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS COMPRA(
	NUM_COMPRA INT NOT NULL,
	DESCRIPCION VARCHAR(255) NULL,
	TOTAL DECIMAL(7,2) NOT NULL,
	TOTAL_PAGADO DECIMAL(7,2) NOT NULL,
	PAGADO TINYINT(1) NOT NULL,
	FECHA_COMPRA DATE NOT NULL,
	ENTREGADO TINYINT(1) NOT NULL,
	FECHA_ENTREGADO DATE NOT NULL,
	VISITADOR_ID INT,
	EMPLEADO_COD INT
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS DETALLE_COMPRA(
	ID_DETALLE_COMPRA INT NOT NULL,
	DETALLE_PRODUCTO_ID INT,
	CANTIDAD INT NOT NULL,
	SUBTOTAL DECIMAL(7,2) NOT NULL,
	COMPRA_NUM INT
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS PAGO_COMPRA(
	NUM_PAGO INT NOT NULL,
	DESCRIPCION VARCHAR(255) NULL,
	FECHA_PAGO DATE NOT NULL,
	CANTIDAD_PAGADA DECIMAL(7,2) NOT NULL,
	EMPLEADO_COD INT,
    COMPRA_NUM INT
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS VENTA(
	NUM_VENTA INT NOT NULL,
	CLIENTE_NIT VARCHAR(15),
	EMPLEADO_COD INT,
	SUCURSAL_ID INT,
	FECHA_VENTA DATE NOT NULL,
	TOTAL DECIMAL(7,2) NOT NULL
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS DESCUENTO(
	COD_DESCUENTO VARCHAR(25) NOT NULL,
	PORCENTAJE DECIMAL(4,2) NOT NULL,
	DESCRIPCION VARCHAR(255)
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS DETALLE_VENTA(
	ID_DETALLE_VENTA INT NOT NULL,
	PRODUCTO_COD VARCHAR(25),
	VENTA_NUM INT,
	DESCUENTO_COD VARCHAR(25),
	CANTIDAD INT NOT NULL,
	SUBTOTAL DECIMAL(7,2) NOT NULL
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS COTIZACION(
	NUM_COTIZACION INT NOT NULL,
	CLIENTE_NIT VARCHAR(15),
	EMPLEADO_COD INT,
	SUCURSAL_ID INT,
	FECHA_VENTA DATE NOT NULL,
	TOTAL DECIMAL(7,2) NOT NULL
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS DETALLE_COTIZACION(
	ID_DETALLE_COTIZACION INT NOT NULL,
	PRODUCTO_COD VARCHAR(25),
	COTIZACION_NUM INT,
	DESCUENTO_COD VARCHAR(25),
	CANTIDAD INT NOT NULL,
	SUBTOTAL DECIMAL(7,2) NOT NULL
)ENGINE=InnoDB;

-- CONSTRAINT PRIMARY KEY --

ALTER TABLE PERSONA
ADD CONSTRAINT PK_PERSONA
PRIMARY KEY(ID_PERSONA);

ALTER TABLE TIPO_TELEFONO
ADD CONSTRAINT PK_TIPO_TELEFONO
PRIMARY KEY(ID_TIPO_TELEFONO);

ALTER TABLE TELEFONO
ADD CONSTRAINT PK_TELEFONO
PRIMARY KEY(NUM_TELEFONO);

ALTER TABLE DEPARTAMENTO
ADD CONSTRAINT PK_DEPARTAMENTO
PRIMARY KEY(ID_DEPARTAMENTO);

ALTER TABLE MUNICIPIO
ADD CONSTRAINT PK_MUNICIPIO
PRIMARY KEY(ID_MUNICIPIO);

ALTER TABLE DIRECCION
ADD CONSTRAINT PK_DIRECCION
PRIMARY KEY(ID_DIRECCION);

ALTER TABLE CLIENTE
ADD CONSTRAINT PK_CLIENTE
PRIMARY KEY(NIT_CLIENTE);

ALTER TABLE PUESTO
ADD CONSTRAINT PK_PUESTO
PRIMARY KEY(ID_PUESTO);

ALTER TABLE EMPLEADO
ADD CONSTRAINT PK_EMPLEADO
PRIMARY KEY(COD_EMPLEADO);

ALTER TABLE SUCURSAL
ADD CONSTRAINT PK_SUCURSAL
PRIMARY KEY(ID_SUCURSAL);

ALTER TABLE USUARIO_SUCURSAL
ADD CONSTRAINT PK_USUARIO_SUCURSAL
PRIMARY KEY(USUARIO_SUCURSAL);

ALTER TABLE PERMISO
ADD CONSTRAINT PK_PERMISO
PRIMARY KEY(NUM_PERMISO);

ALTER TABLE DETALLE_PERMISO
ADD CONSTRAINT PK_DETALLE_PERMISO
PRIMARY KEY(ID_DETALLE_PERMISO);

ALTER TABLE PROVEEDOR
ADD CONSTRAINT PK_PROVEEDOR
PRIMARY KEY(ID_PROVEEDOR);

ALTER TABLE VISITADOR
ADD CONSTRAINT PK_VISITADOR
PRIMARY KEY(ID_VISITADOR);

ALTER TABLE MARCA
ADD CONSTRAINT PK_MARCA
PRIMARY KEY(ID_MARCA);

ALTER TABLE CATEGORIA
ADD CONSTRAINT PK_CATEGORIA
PRIMARY KEY(ID_CATEGORIA);

ALTER TABLE PRODUCTO
ADD CONSTRAINT PK_PRODUCTO
PRIMARY KEY(COD_PRODUCTO);

ALTER TABLE DETALLE_PRODUCTO
ADD CONSTRAINT PK_DETALLE_PRODUCTO
PRIMARY KEY(ID_DETALLE_PRODUCTO);

ALTER TABLE COMPRA
ADD CONSTRAINT PK_COMPRA
PRIMARY KEY(NUM_COMPRA);

ALTER TABLE DETALLE_COMPRA
ADD CONSTRAINT PK_DETALLE_COMPRA
PRIMARY KEY(ID_DETALLE_COMPRA);

ALTER TABLE PAGO_COMPRA
ADD CONSTRAINT PK_PAGO_COMPRA
PRIMARY KEY(NUM_PAGO);

ALTER TABLE VENTA
ADD CONSTRAINT PK_VENTA
PRIMARY KEY(NUM_VENTA);

ALTER TABLE DESCUENTO
ADD CONSTRAINT PK_DESCUENTO
PRIMARY KEY(COD_DESCUENTO);

ALTER TABLE DETALLE_VENTA
ADD CONSTRAINT PK_DETALLE_VENTA
PRIMARY KEY(ID_DETALLE_VENTA);

ALTER TABLE COTIZACION
ADD CONSTRAINT PK_COTIZACION
PRIMARY KEY(NUM_COTIZACION);

ALTER TABLE DETALLE_COTIZACION
ADD CONSTRAINT PK_DETALLE_COTIZACION
PRIMARY KEY(ID_DETALLE_COTIZACION);

-- CONSTRAINT FOREIGN KEY --

ALTER TABLE TELEFONO
ADD CONSTRAINT FK_TELEFONO_TIPOTELEFONO
FOREIGN KEY(TIPO_TELEFONO_ID) REFERENCES TIPO_TELEFONO(ID_TIPO_TELEFONO)
ON DELETE SET NULL;

ALTER TABLE PERSONA
ADD CONSTRAINT FK_PERSONA_TELEFONO
FOREIGN KEY(TELEFONO_NUM) REFERENCES TELEFONO(NUM_TELEFONO)
ON DELETE SET NULL;

ALTER TABLE PERSONA
ADD CONSTRAINT FK_PERSONA_DIRECCION
FOREIGN KEY(DIRECCION_ID) REFERENCES DIRECCION(ID_DIRECCION)
ON DELETE SET NULL;

ALTER TABLE MUNICIPIO
ADD CONSTRAINT FK_MUNICIPIO_DEPARTAMENTO
FOREIGN KEY(DEPARTAMENTO_ID) REFERENCES DEPARTAMENTO(ID_DEPARTAMENTO)
ON DELETE SET NULL;

ALTER TABLE DIRECCION
ADD CONSTRAINT FK_DIRECCION_MUNICIPIO
FOREIGN KEY(MUNICIPIO_ID) REFERENCES MUNICIPIO(ID_MUNICIPIO)
ON DELETE SET NULL;

ALTER TABLE CLIENTE
ADD CONSTRAINT FK_CLIENTE_PERSONA
FOREIGN KEY(PERSONA_ID) REFERENCES PERSONA(ID_PERSONA)
ON DELETE SET NULL;

ALTER TABLE SUCURSAL
ADD CONSTRAINT FK_SUCURSAL_DIRECCION
FOREIGN KEY(DIRECCION_ID) REFERENCES DIRECCION(ID_DIRECCION)
ON DELETE SET NULL;

ALTER TABLE SUCURSAL
ADD CONSTRAINT FK_SUCURSAL_TELEFONO
FOREIGN KEY(TELEFONO_NUM) REFERENCES TELEFONO(NUM_TELEFONO)
ON DELETE SET NULL;

ALTER TABLE USUARIO_SUCURSAL
ADD CONSTRAINT FK_USUARIOSUCURSAL_SUCURSAL
FOREIGN KEY(SUCURSAL_ID) REFERENCES SUCURSAL(ID_SUCURSAL)
ON DELETE SET NULL;

ALTER TABLE DETALLE_PERMISO
ADD CONSTRAINT FK_DETALLEPERMISO_PERMISO
FOREIGN KEY(PERMISO_NUM) REFERENCES PERMISO(NUM_PERMISO)
ON DELETE SET NULL;

ALTER TABLE DETALLE_PERMISO
ADD CONSTRAINT FK_DETALLEPERMISO_USUARIOSUCURSAL
FOREIGN KEY(SUCURSAL_USUARIO) REFERENCES USUARIO_SUCURSAL(USUARIO_SUCURSAL)
ON DELETE SET NULL;

ALTER TABLE PUESTO
ADD CONSTRAINT FK_PUESTO_PUESTO
FOREIGN KEY(JEFE_PUESTO) REFERENCES PUESTO(ID_PUESTO)
ON DELETE SET NULL;

ALTER TABLE EMPLEADO
ADD CONSTRAINT FK_EMPLEADO_PERSONA
FOREIGN KEY(PERSONA_ID) REFERENCES PERSONA(ID_PERSONA)
ON DELETE SET NULL;

ALTER TABLE EMPLEADO
ADD CONSTRAINT FK_EMPLEADO_PUESTO
FOREIGN KEY(PUESTO_ID) REFERENCES PUESTO(ID_PUESTO)
ON DELETE SET NULL;

ALTER TABLE EMPLEADO
ADD CONSTRAINT FK_EMPLEADO_SUCURSAL
FOREIGN KEY(SUCURSAL_ID) REFERENCES SUCURSAL(ID_SUCURSAL)
ON DELETE SET NULL;

ALTER TABLE PROVEEDOR
ADD CONSTRAINT FK_PROVEEDOR_DIRECCION
FOREIGN KEY(DIRECCION_ID) REFERENCES DIRECCION(ID_DIRECCION)
ON DELETE SET NULL;

ALTER TABLE PROVEEDOR
ADD CONSTRAINT FK_PROVEEDOR_TELEFONO
FOREIGN KEY(TELEFONO_NUM) REFERENCES TELEFONO(NUM_TELEFONO)
ON DELETE SET NULL;

ALTER TABLE VISITADOR
ADD CONSTRAINT FK_VISITADOR_PERSONA
FOREIGN KEY(PERSONA_ID) REFERENCES PERSONA(ID_PERSONA)
ON DELETE SET NULL;

ALTER TABLE VISITADOR
ADD CONSTRAINT FK_VISITADOR_PROVEEDOR
FOREIGN KEY(PROVEEDOR_ID) REFERENCES PROVEEDOR(ID_PROVEEDOR)
ON DELETE SET NULL;

ALTER TABLE CATEGORIA
ADD CONSTRAINT FK_SUBCATEGORIA_CATEGORIA
FOREIGN KEY(CATEGORIA) REFERENCES CATEGORIA(ID_CATEGORIA)
ON DELETE SET NULL;

ALTER TABLE PRODUCTO
ADD CONSTRAINT FK_PRODUCTO_MARCA
FOREIGN KEY(MARCA_ID) REFERENCES MARCA(ID_MARCA)
ON DELETE SET NULL;

ALTER TABLE PRODUCTO
ADD CONSTRAINT FK_PRODUCTO_SUCURSAL
FOREIGN KEY(SUCURSAL_ID) REFERENCES SUCURSAL(ID_SUCURSAL)
ON DELETE SET NULL;

ALTER TABLE PRODUCTO
ADD CONSTRAINT FK_PRODUCTO_SUBCATEGORIA
FOREIGN KEY(CATEGORIA_ID) REFERENCES CATEGORIA(ID_CATEGORIA)
ON DELETE SET NULL;

ALTER TABLE DETALLE_PRODUCTO
ADD CONSTRAINT FK_DETALLEPRODUCTO_PROVEEDOR
FOREIGN KEY(PROVEEDOR_ID) REFERENCES PROVEEDOR(ID_PROVEEDOR)
ON DELETE SET NULL;

ALTER TABLE DETALLE_PRODUCTO
ADD CONSTRAINT FK_DETALLEPRODUCTO_PRODUCTO
FOREIGN KEY(PRODUCTO_COD) REFERENCES PRODUCTO(COD_PRODUCTO)
ON DELETE SET NULL;

ALTER TABLE COMPRA
ADD CONSTRAINT FK_COMPRA_VISITADOR
FOREIGN KEY(VISITADOR_ID) REFERENCES VISITADOR(ID_VISITADOR)
ON DELETE SET NULL;

ALTER TABLE COMPRA
ADD CONSTRAINT FK_COMPRA_EMPLEADO
FOREIGN KEY(EMPLEADO_COD) REFERENCES EMPLEADO(COD_EMPLEADO)
ON DELETE SET NULL;

ALTER TABLE DETALLE_COMPRA
ADD CONSTRAINT FK_DETALLECOMPRA_DETALLEPRODUCTO
FOREIGN KEY(DETALLE_PRODUCTO_ID) REFERENCES DETALLE_PRODUCTO(ID_DETALLE_PRODUCTO)
ON DELETE SET NULL;

ALTER TABLE DETALLE_COMPRA
ADD CONSTRAINT FK_DETALLECOMPRA_COMPRA
FOREIGN KEY(COMPRA_NUM) REFERENCES COMPRA(NUM_COMPRA)
ON DELETE SET NULL;

ALTER TABLE PAGO_COMPRA
ADD CONSTRAINT FK_PAGOCOMPRA_EMPLEADO
FOREIGN KEY(EMPLEADO_COD) REFERENCES EMPLEADO(COD_EMPLEADO)
ON DELETE SET NULL;

ALTER TABLE PAGO_COMPRA
ADD CONSTRAINT FK_PAGOCOMPRA_COMPRA
FOREIGN KEY(COMPRA_NUM) REFERENCES COMPRA(NUM_COMPRA)
ON DELETE SET NULL;

ALTER TABLE VENTA
ADD CONSTRAINT FK_VENTA_CLIENTE
FOREIGN KEY(CLIENTE_NIT) REFERENCES CLIENTE(NIT_CLIENTE)
ON DELETE SET NULL;

ALTER TABLE VENTA
ADD CONSTRAINT FK_VENTA_EMPLEADO
FOREIGN KEY(EMPLEADO_COD) REFERENCES EMPLEADO(COD_EMPLEADO)
ON DELETE SET NULL;

ALTER TABLE VENTA
ADD CONSTRAINT FK_VENTA_SUCURSAL
FOREIGN KEY(SUCURSAL_ID) REFERENCES SUCURSAL(ID_SUCURSAL)
ON DELETE SET NULL;

ALTER TABLE DETALLE_VENTA
ADD CONSTRAINT FK_DETALLEVENTA_PRODUCTO
FOREIGN KEY(PRODUCTO_COD) REFERENCES PRODUCTO(COD_PRODUCTO)
ON DELETE SET NULL;

ALTER TABLE DETALLE_VENTA
ADD CONSTRAINT FK_DETALLEVENTA_VENTA
FOREIGN KEY(VENTA_NUM) REFERENCES VENTA(NUM_VENTA)
ON DELETE SET NULL;

ALTER TABLE DETALLE_VENTA
ADD CONSTRAINT FK_DETALLEVENTA_DESCUENTO
FOREIGN KEY(DESCUENTO_COD) REFERENCES DESCUENTO(COD_DESCUENTO)
ON DELETE SET NULL;

ALTER TABLE COTIZACION
ADD CONSTRAINT FK_COTIZACION_CLIENTE
FOREIGN KEY(CLIENTE_NIT) REFERENCES CLIENTE(NIT_CLIENTE)
ON DELETE SET NULL;

ALTER TABLE COTIZACION
ADD CONSTRAINT FK_COTIZACION_EMPLEADO
FOREIGN KEY(EMPLEADO_COD) REFERENCES EMPLEADO(COD_EMPLEADO)
ON DELETE SET NULL;

ALTER TABLE COTIZACION
ADD CONSTRAINT FK_COTIZACION_SUCURSAL
FOREIGN KEY(SUCURSAL_ID) REFERENCES SUCURSAL(ID_SUCURSAL)
ON DELETE SET NULL;

ALTER TABLE DETALLE_COTIZACION
ADD CONSTRAINT FK_DETALLECOTIZACION_PRODUCTO
FOREIGN KEY(PRODUCTO_COD) REFERENCES PRODUCTO(COD_PRODUCTO)
ON DELETE SET NULL;

ALTER TABLE DETALLE_COTIZACION
ADD CONSTRAINT FK_DETALLECOTIZACION_COTIZACION
FOREIGN KEY(COTIZACION_NUM) REFERENCES COTIZACION(NUM_COTIZACION)
ON DELETE SET NULL;

ALTER TABLE DETALLE_COTIZACION
ADD CONSTRAINT FK_DETALLECOTIZACION_DESCUENTO
FOREIGN KEY(DESCUENTO_COD) REFERENCES DESCUENTO(COD_DESCUENTO)
ON DELETE SET NULL;