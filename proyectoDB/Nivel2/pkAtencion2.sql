create or replace PACKAGE pkAtencionNivel2 IS 
   FUNCTION fValidarAtencion(ivCedulaFuncionario IN VARCHAR2,ivIdSolicitud IN NUMBER) RETURN NUMBER;
   PROCEDURE pAtenderSolicitud(ivCedulaFuncionario IN VARCHAR2,ivIdSolicitud IN NUMBER, ivComentario IN VARCHAR2);
   PROCEDURE pAtenderReclamoODano(ivIdCedulaFuncionario IN NUMBER,ivIdSolicitud IN VARCHAR2, ivEstado IN VARCHAR2,ivComentario IN VARCHAR2);
   PROCEDURE pAtenderReclamoODanoAutomatico(ivIdSolicitud IN VARCHAR2);
END pkAtencionNivel2;
/
create or replace PACKAGE BODY pkAtencionNivel2 IS 

   FUNCTION fValidarAtencion(ivCedulaFuncionario IN VARCHAR2,ivIdSolicitud IN NUMBER) RETURN NUMBER IS
   solicitudAct SOLICITUD%rowtype;
   retorno NUMBER;
   BEGIN
     solicitudAct :=pkSOLICITUDNIVEL1.fCONSULTAR(ivIdSolicitud);



   IF solicitudAct.FUNCIONARIO_CEDULAFUNCIONARIO=ivCedulaFuncionario THEN
   retorno:=1;
   RETURN retorno;
   ELSE
   retorno:=0;
   RETURN retorno;
   END IF;

   END fValidarAtencion;

   PROCEDURE pAtenderSolicitud(ivCedulaFuncionario IN VARCHAR2,ivIdSolicitud IN NUMBER, ivComentario IN VARCHAR2)
   IS 
   fecha DATE;
   solicitudAct SOLICITUD%rowtype;


   BEGIN 
   solicitudAct :=pkSOLICITUDNIVEL1.fCONSULTAR(ivIdSolicitud);



   IF solicitudAct.FUNCIONARIO_CEDULAFUNCIONARIO=ivCedulaFuncionario THEN     
    IF solicitudAct.TIPOSOLICITUD_IDTIPOSOLICITUD='001' THEN
    fecha:=ADD_MONTHS(TRUNC(SYSDATE,'MM'),1);--El primer dia del proximo mes
    pkPRODUCTOSXCLIENTENIVEL1.PINSERTAR(solicitudAct.PRODUCTO_IDPRODUCTO,solicitudAct.CLIENTE_CEDULACLIENTE,fecha,NULL);
    pkSOLICITUDNIVEL1.PMODIFICAR(solicitudAct.IDSOLICITUD, 'atendida',solicitudAct.CLIENTE_CEDULACLIENTE,solicitudAct.FUNCIONARIO_CEDULAFUNCIONARIO,ivComentario,
    solicitudAct.FECHAINI,SYSDATE, solicitudAct.TIPOSOLICITUD_IDTIPOSOLICITUD,solicitudAct.TIPOANOMALIA_IDANOMALIA,solicitudAct.TIPOPRODUCTO_IDTIPOPRODUCTO,
    solicitudAct.PRODUCTO_IDPRODUCTO);

    ELSIF solicitudAct.TIPOSOLICITUD_IDTIPOSOLICITUD='002' THEN
    fecha:=SYSDATE;
    pkPRODUCTOSXCLIENTENIVEL1.PINSERTAR(solicitudAct.PRODUCTO_IDPRODUCTO,solicitudAct.CLIENTE_CEDULACLIENTE,fecha,NULL);  
    pkSOLICITUDNIVEL1.PMODIFICAR(solicitudAct.IDSOLICITUD, 'Atendida',solicitudAct.CLIENTE_CEDULACLIENTE,solicitudAct.FUNCIONARIO_CEDULAFUNCIONARIO,ivComentario,
    solicitudAct.FECHAINI,solicitudAct.FECHAFIN,solicitudAct.TIPOSOLICITUD_IDTIPOSOLICITUD,solicitudAct.TIPOANOMALIA_IDANOMALIA,solicitudAct.TIPOPRODUCTO_IDTIPOPRODUCTO,
    solicitudAct.PRODUCTO_IDPRODUCTO);

    END IF;
   ELSE
   RAISE_APPLICATION_ERROR(-20001,'Esta solicitud no esta asociada al funcionario buscado.');
   END IF; 

   END pAtenderSolicitud;

