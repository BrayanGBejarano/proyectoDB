--Clientes
INSERT INTO CLIENTE VALUES ('1','Sofia','10-ENE-1996','Clle 5 #12-321','12');
INSERT INTO CLIENTE VALUES ('2','Karen','10-FEB-1997','Cra 1 #21-432','13');
INSERT INTO CLIENTE VALUES ('3','Valentina','10-MAR-1995','Cra 19 #45-253','14');
INSERT INTO CLIENTE VALUES ('4','Daniela','10-ABR-1993','Clle 2 #76-345','15');
INSERT INTO CLIENTE VALUES ('5','Carla','10-MAY-1990','Cra 2 #34-123','15');

--funcionario
INSERT INTO FUNCIONARIO VALUES ('1','Carlos','23-JUN-1991','Carrera 56A No. 51 - 81','22');
INSERT INTO FUNCIONARIO VALUES ('2','Felipe','21-JUL-1994','Carrera 22 No. 17-31','23');
INSERT INTO FUNCIONARIO VALUES ('3','Alejandro','29-AGO-1986','Carrera 54 No. 68 - 80 ','24');
INSERT INTO FUNCIONARIO VALUES ('4','Sebastian','12-OCT-1979','Calle 59 No. 27 - 35 ','25');
INSERT INTO FUNCIONARIO VALUES ('5','Nicolas','06-NOV-1990','Carrera 8  No. 20 - 59','26');


--Telefonia: Voz
--Internet: Datos
--Integrado: Voz y Datos

--tipoProducto
INSERT INTO TIPOPRODUCTO VALUES (1,'Voz');
INSERT INTO TIPOPRODUCTO VALUES (2,'Datos');
INSERT INTO TIPOPRODUCTO VALUES (3,'Integrado');


--producto
INSERT INTO PRODUCTO VALUES (1,'06-ENE-2011',1);
INSERT INTO PRODUCTO VALUES (2,'07-FEB-2012',2);
INSERT INTO PRODUCTO VALUES (3,'08-MAR-2013',3);
INSERT INTO PRODUCTO VALUES (4,'09-ABR-2014',1);
INSERT INTO PRODUCTO VALUES (5,'10-MAY-2015',2);

INSERT INTO PRODUCTO VALUES (6,'06-ENE-2011',1);
INSERT INTO PRODUCTO VALUES (7,'07-FEB-2012',2);
INSERT INTO PRODUCTO VALUES (8,'08-MAR-2013',3);
INSERT INTO PRODUCTO VALUES (9,'09-ABR-2014',1);
INSERT INTO PRODUCTO VALUES (10,'10-MAY-2015',2);


INSERT INTO PRODUCTO VALUES (11,'06-ENE-2011',1);
INSERT INTO PRODUCTO VALUES (12,'07-FEB-2012',2);
INSERT INTO PRODUCTO VALUES (13,'08-MAR-2013',3);
INSERT INTO PRODUCTO VALUES (14,'09-ABR-2014',1);
INSERT INTO PRODUCTO VALUES (15,'10-MAY-2015',2);

-- TIPO DE ANOMALIA PUEDEN SER MAS
--tipoAnomalia

INSERT INTO TIPOANOMALIA VALUES (1,'Sin Anomalia');
INSERT INTO TIPOANOMALIA VALUES (2,'Baja Velocidad');
INSERT INTO TIPOANOMALIA VALUES (3,'Mala calidad del servicio');

--tipoSolicitud
--1-5 registro
--5-10 asignacion

--registro: tiene estado de No asignada: creacion o modificacion
--Asignacion: tiene estados de asignada y dentro puede estar: solicitud, retiro,daño y reclamo
 
--Registro
INSERT INTO TIPOSOLICITUD VALUES (1,'Creacion');
INSERT INTO TIPOSOLICITUD VALUES (2, ' Modificacion');
--Asignacion
INSERT INTO TIPOSOLICITUD VALUES (3,'Cancelacion');
INSERT INTO TIPOSOLICITUD VALUES (4,' Daño');
INSERT INTO TIPOSOLICITUD VALUES (5,' Reclamo');

--solicitud
--Una solicitud de registro

