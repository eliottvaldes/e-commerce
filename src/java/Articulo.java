import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.util.*;
import java.sql.*;

public class Articulo {
    //atributos de la tabla
    private int id_art;
    private String nom_art;
    private String des_art;
    private double prc_art;
    private int stock_art;
    private String igm_art;
    
    public Articulo(){

    }

    public Articulo(int id_art, String nom_art, String des_art, double prc_art, int stock_art, String igm_art) {
        this.id_art = id_art;
        this.nom_art = nom_art;
        this.des_art = des_art;
        this.prc_art = prc_art;
        this.stock_art = stock_art;
        this.igm_art = igm_art;
    }
    
    public int getId_art() {
        return id_art;
    }

    public void setId_art(int id_art) {
        this.id_art = id_art;
    }

    public String getNom_art() {
        return nom_art;
    }

    public void setNom_art(String nom_art) {
        this.nom_art = nom_art;
    }

    public String getDes_art() {
        return des_art;
    }

    public void setDes_art(String des_art) {
        this.des_art = des_art;
    }

    public double getPrc_art() {
        return prc_art;
    }

    public void setPrc_art(double prc_art) {
        this.prc_art = prc_art;
    }

    public int getStock_art() {
        return stock_art;
    }

    public void setStock_art(int stock_art) {
        this.stock_art = stock_art;
    }
    
    public String getIgm_art() {
        return igm_art;
    }

    public void setIgm_art(String igm_art) {
        this.igm_art = igm_art;
    }

    public Vector<Articulo> listaArticulos(){
        //Este metodo es para la onsulta de todos los articulos
        Connection cn = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        
        //Creamos el vector para agrupar los elementos;
            Vector<Articulo> la = new Vector<Articulo>();
        
        try{
            //Establecemos la conexion
            cn = Conexion.getConexion();
            String q = "Select * from articulo";
            
            pr = cn.prepareStatement(q);
            rs = pr.executeQuery();
            
            while(rs.next()){
                //Creamos un objeto articulo para obtener los atributos
                Articulo art = new Articulo();
                art.setId_art(rs.getInt("id_art"));
                art.setNom_art(rs.getString("nom_art"));
                art.setDes_art(rs.getString("des_art"));
                art.setPrc_art(rs.getDouble("prc_art"));
                art.setStock_art(rs.getInt("stock_art"));
                art.setIgm_art(rs.getString("img_art"));
                //Y agregamos los datos del articulo al vector
                la.add(art);
                
            }
        }catch(SQLException ex){
            ex.printStackTrace();
            la = null;
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
         return la; 
    }
    //para generar id
    public int crearId(){
        Connection cn=null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        int newid  = 1;
        try{
           cn = Conexion.getConexion();
           String q;
           q ="Select * from articulo";
           
           pr = cn.prepareStatement(q);
           
           rs = pr.executeQuery();
           
           while(rs.next()){
               if(rs.getInt("id_art")>newid){
                   newid=rs.getInt("id_art");
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
    //Consultar por id
    public Articulo buscarById(int id_art){
        
        Articulo art = null;
        Connection cn = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        
        try{
            cn = Conexion.getConexion();
            String q ="Select * from productos where id_art = ?";
            pr = cn.prepareStatement(q);
            pr.setInt(1, id_art);
            
            rs = pr.executeQuery();
            
            while(rs.next()){
                art = new Articulo();
                art.setId_art(rs.getInt("id_art"));
                art.setNom_art(rs.getString("nom_art"));
                art.setDes_art(rs.getString("des_art"));
                art.setPrc_art(rs.getDouble("prc_art"));
                art.setStock_art(rs.getInt("stock_art"));
            }
        }catch(SQLException ex){
            ex.printStackTrace();
            art = null;
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
        return art;
    }
    
    public boolean actualizarStock(Vector<Articulo> va){
        
        boolean actualizo = false;
        Connection cn = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        
        try{
            cn = Conexion.getConexion();
            //For each ya que no sabemos cuantos productos pueden existir
            for(Articulo art: va){
                String q ="Update articulo set stock_art = ? "
                        + "where id_art = ?";
                
                pr = cn.prepareStatement(q);
                pr.setInt(1, art.getStock_art());
                pr.setInt(2, art.getId_art());
                
                if(pr.executeUpdate() == 1){
                    actualizo = true;
                }else{
                    actualizo = false;
                    break;
                }
            }
        }catch(SQLException ex){
            ex.printStackTrace();
            actualizo = false;
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
        return actualizo;
    }
    
    
   

    
}