PROCEDURE pAtenderReclamoODano(ivIdCedulaFuncionario IN NUMBER,ivIdSolicitud IN VARCHAR2, ivEstado IN VARCHAR2,ivComentario IN VARCHAR2)--p2
   IS
   solicitudAct SOLICITUD%rowtype;
   BEGIN 
   solicitudAct :=pkSOLICITUDNIVEL1.fCONSULTAR(ivIdSolicitud);

   IF solicitudAct.IDSOLICITUD IS NULL THEN
   RAISE_APPLICATION_ERROR(-20001,'No existe una solicitud con el ID buscado.');
   END IF;
   IF solicitudAct.FUNCIONARIO_CEDULAFUNCIONARIO=ivIdCedulaFuncionario THEN     
    IF solicitudAct.TIPOSOLICITUD_IDTIPOSOLICITUD='001' THEN
    pkSOLICITUDNIVEL1.PMODIFICAR(solicitudAct.IDSOLICITUD, ivEstado,ivComentario,solicitudAct.CLIENTE_CEDULACLIENTE,solicitudAct.FUNCIONARIO_CEDULAFUNCIONARIO,solicitudAct.FECHAINI,solicitudAct.FECHAFIN,
    solicitudAct.TIPOSOLICITUD_IDTIPOSOLICITUD,solicitudAct.TIPOANOMALIA_IDANOMALIA,solicitudAct.TIPOPRODUCTO_IDTIPOPRODUCTO,
    solicitudAct.PRODUCTO_IDPRODUCTO);
    END IF;
   END IF;
   END pAtenderReclamoODano;


   PROCEDURE pAtenderReclamoODanoAutomatico(ivIdSolicitud IN VARCHAR2)--p3
    IS
   solicitudAct SOLICITUD%rowtype;
   tiempoLimite NUMBER;
   expiradas SOLICITUD.IDSOLICITUD%type;
   cur1 sys_refcursor;
   BEGIN 

   SELECT P.Valor into tiempoLimite
   FROM PARAMETROS P
   WHERE P.idParametros=0002;

   SELECT  S.IdSolicitud into expiradas
   FROM  SOLICITUD S 
   WHERE S.FECHAINI-S.FECHAFIN >= tiempoLimite 
   AND ROWNUM = 1
   AND S.ESTADO='Asignado'
   AND (S.TIPOSOLICITUD_IDTIPOSOLICITUD=003 OR S.TIPOSOLICITUD_IDTIPOSOLICITUD=004);




   IF solicitudAct.IDSOLICITUD IS NULL THEN
   RAISE_APPLICATION_ERROR(-20001,'No existe una solicitud con el ID buscado.');
   END IF;

   IF solicitudAct.TIPOSOLICITUD_IDTIPOSOLICITUD!=003 or solicitudAct.TIPOSOLICITUD_IDTIPOSOLICITUD!=004 THEN
   RAISE_APPLICATION_ERROR(-20001,'La solicitud pasada por parametro no es de tipo daño o reclamo.');
   ELSE
   --Inicio del loop
   loop
   fetch cur1 into expiradas;
   exit when cur1%notfound;
    solicitudAct :=pkSOLICITUDNIVEL1.fConsultar(expiradas);
    pkSOLICITUDNIVEL1.PMODIFICAR(expiradas, 'Atendida','Atendida automaticamente por el sistema',solicitudAct.CLIENTE_CEDULACLIENTE,solicitudAct.FUNCIONARIO_CEDULAFUNCIONARIO,
    solicitudAct.FECHAINI,solicitudAct.FECHAFIN,solicitudAct.TIPOSOLICITUD_IDTIPOSOLICITUD,solicitudAct.TIPOANOMALIA_IDANOMALIA,solicitudAct.TIPOPRODUCTO_IDTIPOPRODUCTO,
    solicitudAct.PRODUCTO_IDPRODUCTO);
   END loop; 
   END IF;

   END pAtenderReclamoODanoAutomatico;   


END pkAtencionNivel2;
