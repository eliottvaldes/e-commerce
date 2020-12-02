import java.sql.*;
import java.util.*;

public class Compra {
    
    private int id_com;
    private String fec_com;
    private int id_usr;
    private double total_com;
    
    public Compra(){
        
    }

    public int getId_com() {
        return id_com;
    }

    public void setId_com(int id_com) {
        this.id_com = id_com;
    }

    public String getFec_com() {
        return fec_com;
    }

    public void setFec_com(String fec_com) {
        this.fec_com = fec_com;
    }

    public int getId_usr() {
        return id_usr;
    }

    public void setId_usr(int id_usr) {
        this.id_usr = id_usr;
    }

    public double getTotal_com() {
        return total_com;
    }

    public void setTotal_com(double total_com) {
        this.total_com = total_com;
    }

    //Saber cual fue el ultimo identificador de compras registrado para un seguimiento
    private int ultimoIdRegistrado(Connection cn) throws ClassNotFoundException, SQLException{
        
        int id = 0;
        PreparedStatement pr = null;
        ResultSet rs = null;
        
        try{
            //Ya que es autoincrementable, obtenemos e ultimo
            String q = "Select MAX(id_com) as Id from compra";
            pr = cn.prepareStatement(q);
            rs = pr.executeQuery();
            
            while (rs.next()) {
                id = rs.getInt("Id");
                break;
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
            System.out.println(ex.getMessage());
            }
        }
        return id;
    }
    
    //Para registrar la compra :
    public boolean registrarCompra(Compra com, Vector<DCompra> ldc) throws ClassNotFoundException, SQLException{
        
        boolean registro = false;
        Connection cn = null;
        PreparedStatement pr = null;
        
        try{
            cn = Conexion.getConexion();
            String q = "insert into compra(fec_com, id_usr, total_com) "
                    + "values (?, ?, ?)";
            pr = cn.prepareStatement(q);
            pr.setString(1, com.getFec_com());
            pr.setInt(2, com.getId_usr());
            pr.setDouble(3, com.getTotal_com());
            
            if(pr.executeUpdate()==1){
                int id = this.ultimoIdRegistrado(cn);
                registro = this.registrarDCompra(id, ldc, cn);
            }else{
                registro = false;
            }
        }catch(SQLException ex){
            ex.printStackTrace();
            registro = false;
        }finally{
            try{
                pr.close();
                cn.close();
            }catch(SQLException ex){
            ex.printStackTrace();
            System.out.println(ex.getMessage());
            }
        }
        return registro;
        
    }
    
    private boolean registrarDCompra(int id, Vector<DCompra> ldc, Connection cn){
        boolean registro = false;
        PreparedStatement pr = null;
        
        try{
            for(DCompra dc : ldc){
                String q = "insert into dcompra values (?, ?, ?, ?, ?)";
            
                pr = cn.prepareStatement(q);
                pr.setInt(1, id);
                pr.setInt(2, dc.getItem_com());
                pr.setInt(3, dc.getId_art());
                pr.setInt(4, dc.getCant_com());
                pr.setDouble(5, dc.getSubt_com());
                
                if(pr.executeUpdate()==1){
                    registro = true;
                }else{
                    registro = false;
                    break;
                }
            }
        }catch(SQLException ex){
            ex.printStackTrace();
            registro = false;
        }finally{
            try{
                pr.close();
                cn.close();
            }catch(SQLException ex){
            ex.printStackTrace();
            System.out.println(ex.getMessage());
            }
        }
        return registro;
    }
    
}
