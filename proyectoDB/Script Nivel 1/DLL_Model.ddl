-- Generado por Oracle SQL Developer Data Modeler 19.1.0.081.0911
--   en:        2019-05-25 10:47:29 COT
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



DROP TABLE cliente CASCADE CONSTRAINTS;

DROP TABLE funcionario CASCADE CONSTRAINTS;

DROP TABLE parametros CASCADE CONSTRAINTS;

DROP TABLE producto CASCADE CONSTRAINTS;

DROP TABLE productosxcliente CASCADE CONSTRAINTS;

DROP TABLE solicitud CASCADE CONSTRAINTS;

DROP TABLE tipoanomalia CASCADE CONSTRAINTS;

DROP TABLE tipoproducto CASCADE CONSTRAINTS;

DROP TABLE tiposolicitud CASCADE CONSTRAINTS;

CREATE TABLE cliente (
    cedulacliente     VARCHAR2(20 CHAR) NOT NULL,
    nombre            VARCHAR2(40 CHAR),
    fechanacimiento   DATE,
    direccion         VARCHAR2(40 CHAR),
    telefono          VARCHAR2(20 CHAR)
);

ALTER TABLE cliente ADD CONSTRAINT cliente_pk PRIMARY KEY ( cedulacliente );

CREATE TABLE funcionario (
    cedulafuncionario   VARCHAR2(20 CHAR) NOT NULL,
    nombre              VARCHAR2(40 CHAR),
    fechanacimiento     DATE,
    direccion           VARCHAR2(40 CHAR),
    telefono            VARCHAR2(20 CHAR)
);

ALTER TABLE funcionario ADD CONSTRAINT funcionario_pk PRIMARY KEY ( cedulafuncionario );

CREATE TABLE parametros (
    idparametros   NUMBER(10) NOT NULL,
    nombre         VARCHAR2(40 CHAR),
    valor          VARCHAR2(20 CHAR)
);

ALTER TABLE parametros ADD CONSTRAINT parametros_pk PRIMARY KEY ( idparametros );

CREATE TABLE producto (
    idproducto                    NUMBER(4) NOT NULL,
    fechaini                      DATE,
    tipoproducto_idtipoproducto   NUMBER(4) NOT NULL
);

ALTER TABLE producto ADD CONSTRAINT producto_pk PRIMARY KEY ( idproducto );

CREATE TABLE productosxcliente (
    producto_idproducto     NUMBER(4) NOT NULL,
    cliente_cedulacliente   VARCHAR2(20 CHAR) NOT NULL,
    fechainicio             DATE,
    fechafin                DATE
);

ALTER TABLE productosxcliente ADD CONSTRAINT productosxcliente_pk PRIMARY KEY ( producto_idproducto,
                                                                                cliente_cedulacliente );

CREATE TABLE solicitud (
    idsolicitud                     NUMBER NOT NULL,
    estado                          VARCHAR2(40 CHAR),
    observacion                     VARCHAR2(40 CHAR),
    fechaini                        DATE,
    fechafin                        DATE,
    tipoanomalia_idanomalia         NUMBER(4) NOT NULL,
    cliente_cedulacliente           VARCHAR2(20 CHAR) NOT NULL,
    tiposolicitud_idtiposolicitud   NUMBER(4) NOT NULL,
    funcionario_cedulafuncionario   VARCHAR2(20 CHAR) NOT NULL,
    tipoproducto_idtipoproducto     NUMBER(4) NOT NULL,
    producto_idproducto             NUMBER(4) NOT NULL
);

ALTER TABLE solicitud ADD CONSTRAINT solicitud_pk PRIMARY KEY ( idsolicitud );

CREATE TABLE tipoanomalia (
    idanomalia   NUMBER(4) NOT NULL,
    nombre       VARCHAR2(40 CHAR)
);

ALTER TABLE tipoanomalia ADD CONSTRAINT tipoanomalia_pk PRIMARY KEY ( idanomalia );

CREATE TABLE tipoproducto (
    idtipoproducto   NUMBER(4) NOT NULL,
    nombre           VARCHAR2(40 CHAR)
);

ALTER TABLE tipoproducto ADD CONSTRAINT tipoproducto_pk PRIMARY KEY ( idtipoproducto );

CREATE TABLE tiposolicitud (
    idtiposolicitud   NUMBER(4) NOT NULL,
    nombre            VARCHAR2(40 CHAR)
);

ALTER TABLE tiposolicitud ADD CONSTRAINT tiposolicitud_pk PRIMARY KEY ( idtiposolicitud );

ALTER TABLE producto
    ADD CONSTRAINT producto_tipoproducto_fk FOREIGN KEY ( tipoproducto_idtipoproducto )
        REFERENCES tipoproducto ( idtipoproducto )
            ON DELETE CASCADE;

ALTER TABLE productosxcliente
    ADD CONSTRAINT productosxcliente_cliente_fk FOREIGN KEY ( cliente_cedulacliente )
        REFERENCES cliente ( cedulacliente )
            ON DELETE CASCADE;

ALTER TABLE productosxcliente
    ADD CONSTRAINT productosxcliente_producto_fk FOREIGN KEY ( producto_idproducto )
        REFERENCES producto ( idproducto )
            ON DELETE CASCADE;

ALTER TABLE solicitud
    ADD CONSTRAINT solicitud_cliente_fk FOREIGN KEY ( cliente_cedulacliente )
        REFERENCES cliente ( cedulacliente )
            ON DELETE CASCADE;

ALTER TABLE solicitud
    ADD CONSTRAINT solicitud_funcionario_fk FOREIGN KEY ( funcionario_cedulafuncionario )
        REFERENCES funcionario ( cedulafuncionario )
            ON DELETE CASCADE;

ALTER TABLE solicitud
    ADD CONSTRAINT solicitud_producto_fk FOREIGN KEY ( producto_idproducto )
        REFERENCES producto ( idproducto )
            ON DELETE CASCADE;

ALTER TABLE solicitud
    ADD CONSTRAINT solicitud_tipoanomalia_fk FOREIGN KEY ( tipoanomalia_idanomalia )
        REFERENCES tipoanomalia ( idanomalia )
            ON DELETE CASCADE;

ALTER TABLE solicitud
    ADD CONSTRAINT solicitud_tipoproducto_fk FOREIGN KEY ( tipoproducto_idtipoproducto )
        REFERENCES tipoproducto ( idtipoproducto )
            ON DELETE CASCADE;

ALTER TABLE solicitud
    ADD CONSTRAINT solicitud_tiposolicitud_fk FOREIGN KEY ( tiposolicitud_idtiposolicitud )
        REFERENCES tiposolicitud ( idtiposolicitud )
            ON DELETE CASCADE;



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             9
-- CREATE INDEX                             0
-- ALTER TABLE                             18
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
