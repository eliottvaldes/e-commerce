
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


//Para el ticket
public class DCompra {
    
    private int id_com;
    private int item_com;
    private int id_art;
    private int cant_com;
    private double subt_com;
    
    public DCompra(){
        
    }

    public int getId_com() {
        return id_com;
    }

    public void setId_com(int id_com) {
        this.id_com = id_com;
    }

    public int getItem_com() {
        return item_com;
    }

    public void setItem_com(int item_com) {
        this.item_com = item_com;
    }

    public int getId_art() {
        return id_art;
    }

    public void setId_art(int id_art) {
        this.id_art = id_art;
    }

    public int getCant_com() {
        return cant_com;
    }

    public void setCant_com(int cant_com) {
        this.cant_com = cant_com;
    }

    public double getSubt_com() {
        return subt_com;
    }

    public void setSubt_com(double subt_com) {
        this.subt_com = subt_com;
    }
    
    
    
}
