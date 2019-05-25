CREATE OR REPLACE PACKAGE pkProductoNivel1 IS 

    PROCEDURE pInsertar(ivIdProducto IN PRODUCTO.IDPRODUCTO%type, ivFechaIni IN PRODUCTO.FECHAINI%type, ivTipoProducto IN PRODUCTO.TIPOPRODUCTO_IDTIPOPRODUCTO%type);
   
    PROCEDURE pEliminar(ivIdProducto IN NUMBER);
    
    PROCEDURE pModificar(ivIdProducto IN NUMBER, ivFechaIni IN DATE, ivTipoProducto IN NUMBER );
   
    FUNCTION fConsultar(ivIdProducto IN NUMBER) RETURN PRODUCTO%rowtype;
    
    
END pkProductoNivel1;
/
CREATE OR REPLACE PACKAGE BODY pkProductoNivel1 IS 
-- Insertar
  PROCEDURE pInsertar
    (ivIdProducto IN PRODUCTO.IDPRODUCTO%type, ivFechaIni IN PRODUCTO.FECHAINI%type, ivTipoProducto IN PRODUCTO.TIPOPRODUCTO_IDTIPOPRODUCTO%type)
  IS
    BEGIN
    INSERT INTO PRODUCTO(IDPRODUCTO, FECHAINI, TIPOPRODUCTO_IDTIPOPRODUCTO)
    VALUES (ivIdProducto, ivFechaIni, ivTipoProducto);
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN 
        RAISE_APPLICATION_ERROR(-20001,'Error, este registro ya existe.');
        WHEN OTHERS THEN 
        RAISE_APPLICATION_ERROR(-20001,'Error desconocido.'||SQLERRM||SQLCODE);
        
  END pInsertar;
-- Eliminar
  PROCEDURE pEliminar(ivIdProducto IN NUMBER) IS
    BEGIN
    DELETE FROM PRODUCTO P
    WHERE P.IDPRODUCTO = ivIdProducto;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN 
        RAISE_APPLICATION_ERROR(-20001,'Error, no existe solicitud con ese id.');
        WHEN OTHERS THEN 
        RAISE_APPLICATION_ERROR(-20001,'Error desconocido.'||SQLERRM||SQLCODE);
           
    
  END pEliminar;
-- Actualizar
  PROCEDURE pModificar(ivIdProducto NUMBER, ivFechaIni DATE, ivTipoProducto NUMBER ) IS
    BEGIN
    UPDATE PRODUCTO
    SET  idProducto=ivIdProducto, fechaIni=ivFechaIni, TIPOPRODUCTO_IDTIPOPRODUCTO=ivTipoProducto;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN 
        RAISE_APPLICATION_ERROR(-20001,'Error, no existe solicitud con ese id.');
        WHEN OTHERS THEN 
        RAISE_APPLICATION_ERROR(-20001,'Error desconocido.'||SQLERRM||SQLCODE);    
  END pModificar;
  
  FUNCTION fConsultar(ivIdProducto NUMBER) RETURN PRODUCTO%rowtype 
    IS ovProducto PRODUCTO%rowtype;
        BEGIN
        SELECT * into ovProducto
        FROM PRODUCTO
        WHERE idProducto=ivIdProducto;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN 
            RAISE_APPLICATION_ERROR(-20001,'Error, no existe solicitud con ese id.');
            WHEN OTHERS THEN 
            RAISE_APPLICATION_ERROR(-20001,'Error desconocido.'||SQLERRM||SQLCODE);
        
    END fConsultar;
 
    
END pkProductoNivel1;