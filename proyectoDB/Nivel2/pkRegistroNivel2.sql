
CREATE OR REPLACE PACKAGE pkRegistroNivel2 IS 

    PROCEDURE pRegistarSolicitud(ivIdSolicitud IN NUMBER,ivObservacion IN VARCHAR2,ivIdCliente IN VARCHAR2,ivTipoSolicitud IN NUMBER
    ,ivTipoAnomalia NUMBER,ivIdTipoProducto IN NUMBER,ivIdProducto IN NUMBER);
    
END pkRegistroNivel2;
/
CREATE OR REPLACE PACKAGE BODY pkRegistroNivel2 IS 
-- Insertar
  PROCEDURE pRegistarSolicitud(ivIdSolicitud IN NUMBER,ivObservacion IN VARCHAR2,ivIdCliente IN VARCHAR2,ivTipoSolicitud IN NUMBER
    ,ivTipoAnomalia NUMBER,ivIdTipoProducto IN NUMBER,ivIdProducto IN NUMBER)
    IS
    BEGIN
    
    PKSOLICITUDNIVEL1.pInsertar(ivIdSolicitud ,'Pendiente',ivObservacion,ivIdCliente ,'000' 
    ,ivTipoSolicitud,ivTipoAnomalia,ivIdTipoProducto ,ivIdProducto );
    
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN 
        RAISE_APPLICATION_ERROR(-20001,'Error, el id de la solicitud ya existe.');
        WHEN OTHERS THEN 
        RAISE_APPLICATION_ERROR(-20001,'Error desconocido.'||SQLERRM||SQLCODE);
  END pRegistarSolicitud;
    
END pkRegistroNivel2;
