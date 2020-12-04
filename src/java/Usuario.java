/**
 *
 * @author Melyz
 */

/*Aqui se proporcionan los datos de la BD de una respectiva tabla 
y aqui mismo van a estar los metodos que se encargan del funcionamiento
y operación del usuario con respecto a la tabla*/
import java.sql.*;
import java.util.Vector;

public class Usuario {
    //atributos de la tabla
    private int id_usr;
    private String name_usr;
    private String appat_usr;
    private String apmat_usr;
    private String user_usr;
    private String ema_usr;
    private String pas_usr;
    private int priv_usr;
    
    //Constructor
    public Usuario(){
        
    }
    
    public int getId_usr() {
        return id_usr;
    }

    public void setId_usr(int id_usr) {
        this.id_usr = id_usr;
    }

    public String getName_usr() {
        return name_usr;
    }

    public void setName_usr(String name_usr) {
        this.name_usr = name_usr;
    }

    public String getPas_usr() {
        return pas_usr;
    }

    public void setPas_usr(String pas_usr) {
        this.pas_usr = pas_usr;
    }

    public String getUser_usr() {
        return user_usr;
    }

    public void setUser_usr(String user_usr) {
        this.user_usr = user_usr;
    }

    public String getEma_usr() {
        return ema_usr;
    }

    public void setEma_usr(String ema_usr) {
        this.ema_usr = ema_usr;
    }

    public String getAppat_usr() {
        return appat_usr;
    }

    public void setAppat_usr(String appat_usr) {
        this.appat_usr = appat_usr;
    }

    public String getApmat_usr() {
        return apmat_usr;
    }

    public void setApmat_usr(String apmat_usr) {
        this.apmat_usr = apmat_usr;
    }

    public int getPriv_usr() {
        return priv_usr;
    }

    public void setPriv_usr(int priv_usr) {
        this.priv_usr = priv_usr;
    }
    
    
    //Verificación del tipo de usuario
    public Usuario verificarUsuario(String user_usr, String pas_usr){
        //objeto usuarios
        Usuario u = null;
        //Objeto de conexion
        Connection cn=null;
        //Sentencia sql
        PreparedStatement pr = null;
        //Consultas squl
        ResultSet rs = null;
        
        try{
            cn = Conexion.getConexion();
            String q;
            String part1 = user_usr.substring(0, 2);
            String part2 = pas_usr.substring(0, 2);
            String part3 = user_usr.substring(2, 4);
            String part4 = pas_usr.substring(2, 4);
            String part5 = pas_usr.substring(4, 6);
            String part6 = pas_usr.substring(6, 8);
            //llave de 16 caracteres para cifrar con aes de 128 bits
            String key16 = part1 + "?" + part5 + part2.toUpperCase() + "#" + part4.toUpperCase() + "$" + part3 + part6.toUpperCase() + "%";            
            
            q = "Select * from usuario where  user_usr = ? AND pas_usr = aes_encrypt(?,'"+key16+"')";
           
           pr = cn.prepareStatement(q);
           pr.setString(1, user_usr);
           pr.setString(2, pas_usr);
           
           rs = pr.executeQuery();
           
           while(rs.next()){
               u = new Usuario();
               
               u.setId_usr(rs.getInt("id_usr"));
               u.setName_usr(rs.getString("name_usr"));
               u.setAppat_usr(rs.getString("appat_usr"));
               u.setApmat_usr(rs.getString("apmat_usr"));
               u.setUser_usr(rs.getString("user_usr"));
               u.setEma_usr(rs.getString("ema_usr"));
               u.setPas_usr(rs.getString("pas_usr"));
               u.setPriv_usr(rs.getInt("priv_usr"));
               System.out.println("Si entra aquí");
               break;
           }
           
        }catch(SQLException ex){
            ex.printStackTrace();
            u=null;
        }finally{
            try{
                rs.close();
                pr.close();
                cn.close();
            }catch(SQLException ex){
                ex.printStackTrace();
            }
        }
        return u;
    }
    
    public int crearId(){
        Connection cn=null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        int newid  = 1;
        try{
           cn = Conexion.getConexion();
           String q;
           q ="Select * from usuario";
           
           pr = cn.prepareStatement(q);
           
           rs = pr.executeQuery();
           
           while(rs.next()){
               if(rs.getInt("id_usr")>newid){
                   newid=rs.getInt("id_usr");
               }
           }
           
        }catch(SQLException ex){
            ex.printStackTrace();
        }finally{
            try{
                rs.close();
                pr.close();
                cn.close();
            }catch(SQLException ex){
                ex.printStackTrace();
            }
        }
        return newid+=1;
    }
    
    public String obtenerUserbd(int id){
        String user_usr = "";
        Connection cn=null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        int newid  = 1;
        try{
           cn = Conexion.getConexion();
           String q;
           q ="Select * from usuario where id_usr = "+id;
           
           pr = cn.prepareStatement(q);
           
           rs = pr.executeQuery();
           
           while(rs.next()){
               user_usr = rs.getString("user_usr");
           }
           
        }catch(SQLException ex){
            ex.printStackTrace();
        }finally{
            try{
                rs.close();
                pr.close();
                cn.close();
            }catch(SQLException ex){
                ex.printStackTrace();
            }
        }
        return user_usr;
    }
}
