package control;

import java.sql.CallableStatement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import modelo.Cliente;

public class ControlInicioSesion extends Control{
	private Cliente usuarioActual;
	
	private static ControlInicioSesion instance;
	
	
	public ControlInicioSesion() {
		
	}
	
	
	
	public static ControlInicioSesion getInstance() {
		if (instance == null) {
			synchronized (ControlInicioSesion.class) {
				if (instance == null) {
					instance = new ControlInicioSesion();
				}
			}
		}
		return instance;
	}
	
	public String registrar(Cliente cliente) throws Exception {

		String salida = "";
		try {
			this.conectar();

			CallableStatement query = this.connection
					.prepareCall("{call PKINICIOSESIONNIVEL2.PREGISTRAR(?,?,?,?,?,?)}");
	//PKINICIOSESIONNIVEL2.PREGISTRAR(ivIdCliente,ivNombre,ivFechaNacimiento ,ivDireccion , ivTelefono);			    
			query.setString(1, cliente.getCedula());
			query.setString(2, cliente.getNombre());
			query.setDate(3, (java.sql.Date) convertirStringToDate(cliente.getFechaNacimiento()));
			query.setString(4, cliente.getDireccion());
			query.setString(5, cliente.getTelefono());
			

			query.registerOutParameter(6, java.sql.Types.VARCHAR);

			query.execute();

			salida = query.getString(6);
			
			// System.out.println(salida);
			return salida;
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			this.TerminarConexion();
		}


	}
	
	
	/**
	 * Metodo encargado de verificar el login del usuario
	 * @param cedula identificador el usuario que hace login
	 * @return salida confirmacion del login
	 * @throws Exception
	 */
	public  String Acceder(String cedula) throws Exception {
		String salida = "Exito";
		try {
			this.conectar();

			CallableStatement query = this.connection
					.prepareCall("{call PKINICIOSESIONNIVEL3.PACCEDER(?,?,?,?,?,?)}");
			query.setString(1, cedula);
			query.registerOutParameter(2, java.sql.Types.VARCHAR);
			query.registerOutParameter(3, java.sql.Types.DATE);
			query.registerOutParameter(4, java.sql.Types.VARCHAR);
			query.registerOutParameter(5, java.sql.Types.VARCHAR);
			query.registerOutParameter(6, java.sql.Types.VARCHAR);
			

			query.execute();

			String nombre = query.getString(6);

			if (nombre.equals("Exito")) {
				Cliente actual = new Cliente(cedula, query.getString(2), query.getString(3), query.getString(4),query.getString(5));
				setUserActual(actual);
			}

			if (query.getString(6) != null) {
				salida = query.getString(6);
			}
			this.TerminarConexion();
			return salida;
		} catch (Exception e) {
			throw e;
		} finally {
			this.TerminarConexion();
		}
	}
	/**
	 * Metodo encargado de
	 * @return userActual en el sistema
	 */
	public Cliente getUserActual() {
		return usuarioActual;
	}
	/**
	 * Metodo encargado de recibir el nuevo
	 * @param userActual en el sistema, y modificar el actual
	 */
	public void setUserActual(Cliente usuarioActual) {
		this.usuarioActual = usuarioActual;
	}

	/**
	 * Metodo encargado de cambiar el formato de la fecha
	 * @param date
	 * @return fecha
	 */
	public String convertirDateToString(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		String fecha = sdf.format(date);
		return fecha;
	}

	/**
	 * Metodo encargado de cambiar el formato de la fecha
	 * @param date
	 * @return fecha
	 */
	public Date convertirStringToDate(String fecha) {
		SimpleDateFormat formato = new SimpleDateFormat("yyyy/MM/dd");
        Date fechaDate = null;
        try {
            fechaDate = (Date) formato.parse(fecha);
        } 
        catch (ParseException ex) 
        {
            System.out.println(ex);
        }
        return fechaDate;
	}
	
	
	
	

}
