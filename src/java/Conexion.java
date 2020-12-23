import java.sql.*;

public class Conexion {
    
    public static Connection getConexion(){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            String url ="jdbc:mysql://localhost:3306/carrito";
            String user = "root";
            String password = "n0m3l0";
            
            return DriverManager.getConnection(url,user,password);
            
        }catch(SQLException ex){
            System.out.println("Error en la BD");
            ex.printStackTrace();     
        }catch(Exception e){
            e.printStackTrace();
            System.out.println("No se conecto a la BD");
        }
        return null;
    }      
}

