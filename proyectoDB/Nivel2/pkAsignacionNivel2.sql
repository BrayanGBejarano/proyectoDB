CREATE OR REPLACE PACKAGE pkAsignacionNivel2 IS 
   PROCEDURE pAsignacionAutomatica(ivIdSolicitud IN NUMBER);
   PROCEDURE pAsignacionIndividual(ivIdSolicitud IN NUMBER,ivFuncionario IN VARCHAR2);
   
END pkAsignacionNivel2;
/
CREATE OR REPLACE PACKAGE BODY pkAsignacionNivel2 IS 

   PROCEDURE pAsignacionAutomatica(ivIdSolicitud IN NUMBER)
   IS 
   cedulaF VARCHAR2(20);
   cantidad NUMBER;
   BEGIN 
   --SELECT P.Valor into cantidad
   --FROM PARAMETROS P
   --WHERE P.idParametros=0001;
   -- FALTA EL ID
   SELECT  F.CEDULAFUNCIONARIO into cedulaF
   FROM  FUNCIONARIO F 
   WHERE ROWNUM = 1;
   
   PKSOLICITUDNIVEL1.PCAMBIARESTADO(ivIdSolicitud,'Asignada',cedulaF);
     EXCEPTION
        WHEN NO_DATA_FOUND THEN 
        RAISE_APPLICATION_ERROR(-20001,'Error, no existe solicitud con ese id.');
        WHEN OTHERS THEN 
        RAISE_APPLICATION_ERROR(-20001,'Error desconocido.'||SQLERRM||SQLCODE); 
   
   
   END pAsignacionAutomatica;
    
   PROCEDURE pAsignacionIndividual(ivIdSolicitud IN NUMBER,ivFuncionario IN VARCHAR2)
   IS
   BEGIN 
   PKSOLICITUDNIVEL1.PCAMBIARESTADO(ivIdSolicitud,'Asignada',ivFuncionario);
     EXCEPTION
        WHEN NO_DATA_FOUND THEN 
        RAISE_APPLICATION_ERROR(-20001,'Error, no existe solicitud con ese id.');
        WHEN OTHERS THEN 
        RAISE_APPLICATION_ERROR(-20001,'Error desconocido.'||SQLERRM||SQLCODE); 
   END pAsignacionIndividual;
      


END pkAsignacionNivel2;