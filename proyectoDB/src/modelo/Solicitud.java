package modelo;

import java.util.Date;

public class Solicitud {
	
	
	// ATRIBUTOS
	
		/**
		 * id de la solicitud
		 */
		private int id;
		/**
		 * estado de la solicitud
		 */
		private String estado;
		/**
		 *  observacion de la solicitud
		 */
		private String observacion;
		/**
		 *  feche ini de la solicitud
		 */
		private Date fechaIni; 
		/**
		 * fecha fin de la solicitud
		 */
		private Date fechaFin;
		/**
		 * ced cliente de la solicitud
		 */
		private String cedulaCliente;
		/**
		 * tipo solicitud de la solicitud
		 */
		private int tipoSolicitud;
		/**
		 * cedula funcionario de la solicitud
		 */
		private String cedulaFuncionaario;
		/**
		 * tipo anomalia de la solicitud
		 */
		private int tipoAnomalia;
		/**
		 * tipo producto de la solicitud
		 */
		private int tipoProducto;
		/**
		 * producto de la solicitud
		 */
		private int producto;
		
		
		
		// COSNTRUCTOR
		/**
		 * Constructor de la solicitud
		 * @param id
		 * @param estado
		 * @param observacion
		 * @param fechaIni
		 * @param fechaFin
		 * @param cedulaCliente
		 * @param tipoSolicitud
		 * @param cedulaFuncionaario
		 * @param tipoAnomalia
		 * @param tipoProducto
		 * @param producto
		 */
		public Solicitud(int id, String estado, String observacion, String cedulaCliente,
				int tipoSolicitud, String cedulaFuncionaario, int tipoAnomalia, int tipoProducto, int producto) {
			
			this.id = id;
			this.estado = estado;
			this.observacion = observacion;
			//this.fechaIni = fechaIni;
			//this.fechaFin = fechaFin;
			this.cedulaCliente = cedulaCliente;
			this.tipoSolicitud = tipoSolicitud;
			this.cedulaFuncionaario = cedulaFuncionaario;
			this.tipoAnomalia = tipoAnomalia;
			this.tipoProducto = tipoProducto;
			this.producto = producto;
		}
		
		
		//METODOS
		
		
		/**
		 * @return the id
		 */
		public int getId() {
			return id;
		}
		/**
		 * @param id the id to set
		 */
		public void setId(int id) {
			this.id = id;
		}
		/**
		 * @return the estado
		 */
		public String getEstado() {
			return estado;
		}
		/**
		 * @param estado the estado to set
		 */
		public void setEstado(String estado) {
			this.estado = estado;
		}
		/**
		 * @return the observacion
		 */
		public String getObservacion() {
			return observacion;
		}
		/**
		 * @param observacion the observacion to set
		 */
		public void setObservacion(String observacion) {
			this.observacion = observacion;
		}
		/**
		 * @return the fechaIni
		 */
		public Date getFechaIni() {
			return fechaIni;
		}
		/**
		 * @param fechaIni the fechaIni to set
		 */
		public void setFechaIni(Date fechaIni) {
			this.fechaIni = fechaIni;
		}
		/**
		 * @return the fechaFin
		 */
		public Date getFechaFin() {
			return fechaFin;
		}
		/**
		 * @param fechaFin the fechaFin to set
		 */
		public void setFechaFin(Date fechaFin) {
			this.fechaFin = fechaFin;
		}
		/**
		 * @return the cedulaCliente
		 */
		public String getCedulaCliente() {
			return cedulaCliente;
		}
		/**
		 * @param cedulaCliente the cedulaCliente to set
		 */
		public void setCedulaCliente(String cedulaCliente) {
			this.cedulaCliente = cedulaCliente;
		}
		/**
		 * @return the tipoSolicitud
		 */
		public int getTipoSolicitud() {
			return tipoSolicitud;
		}
		/**
		 * @param tipoSolicitud the tipoSolicitud to set
		 */
		public void setTipoSolicitud(int tipoSolicitud) {
			this.tipoSolicitud = tipoSolicitud;
		}
		/**
		 * @return the cedulaFuncionaario
		 */
		public String getCedulaFuncionaario() {
			return cedulaFuncionaario;
		}
		/**
		 * @param cedulaFuncionaario the cedulaFuncionaario to set
		 */
		public void setCedulaFuncionaario(String cedulaFuncionaario) {
			this.cedulaFuncionaario = cedulaFuncionaario;
		}
		/**
		 * @return the tipoAnomalia
		 */
		public int getTipoAnomalia() {
			return tipoAnomalia;
		}
		/**
		 * @param tipoAnomalia the tipoAnomalia to set
		 */
		public void setTipoAnomalia(int tipoAnomalia) {
			this.tipoAnomalia = tipoAnomalia;
		}
		/**
		 * @return the tipoProducto
		 */
		public int getTipoProducto() {
			return tipoProducto;
		}
		/**
		 * @param tipoProducto the tipoProducto to set
		 */
		public void setTipoProducto(int tipoProducto) {
			this.tipoProducto = tipoProducto;
		}
		/**
		 * @return the producto
		 */
		public int getProducto() {
			return producto;
		}
		/**
		 * @param producto the producto to set
		 */
		public void setProducto(int producto) {
			this.producto = producto;
		}
	
	
	

}
