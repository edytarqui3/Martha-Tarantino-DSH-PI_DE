use supermercados;

-- DROP TABLE IF EXISTS producto;
-- DROP TABLE IF EXISTS venta;
-- DROP TABLE IF EXISTS sucursal;

-- Creamos la tabla que auditará a los usuarios que realizan cambios
-- sirve para controlar luego de las cargas

-- Creamos la tabla que llevara una cuenta de los registros.
DROP TABLE IF EXISTS venta_registros;
CREATE TABLE IF NOT EXISTS venta_registros (
  	idCantidadReg 	INT NOT NULL AUTO_INCREMENT,
	cantidadRegistros INT,
	usuario VARCHAR (20),
	fecha DATETIME,
	PRIMARY KEY (idCantidadReg)
);

DROP TRIGGER IF EXISTS venta_registros;
CREATE TRIGGER venta_registros AFTER INSERT ON venta
FOR EACH ROW
INSERT INTO venta_registros (cantidadRegistros, usuario, fecha)
VALUES ((SELECT count(*) FROM fact_venta), current_user(), now());

select avg(precio) from venta;
