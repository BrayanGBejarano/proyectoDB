
CREATE OR REPLACE PACKAGE pkInicioSesionNivel3 IS 

    PROCEDURE pAcceder(ivIdCliente  VARCHAR2,ovNombre out VARCHAR2,ovFechaNacimiento out Date,ovDireccion out VARCHAR2, ovTelefono out VARCHAR2, 
    ovRetorno out VARCHAR2);
    PROCEDURE pRegistrar(ivIdCliente IN VARCHAR2,ivNombre in VARCHAR2,ivFechaNacimiento Date,ivDireccion in VARCHAR2, ivTelefono in VARCHAR2
    ,ovRetorno out VARCHAR2);
    
END pkInicioSesionNivel3;
/
CREATE OR REPLACE PACKAGE BODY pkInicioSesionNivel3 IS 
-- Insertar
  PROCEDURE pAcceder(ivIdCliente  VARCHAR2,ovNombre out VARCHAR2,ovFechaNacimiento out Date,ovDireccion out VARCHAR2, ovTelefono out VARCHAR2, 
    ovRetorno out VARCHAR2)
    IS
    ovCliente cliente%rowtype;
    BEGIN
    
    ovCliente:=PKINICIOSESIONNIVEL2.FACCEDER(ivIdCliente);
    ovNombre :=ovCliente.nombre;
    ovFechaNacimiento :=ovCliente.FechaNacimiento;
    ovDireccion:=ovCliente.Direccion;
    ovTelefono:=ovCliente.Telefono;
    ovRetorno:='Exito';
    
    EXCEPTION
        WHEN OTHERS THEN 
        ovRetorno:=SQLERRM;
  END pAcceder;
    
    PROCEDURE pRegistrar(ivIdCliente IN VARCHAR2,ivNombre in VARCHAR2,ivFechaNacimiento Date,ivDireccion in VARCHAR2, ivTelefono in VARCHAR2
    , ovRetorno out VARCHAR2)
    IS
    BEGIN
    PKINICIOSESIONNIVEL2.PREGISTRAR(ivIdCliente,ivNombre,ivFechaNacimiento ,ivDireccion , ivTelefono);
    ovRetorno:='Registro exitoso';
    EXCEPTION
        WHEN OTHERS THEN 
        ovRetorno:=SQLERRM;
    END pRegistrar;
    
END pkInicioSesionNivel3;
