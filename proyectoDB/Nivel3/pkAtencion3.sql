create or replace PACKAGE pkAtencionNivel3 IS 
    PROCEDURE pValidarAtencion(ivCedulaFuncionario IN VARCHAR2,ivIdSolicitud IN NUMBER, ovRetorno out NUMBER, ovRetorno2 out VARCHAR2);
    PROCEDURE pAtenderSolicitud(ivIdCedulaFuncionario VARCHAR2,ivIdSolicitud IN NUMBER, ivComentario IN VARCHAR2, ovRetorno out VARCHAR2);
    PROCEDURE pAtenderReclamoODano(ivIdCedulaFuncionario IN VARCHAR2,ivIdSolicitud IN NUMBER, ivEstado IN VARCHAR2,ivComentario IN VARCHAR2, ovRetorno out VARCHAR2);
    PROCEDURE pAtenderReclamoODanoAutomatico(ivIdSolicitud IN VARCHAR2, ovRetorno out VARCHAR2 );

END pkAtencionNivel3;
/
create or replace PACKAGE pkAtencionNivel3 IS 
    PROCEDURE pValidarAtencion(ivCedulaFuncionario IN VARCHAR2,ivIdSolicitud IN NUMBER, ovRetorno out NUMBER, ovRetorno2 out VARCHAR2);
    PROCEDURE pAtenderSolicitud(ivIdCedulaFuncionario VARCHAR2,ivIdSolicitud IN NUMBER, ivComentario IN VARCHAR2, ovRetorno out VARCHAR2);
    PROCEDURE pAtenderReclamoODano(ivIdCedulaFuncionario IN VARCHAR2,ivIdSolicitud IN NUMBER, ivEstado IN VARCHAR2,ivComentario IN VARCHAR2, ovRetorno out VARCHAR2);
    PROCEDURE pAtenderReclamoODanoAutomatico(ivIdSolicitud IN VARCHAR2, ovRetorno out VARCHAR2 );

END pkAtencionNivel3;
/
create or replace PACKAGE BODY pkAtencionNivel3 IS 

   PROCEDURE pValidarAtencion(ivCedulaFuncionario VARCHAR2,ivIdSolicitud IN NUMBER, ovRetorno out NUMBER, ovRetorno2 out VARCHAR2)
   IS 
   BEGIN 

   ovRetorno:=PKATENCIONNIVEL2.fValidarAtencion(ivCedulaFuncionario,ivIdSolicitud);
   ovRetorno2:='La validacion ha sido exitosa.';

     EXCEPTION

        WHEN OTHERS THEN 
        ovRetorno2:=SQLERRM; 

   END pValidarAtencion;

   PROCEDURE pAtenderSolicitud(ivIdCedulaFuncionario VARCHAR2,ivIdSolicitud IN NUMBER, ivComentario IN VARCHAR2, ovRetorno out VARCHAR2)
   IS 
   BEGIN 

   PKATENCIONNIVEL2.pAtenderSolicitud(ivIdCedulaFuncionario,ivIdSolicitud, ivComentario);
   ovRetorno:='Se atendio la solicitud de manera exitosa.';
     EXCEPTION

        WHEN OTHERS THEN 
        ovRetorno:=SQLERRM; 

   END pAtenderSolicitud;

   PROCEDURE pAtenderReclamoODano(ivIdCedulaFuncionario IN VARCHAR2,ivIdSolicitud IN NUMBER, ivEstado IN VARCHAR2,ivComentario IN VARCHAR2, ovRetorno out VARCHAR2)
   IS
   BEGIN


   PKATENCIONNIVEL2.pAtenderReclamoODano(ivIdCedulaFuncionario ,ivIdSolicitud, ivEstado,ivComentario);
   ovRetorno:='Se atendio el reclamo o el daño de manera exitosa.';
     EXCEPTION
        WHEN OTHERS THEN 
        ovRetorno:=SQLERRM; 
   END pAtenderReclamoODano;


   PROCEDURE pAtenderReclamoODanoAutomatico(ivIdSolicitud IN VARCHAR2,ovRetorno out VARCHAR2)
   IS
   BEGIN


   PKATENCIONNIVEL2.pAtenderReclamoODanoAutomatico(ivIdSolicitud);
   ovRetorno:='Se realizo la atencion automatica de manera exitosa.';
     EXCEPTION
        WHEN OTHERS THEN 
        ovRetorno:=SQLERRM; 
   END pAtenderReclamoODanoAutomatico;



END pkAtencionNivel3;
