CREATE OR REPLACE PACKAGE pkAsignacionNivel3 IS 
   PROCEDURE pAsignacionAutomatica(ivIdSolicitud IN NUMBER, ovRetorno out VARCHAR2);
   PROCEDURE pAsignacionIndividual(ivIdSolicitud IN NUMBER,ivFuncionario IN VARCHAR2,ovRetorno out VARCHAR2);
   
END pkAsignacionNivel3;
/
CREATE OR REPLACE PACKAGE BODY pkAsignacionNivel3 IS 

   PROCEDURE pAsignacionAutomatica(ivIdSolicitud IN NUMBER,ovRetorno out VARCHAR2)
   IS 
   BEGIN 
   
   PKASIGNACIONNIVEL2.pAsignacionAutomatica(ivIdSolicitud);
   ovRetorno:='Asignacion Automatica Correcta';
     EXCEPTION
        
        WHEN OTHERS THEN 
        ovRetorno:=SQLERRM; 
   
   END pAsignacionAutomatica;
    
   PROCEDURE pAsignacionIndividual(ivIdSolicitud IN NUMBER,ivFuncionario IN VARCHAR2,ovRetorno out VARCHAR2)
   IS
   BEGIN
   
   
   PKASIGNACIONNIVEL2.pAsignacionIndividual(ivIdSolicitud,ivFuncionario);
   ovRetorno:='Asignacion individual exitosa';
     EXCEPTION
        WHEN OTHERS THEN 
        ovRetorno:=SQLERRM; 
   END pAsignacionIndividual;
      


END pkAsignacionNivel3;