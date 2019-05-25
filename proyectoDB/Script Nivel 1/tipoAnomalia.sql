create or replace PACKAGE pkTipoAnomaliaNivel1 IS 

    PROCEDURE pInsertar(LidAnomalia IN NUMBER, LNombre  IN VARCHAR2);
    
 PROCEDURE pEliminar(LidAnomalia IN NUMBER);
    
    PROCEDURE pModificar(LidAnomalia IN NUMBER, LNombre  IN VARCHAR2);
    
    FUNCTION fConsultar(LidAnomalia in NUMBER) RETURN TIPOANOMALIA%rowtype;

 END pkTipoAnomaliaNivel1;

/

create or replace PACKAGE BODY pkTipoAnomaliaNivel1 IS 
-- Insertar
  PROCEDURE pInsertar
    (LidAnomalia NUMBER, LNombre VARCHAR2)
  IS
    BEGIN
    INSERT INTO TIPOANOMALIA
    VALUES (LidAnomalia , LNombre);
    
        EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN 
        RAISE_APPLICATION_ERROR(-20001,'Error, este registro ya existe.');
        WHEN OTHERS THEN 
        RAISE_APPLICATION_ERROR(-20001,'Error desconocido.'||SQLERRM||SQLCODE);
  END pInsertar;

     
  --Eliminar
  
   PROCEDURE pEliminar(LidAnomalia IN NUMBER) IS
    BEGIN
    DELETE FROM TIPOANOMALIA S WHERE S.IDANOMALIA = LidAnomalia;
     EXCEPTION
        WHEN NO_DATA_FOUND THEN 
        RAISE_APPLICATION_ERROR(-20001,'Error, no existe solicitud con ese id.');
        WHEN OTHERS THEN 
        RAISE_APPLICATION_ERROR(-20001,'Error desconocido.'||SQLERRM||SQLCODE);
  END pEliminar;

    
  -- Actualizar
  PROCEDURE pModificar(LidAnomalia NUMBER, LNombre VARCHAR2) IS
    BEGIN
    UPDATE TIPOANOMALIA 
    SET  IDANOMALIA=LidAnomalia ,NOMBRE=LNombre
    WHERE IDANOMALIA=LidAnomalia;
    
    EXCEPTION
        WHEN NO_DATA_FOUND THEN 
        RAISE_APPLICATION_ERROR(-20001,'Error, no existe solicitud con ese id.');
        WHEN OTHERS THEN 
        RAISE_APPLICATION_ERROR(-20001,'Error desconocido.'||SQLERRM||SQLCODE);
        
  END pModificar;
  

  
  
  
    
  --OBTENER
  FUNCTION fConsultar(LidAnomalia IN NUMBER) RETURN TIPOANOMALIA%rowtype 
    IS ovTipoAnomalia TIPOANOMALIA%rowtype;
    BEGIN
        SELECT * into ovTipoAnomalia
        FROM TIPOANOMALIA
        WHERE IDANOMALIA=LidAnomalia;
        
        EXCEPTION
            WHEN NO_DATA_FOUND THEN 
            RAISE_APPLICATION_ERROR(-20001,'Error, no existe solicitud con ese id.');
            WHEN OTHERS THEN 
            RAISE_APPLICATION_ERROR(-20001,'Error desconocido.'||SQLERRM||SQLCODE);
        
    END fConsultar;
  
  
  
  END pkTipoAnomaliaNivel1;
