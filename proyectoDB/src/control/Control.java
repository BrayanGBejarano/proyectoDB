package control;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class Control {
	
	protected static  Connection connection;
	
	
	
	public static Connection getConection() throws Exception {
		if(connection==null) {
			connection=conectar();
		}
		return connection;
	}
	protected static Connection conectar() throws Exception {
		String ip="200.3.193.24";
		String user="P09551_1_10";
		String password=user;
		 Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection contection=DriverManager.getConnection("jdbc:oracle:thin:@//200.3.193.24:1522/ESTUD",user,password);
		return contection;
	}
	
	public  void TerminarConexion() throws SQLException {
		if ( connection != null ) {
			if( !connection.isClosed()) {
				connection.close();
			}
		}
	}
	
public void commit() {
		
		try {
			Statement stmt =  connection.createStatement();
			Boolean re = stmt.execute(
					"COMMIT");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
	}
	
		
	
	

}
