
CREATE OR REPLACE PACKAGE pkProductosXClienteNivel1 IS 

    PROCEDURE pInsertar(ivIdProducto IN NUMBER, ivCedula IN VARCHAR2,ivFechaInicio IN DATE,ivFechaFin IN DATE);
   
    PROCEDURE pEliminar(ivIdProducto IN NUMBER, ivCedula IN VARCHAR2);
    
    PROCEDURE pModificar(ivIdProducto IN NUMBER, ivCedula IN VARCHAR2,ivFechaInicio IN DATE,ivFechaFin IN DATE);
   
    FUNCTION fConsultar(ivCedula in VARCHAR2) RETURN PRODUCTOSXCLIENTE%rowtype;
    

END pkProductosXClienteNivel1;
/
CREATE OR REPLACE PACKAGE BODY pkProductosXClienteNivel1 IS 
-- Insertar
  PROCEDURE pInsertar (ivIdProducto IN NUMBER, ivCedula IN VARCHAR2,ivFechaInicio IN DATE,ivFechaFin IN DATE) IS
    BEGIN
    INSERT INTO PRODUCTOSXCLIENTE
    VALUES (ivIdProducto,ivCedula,ivFechaInicio,ivFechaFin);
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN 
        RAISE_APPLICATION_ERROR(-20001,'Error, este registro ya existe.');
        WHEN OTHERS THEN 
        RAISE_APPLICATION_ERROR(-20001,'Error desconocido.'||SQLERRM||SQLCODE);
        
  END pInsertar;
-- Eliminar
  PROCEDURE pEliminar(ivIdProducto IN NUMBER, ivCedula IN VARCHAR2) IS
    BEGIN
    DELETE FROM PRODUCTOSXCLIENTE S WHERE S.PRODUCTO_IDPRODUCTO = ivIdProducto 
    AND S.CLIENTE_CEDULACLIENTE=ivCedula;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN 
        RAISE_APPLICATION_ERROR(-20001,'Error, no existe cliente o producto con ese id.');
        WHEN OTHERS THEN 
        RAISE_APPLICATION_ERROR(-20001,'Error desconocido.'||SQLERRM||SQLCODE);
           
    
  END pEliminar;
-- Actualizar
  PROCEDURE pModificar(ivIdProducto IN NUMBER, ivCedula IN VARCHAR2,ivFechaInicio IN DATE,ivFechaFin IN DATE) IS
    BEGIN
    UPDATE PRODUCTOSXCLIENTE 
    SET FECHAINICIO=ivFechaInicio, FECHAFIN=ivFechaFin 
    WHERE PRODUCTO_IDPRODUCTO = ivIdProducto 
    AND CLIENTE_CEDULACLIENTE=ivCedula;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN 
        RAISE_APPLICATION_ERROR(-20001,'Error, no existe no existe cliente o producto con ese id.');
        WHEN OTHERS THEN 
        RAISE_APPLICATION_ERROR(-20001,'Error desconocido.'||SQLERRM||SQLCODE);    
  END pModificar;
  
  FUNCTION fConsultar(ivCedula in VARCHAR2) RETURN PRODUCTOSXCLIENTE%rowtype 
    IS ovProducto PRODUCTOSXCLIENTE%rowtype;
    BEGIN
        SELECT * into ovProducto
        FROM PRODUCTOSXCLIENTE
        WHERE CLIENTE_CEDULACLIENTE=ivCedula;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN 
            RAISE_APPLICATION_ERROR(-20001,'Error, no existe Cliente con esa Cedula.');
            WHEN OTHERS THEN 
            RAISE_APPLICATION_ERROR(-20001,'Error desconocido.'||SQLERRM||SQLCODE);
        
    END fConsultar;
    
END pkProductosXClienteNivel1;