CREATE OR REPLACE PACKAGE pkTipoSolicitudNivel1 IS 

    PROCEDURE pInsertar(idTipoSolicitud IN NUMBER, nombre IN VARCHAR2 );
   
    PROCEDURE pEliminar(idTipoSolicitud IN NUMBER);
    
    PROCEDURE pModificar(idTipoSolicitud IN NUMBER, inombre IN VARCHAR2);
   
    FUNCTION fConsultar(idTipoSolicitud in NUMBER) RETURN TIPOSOLICITUD%rowtype;
    
END pkTipoSolicitudNivel1;
/
CREATE OR REPLACE PACKAGE BODY pkTipoSolicitudNivel1 IS 
-- Insertar
  PROCEDURE pInsertar
    (idTipoSolicitud NUMBER,nombre VARCHAR2)
  IS
    BEGIN
    INSERT INTO TIPOSOLICITUD
    VALUES (idTipoSolicitud , nombre );
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN 
        RAISE_APPLICATION_ERROR(-20001,'Error, este registro ya existe.');
        WHEN OTHERS THEN 
        RAISE_APPLICATION_ERROR(-20001,'Error desconocido.'||SQLERRM||SQLCODE);
  END pInsertar;
-- Eliminar
  PROCEDURE pEliminar(idTipoSolicitud IN NUMBER) IS
    BEGIN
    DELETE FROM TIPOSOLICITUD T WHERE T.IDTIPOSOLICITUD = idTipoSolicitud;
     EXCEPTION
        WHEN NO_DATA_FOUND THEN 
        RAISE_APPLICATION_ERROR(-20001,'Error, no existe un tipo de solicitud con ese id.');
        WHEN OTHERS THEN 
        RAISE_APPLICATION_ERROR(-20001,'Error desconocido.'||SQLERRM||SQLCODE);
  END pEliminar;
-- Actualizar
  PROCEDURE pModificar(idTipoSolicitud NUMBER, inombre VARCHAR2) IS
    BEGIN
    UPDATE TIPOSOLICITUD 
    SET  nombre=inombre 
    WHERE IDTIPOSOLICITUD=idTipoSolicitud;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN 
        RAISE_APPLICATION_ERROR(-20001,'Error, no existe un tipo de solicitud con ese id.');
        WHEN OTHERS THEN 
        RAISE_APPLICATION_ERROR(-20001,'Error desconocido.'||SQLERRM||SQLCODE);
  END pModificar;
  
  FUNCTION fConsultar(idTipoSolicitud IN NUMBER) RETURN TIPOSOLICITUD%rowtype 
    IS ovTipoSolicitud TIPOSOLICITUD%rowtype;
    BEGIN
        SELECT * into ovTipoSolicitud
        FROM TIPOSOLICITUD
        WHERE IDTIPOSOLICITUD=idTipoSolicitud;
        EXCEPTION
        WHEN NO_DATA_FOUND THEN 
        RAISE_APPLICATION_ERROR(-20001,'Error, no existe un tipo de solicitud con ese id.');
        WHEN OTHERS THEN 
        RAISE_APPLICATION_ERROR(-20001,'Error desconocido.'||SQLERRM||SQLCODE);
    END fConsultar;
END pkTipoSolicitudNivel1;
