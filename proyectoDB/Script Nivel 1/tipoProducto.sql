CREATE OR REPLACE PACKAGE pkTipoProductoNivel1 IS 

    PROCEDURE pInsertar(LidTipoProducto IN NUMBER, LNombre  IN VARCHAR2);
    
    PROCEDURE pEliminar(LidTipoProducto IN NUMBER);
    
    PROCEDURE pModificar(LidTipoProducto IN NUMBER, LNombre  IN VARCHAR2);
    
    FUNCTION fConsultar(LidTipoProducto in NUMBER) RETURN TIPOPRODUCTO%rowtype;

   

    
    
    END pkTipoProductoNivel1;
 /   
    CREATE OR REPLACE PACKAGE BODY pkTipoProductoNivel1 IS 
-- Insertar
  PROCEDURE pInsertar
    (LidTipoProducto NUMBER, LNombre VARCHAR2)
  IS
    BEGIN
    INSERT INTO TIPOPRODUCTO
    VALUES (LidTipoProducto , LNombre);
    
        EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN 
        RAISE_APPLICATION_ERROR(-20001,'Error, este registro ya existe.');
        WHEN OTHERS THEN 
        RAISE_APPLICATION_ERROR(-20001,'Error desconocido.'||SQLERRM||SQLCODE);
  END pInsertar;
  
  --Eliminar
  
   PROCEDURE pEliminar(LidTipoProducto IN NUMBER) IS
    BEGIN
    DELETE FROM TIPOPRODUCTO S WHERE S.IDTIPOPRODUCTO = LidTipoProducto;
     EXCEPTION
        WHEN NO_DATA_FOUND THEN 
        RAISE_APPLICATION_ERROR(-20001,'Error, no existe solicitud con ese id.');
        WHEN OTHERS THEN 
        RAISE_APPLICATION_ERROR(-20001,'Error desconocido.'||SQLERRM||SQLCODE);
  END pEliminar;
  
  -- Actualizar
  PROCEDURE pModificar(LidTipoProducto NUMBER, LNombre VARCHAR2) IS
    BEGIN
    UPDATE TIPOPRODUCTO 
    SET  IDTIPOPRODUCTO=LidTipoProducto ,NOMBRE=LNombre
    WHERE IDTIPOPRODUCTO=LidTipoProducto;
    
    EXCEPTION
        WHEN NO_DATA_FOUND THEN 
        RAISE_APPLICATION_ERROR(-20001,'Error, no existe solicitud con ese id.');
        WHEN OTHERS THEN 
        RAISE_APPLICATION_ERROR(-20001,'Error desconocido.'||SQLERRM||SQLCODE);
        
  END pModificar;
  
  
  --OBTENER
  FUNCTION fConsultar(LidTipoProducto IN NUMBER) RETURN TIPOPRODUCTO%rowtype 
    IS ovTipoProducto TIPOPRODUCTO%rowtype;
    BEGIN
        SELECT * into ovTipoProducto
        FROM TIPOPRODUCTO
        WHERE IDTIPOPRODUCTO=LidTipoProducto;
        
        EXCEPTION
            WHEN NO_DATA_FOUND THEN 
            RAISE_APPLICATION_ERROR(-20001,'Error, no existe solicitud con ese id.');
            WHEN OTHERS THEN 
            RAISE_APPLICATION_ERROR(-20001,'Error desconocido.'||SQLERRM||SQLCODE);
        
    END fConsultar;
   
  
  
  END pkTipoProductoNivel1;

   
