
CREATE OR REPLACE PACKAGE pkInicioSesionNivel2 IS 

    FUNCTION fAcceder(ivIdCliente  VARCHAR2) RETURN CLIENTE%rowtype;
    PROCEDURE pRegistrar(ivIdCliente IN VARCHAR2,ivNombre in VARCHAR2,ivFechaNacimiento Date,ivDireccion in VARCHAR2, ivTelefono in VARCHAR2);
    
END pkInicioSesionNivel2;
/
CREATE OR REPLACE PACKAGE BODY pkInicioSesionNivel2 IS 
-- Insertar
  FUNCTION fAcceder(ivIdCliente  VARCHAR2)RETURN CLIENTE%rowtype
    IS
    ovCliente cliente%rowtype;
    BEGIN
    
    ovCliente:=PKCLIENTESNIVEL1.FCONSULTAR(ivIdCliente);
    RETURN ovCliente;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20001,'Error, Cliente no encontrado');
        WHEN OTHERS THEN 
        RAISE_APPLICATION_ERROR(-20001,'Error desconocido.'||SQLERRM||SQLCODE);
  END fAcceder;
    
    PROCEDURE pRegistrar(ivIdCliente IN VARCHAR2,ivNombre in VARCHAR2,ivFechaNacimiento Date,ivDireccion in VARCHAR2, ivTelefono in VARCHAR2)
    IS
    BEGIN
    PKCLIENTESNIVEL1.pInsertar(ivNombre,ivIdCliente,ivFechaNacimiento ,ivDireccion , ivTelefono);
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN 
        RAISE_APPLICATION_ERROR(-20001,'Error, este cliente ya existe.');
        WHEN OTHERS THEN 
        RAISE_APPLICATION_ERROR(-20001,'Error desconocido.'||SQLERRM||SQLCODE);
    
    END pRegistrar;
    
END pkInicioSesionNivel2;
