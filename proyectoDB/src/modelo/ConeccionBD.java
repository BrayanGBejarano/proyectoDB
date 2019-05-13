package modelo;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConeccionBD {
	
	private static  Connection connection;
	public static Connection getConection() throws Exception {
		if(connection==null) {
			connection=conectarYConsultarBD();
		}
		return connection;
	}
	private static Connection conectarYConsultarBD() throws Exception {
		String ip="200.3.193.24";
		String user="P09551_1_10";
		String password=user;
		 Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection contection=DriverManager.getConnection("jdbc:oracle:thin:@//200.3.193.24:1522/ESTUD",user,password);
		return contection;
	}
	
		
	
	

}
