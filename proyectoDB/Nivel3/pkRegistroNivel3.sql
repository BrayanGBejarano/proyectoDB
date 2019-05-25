
CREATE OR REPLACE PACKAGE pkRegistroNivel3 IS 

    PROCEDURE pRegistarSolicitud(ivIdSolicitud IN NUMBER,ivObservacion IN VARCHAR2,ivIdCliente IN VARCHAR2,ivTipoSolicitud IN NUMBER
    ,ivTipoAnomalia NUMBER,ivIdTipoProducto IN NUMBER,ivIdProducto IN NUMBER, ovRetorno out VARCHAR2);
    
END pkRegistroNivel3;
/
CREATE OR REPLACE PACKAGE BODY pkRegistroNivel3 IS 
-- Insertar
  PROCEDURE pRegistarSolicitud(ivIdSolicitud IN NUMBER,ivObservacion IN VARCHAR2,ivIdCliente IN VARCHAR2,ivTipoSolicitud IN NUMBER
    ,ivTipoAnomalia NUMBER,ivIdTipoProducto IN NUMBER,ivIdProducto IN NUMBER, ovRetorno out VARCHAR2)
    IS
    BEGIN
    
    PKREGISTRONIVEL2.pRegistarSolicitud(ivIdSolicitud,ivObservacion,ivIdCliente
    ,ivTipoSolicitud,ivTipoAnomalia,ivIdTipoProducto ,ivIdProducto);
    ovRetorno:='Solicitud registrada correctamente.';
    EXCEPTION
        WHEN OTHERS THEN 
        ovRetorno:=SQLERRM;
  END pRegistarSolicitud;
    
END pkRegistroNivel3;
