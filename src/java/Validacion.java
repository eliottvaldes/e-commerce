import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author Melyz
 */
public class Validacion {
    
    public boolean validarNombre(String nombre){
        if(nombre.length()<3 || nombre.length()>30){
            return false;
        }else{
            String checkOK="ABCDEFGHIJKLMNÑOPQRSTUV WXYZabcdefghijklmnñopqrstuvwxyzáéíóúÁÉÍÓÚ\\s";
            int space = 0;
            int prov=0;
            for(int i=0; i<nombre.length(); i++){
                for(int j=0; j<checkOK.length(); j++){
                    if(nombre.charAt(i)==checkOK.charAt(j)){
                        prov=prov+1;
                    }else if(nombre.charAt(i)==' '){
                        space++;
                    }
                }
            }
            if(space>5){
                return false;
            }else{
                if(prov==nombre.length()){
                    return true;
                }else{
                    return false;
                }
            }
        }
    }
    
    public boolean validarApellido(String nombre){
        if(nombre.length()<3 || nombre.length()>20){
            return false;
        }else{
            String checkOK="ABCDEFGHIJKLMNÑOPQRSTUVWXYZabcdefghijklmnñopqrstuvwxyzáéíóúÁÉÍÓÚ\\s";
            int space = 0;
            int prov=0;
            for(int i=0; i<nombre.length(); i++){
                for(int j=0; j<checkOK.length(); j++){
                    if(nombre.charAt(i)==checkOK.charAt(j)){
                        prov=prov+1;
                    }else if(nombre.charAt(i)==' '){
                        space++;
                    }
                }
            }
            if(space>5){
                return false;
            }else{
                if(prov==nombre.length()){
                    return true;
                }else{
                    return false;
                }
            }
        }
    }
    
    public boolean validarUsuario(String usuario){
        if(usuario.length()<3 || usuario.length()>20){
            return false;
        }else{
            String checkOK="ABCDEFGHIJKLMNÑOPQRSTUVWXYZabcdefghijklmnñopqrstuvwxyzáéíóúÁÉÍÓÚ1234567890._-\\s";
            int prov=0;
            for(int i=0; i<usuario.length(); i++){
                for(int j=0; j<checkOK.length(); j++){
                    if(usuario.charAt(i)==checkOK.charAt(j)){
                        prov=prov+1;
                    }
                }
            }
            if(prov==usuario.length()){
                return true;
            }else{
                return false;
            }
        }
    }

    public boolean validarContraseña(String password){
        if(password.length()<6 || password.length()>15){
            return false;
        }else{
            String checkOK="ABCDEFGHIJKLMNÑOPQRSTUVWXYZabcdefghijklmnñopqrstuvwxyzáéíóúÁÉÍÓÚ1234567890!#$%&/()=?¡¿@/*-+{}[]_-.\\s";
            int prov=0;
            for(int i=0; i<password.length(); i++){
                for(int j=0; j<checkOK.length(); j++){
                    if(password.charAt(i)==checkOK.charAt(j)){
                        prov=prov+1;
                    }
                }
            }
            if(prov==password.length()){
                return true;
            }else{
                return false;
            }
        }
    }
    
    public boolean validarArticulo(String articulo){
        if(articulo.length()<3 || articulo.length()>30){
            return false;
        }else{
            String checkOK="ABCDEFGHIJKLMNÑOPQRSTUVWXYZabcdefghijklmnñopqrstuvwxyzáéíóúÁÉÍÓÚ1234567890!#$%&/()=?¡¿/*-+{}[]_-\\s";
            int prov=0;
            int space = 0;
            for(int i=0; i<articulo.length(); i++){
                for(int j=0; j<checkOK.length(); j++){
                    if(articulo.charAt(i)==checkOK.charAt(j)){
                        prov=prov+1;
                    }else if(articulo.charAt(i)== ' '){
                        space++;
                    }
                }
            }
            if (space>6){
                return false;
            }else{
                prov = prov+space;
                if(prov==articulo.length()){
                return true;
                }else{
                    return false;
                }
            }
            
        }
    }
    public boolean validarDescripcion(String des){
        if(des.length()>500){
            return false;
        }else{
            return true;
        }
    }
    
    public boolean validarStock(String cantidad){
        if("".equals(cantidad) || cantidad.length()>10){
            return false;
        }else{
            String OK = "0123456789";
            int prov=0;
            for (int i = 0; i < cantidad.length(); i++) {
                for (int j = 0; j < OK.length(); j++) {
                    if(cantidad.charAt(i)==OK.charAt(j)){
                       prov++; 
                    }
                }
            }
            if(prov==cantidad.length()){
                try{
                    int cant = Integer.parseInt(cantidad);
                    if(cant>0 && cant<1000){
                        return true;
                    }else{
                        return false;
                    }
                }catch(Exception ex){
                    return false;
                }
            }else{
                return false;
            }
        }
    }
    public boolean validarPrecio(String precio){
        if("".equals(precio) || precio.length()>10){
            return false;
        }else{
            String OK = "012345.6789";
            int prov=0;
            for (int i = 0; i < precio.length(); i++) {
                for (int j = 0; j < OK.length(); j++) {
                    if(precio.charAt(i) == OK.charAt(j)){
                       prov++; 
                    }
                }
            }
            
                System.out.println(prov);
                if(prov==precio.length()){
                try{
                    float pre = Float.parseFloat(precio);
                    if(pre>5 && pre<3000){
                        return true;
                    }else{
                        return false;
                    }
                    }catch(Exception ex){
                        return false;
                    }
                }else{
                    return false;
                }
            
        }
    }
    public boolean validarEmail(String email){
        if("".equals(email) || email.length()>50){
            return false;
        }else{
                Pattern pattern = Pattern.compile("^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
						+ "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$");

		Matcher mather = pattern.matcher(email);

		if (mather.find() == true) {
                        return true;
		} else {
                        return false;
		}
        }
            
    }
}