INSERT INTO SOLICITUD VALUES (1,'Pendiente','esta solicitud no ha sido asignada','01-ENE-2018','01-FEB-2018','1',1,'3',1,1,1);
INSERT INTO SOLICITUD VALUES (2,'Pendiente','esta solicitud no ha sido asignada','01-ENE-2018','01-FEB-2018','2',1,'2',1,2,2);
INSERT INTO SOLICITUD VALUES (3,'Pendiente','esta solicitud no ha sido asignada','01-ENE-2018','01-FEB-2018','3',1,'1',1,3,3);
INSERT INTO SOLICITUD VALUES (4,'Pendiente','esta solicitud no ha sido asignada','01-ENE-2018','01-FEB-2018','4',1,'5',1,1,4);
INSERT INTO SOLICITUD VALUES (5,'Pendiente','esta solicitud no ha sido asignada','01-ENE-2018','01-FEB-2018','5',1,'4',1,2,5);
INSERT INTO SOLICITUD VALUES (6,'Pendiente','esta solicitud no ha sido asignada','01-ENE-2018','01-FEB-2018','1',1,'1',1,3,6);
INSERT INTO SOLICITUD VALUES (7,'Pendiente','esta solicitud no ha sido asignada','01-ENE-2018','01-FEB-2018','2',1,'2',1,1,7);
INSERT INTO SOLICITUD VALUES (8,'Pendiente','esta solicitud no ha sido asignada','01-ENE-2018','01-FEB-2018','3',1,'3',1,2,8);
INSERT INTO SOLICITUD VALUES (9,'Pendiente','esta solicitud no ha sido asignada','01-ENE-2018','01-FEB-2018','4',1,'4',1,3,9);
INSERT INTO SOLICITUD VALUES (10,'Pendiente','esta solicitud no ha sido asignada','01-ENE-2018','01-FEB-2018','5',1,'5',1,1,10);
INSERT INTO SOLICITUD VALUES (11,'Pendiente','esta solicitud no ha sido asignada','01-ENE-2018','01-FEB-2018','1',1,'5',1,2,11);
INSERT INTO SOLICITUD VALUES (12,'Pendiente','esta solicitud no ha sido asignada','01-ENE-2018','01-FEB-2018','2',1,'4',1,3,13);
INSERT INTO SOLICITUD VALUES (13,'Pendiente','esta solicitud no ha sido asignada','01-ENE-2018','01-FEB-2018','3',1,'3',1,1,12);
INSERT INTO SOLICITUD VALUES (14,'Pendiente','esta solicitud no ha sido asignada','01-ENE-2018','01-FEB-2018','4',1,'2',1,2,14);
INSERT INTO SOLICITUD VALUES (15,'Pendiente','esta solicitud no ha sido asignada','01-ENE-2018','01-FEB-2018','5',1,'1',1,3,15);


--
--Relacion de clientes x producto
--Solo se crea esta relación para una solicitud de TipoSolicitud
--Falta revisar lo de la fecha de ini.

INSERT INTO PRODUCTOSXCLIENTE VALUES (1, '1', '01-FEB-2018','01-MAR-2018');
INSERT INTO PRODUCTOSXCLIENTE VALUES (2, '2', '01-FEB-2018','01-MAR-2018');
INSERT INTO PRODUCTOSXCLIENTE VALUES (3, '3', '01-FEB-2018','01-MAR-2018');
INSERT INTO PRODUCTOSXCLIENTE VALUES (4, '4', '01-FEB-2018','01-MAR-2018');
INSERT INTO PRODUCTOSXCLIENTE VALUES (5, '5', '01-FEB-2018','01-MAR-2018');
INSERT INTO PRODUCTOSXCLIENTE VALUES (6, '1', '01-FEB-2018','01-MAR-2018');
INSERT INTO PRODUCTOSXCLIENTE VALUES (7, '2', '01-FEB-2018','01-MAR-2018');
INSERT INTO PRODUCTOSXCLIENTE VALUES (8, '3', '01-FEB-2018','01-MAR-2018');
INSERT INTO PRODUCTOSXCLIENTE VALUES (9, '4', '01-FEB-2018','01-MAR-2018');
INSERT INTO PRODUCTOSXCLIENTE VALUES (10, '5', '01-FEB-2018','01-MAR-2018');
INSERT INTO PRODUCTOSXCLIENTE VALUES (11, '1', '01-FEB-2018','01-MAR-2018');

COMMIT;