import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Validacion {
    Pattern pa;
    Matcher ma;
    boolean var;

    public Boolean validarName(String nombre) {
        pa = Pattern.compile("[a-z¬ñA-Z¬Ñ\\s]{1,30}");
        ma = pa.matcher(nombre);
        if (ma.matches()) {
            var = true;
            if (nombre.length() >= 4 && nombre.length() < 30) {
                var = true;
            } else {
                for (int i = 0; i < nombre.length(); i++) {
                    if (nombre.charAt(i) == ' ' && nombre.charAt(i + 1) == ' ') {
                        var = false;
                        break;
                    }
                }
            }

        } else {
            var = false;
        }
        return var;
    }

    boolean valap;

    public Boolean validarApellidos(String apellidos) {
        pa = Pattern.compile("[a-z¬ñA-Z¬Ñ\\s]{1,20}");
        ma = pa.matcher(apellidos);
        if (ma.matches()) {
            valap = true;
            if (apellidos.length() >= 4 && apellidos.length() < 20) {
                valap = true;
            } else {
                for (int i = 0; i < apellidos.length(); i++) {
                    if (apellidos.charAt(i) == ' ' && apellidos.charAt(i + 1) == ' ') {
                        valap = false;
                        break;
                    }
                }
            }
        } else {
            valap = false;
        }
        return valap;
    }

    boolean valus;

    public Boolean validarUserName(String userName) {
        pa = Pattern.compile("[a-z¬ñA-Z¬Ñ\\s0-9]{1,20}");
        ma = pa.matcher(userName);
        if (ma.matches()) {
            valus = true;
            if (userName.length() >= 4 && userName.length() < 20) {
                valus = true;
            } else {
                for (int i = 0; i < userName.length(); i++) {
                    if (userName.charAt(i) == ' ' && userName.charAt(i + 1) == ' ') {
                        valus = false;
                        break;
                    }
                }
            }
        } else {
            valus = false;
        }
        return valus;
    }

    boolean valpass;

    public Boolean validarPass(String password) {
        pa = Pattern.compile("[a-z¬ñA-Z¬Ñ\\s0-9!#$%&/.,-_^*]{1,30}");
        ma = pa.matcher(password);
        if (ma.matches()) {
            valpass = true;
            if (password.length() >= 4 && password.length() < 20) {
                valpass = true;
            } else {
                for (int i = 0; i < password.length(); i++) {
                    if (password.charAt(i) == ' ') {
                        valpass = false;
                        break;
                    }
                }
            }
        } else {
            valpass = false;
        }
        return valpass;
    }


    public boolean validarArticulo(String articulo) {
        if (articulo.length() < 3 || articulo.length() > 30) {
            return false;
        } else {
            String checkOK = "ABCDEFGHIJKLMNÑOPQRSTUVWXYZabcdefghijklmnñopqrstuvwxyzáéíóúÁÉÍÓÚ1234567890!#$%&/()=?¡¿/*-+{}[]_-\\s";
            int prov = 0;
            int space = 0;
            for (int i = 0; i < articulo.length(); i++) {
                for (int j = 0; j < checkOK.length(); j++) {
                    if (articulo.charAt(i) == checkOK.charAt(j)) {
                        prov = prov + 1;
                    } else if (articulo.charAt(i) == ' ') {
                        space++;
                    }
                }
            }
            if (space > 6) {
                return false;
            } else {
                prov = prov + space;
                if (prov == articulo.length()) {
                    return true;
                } else {
                    return false;
                }
            }

        }
    }

    public boolean validarDescripcion(String des) {
        if (des.length() > 500) {
            return false;
        } else {
            return true;
        }
    }

    public boolean validarStock(String cantidad) {
        if ("".equals(cantidad) || cantidad.length() > 10) {
            return false;
        } else {
            String OK = "0123456789";
            int prov = 0;
            for (int i = 0; i < cantidad.length(); i++) {
                for (int j = 0; j < OK.length(); j++) {
                    if (cantidad.charAt(i) == OK.charAt(j)) {
                        prov++;
                    }
                }
            }
            if (prov == cantidad.length()) {
                try {
                    int cant = Integer.parseInt(cantidad);
                    if (cant > 0 && cant < 1000) {
                        return true;
                    } else {
                        return false;
                    }
                } catch (Exception ex) {
                    return false;
                }
            } else {
                return false;
            }
        }
    }

    public boolean validarPrecio(String precio) {
        if ("".equals(precio) || precio.length() > 10) {
            return false;
        } else {
            String OK = "012345.6789";
            int prov = 0;
            for (int i = 0; i < precio.length(); i++) {
                for (int j = 0; j < OK.length(); j++) {
                    if (precio.charAt(i) == OK.charAt(j)) {
                        prov++;
                    }
                }
            }

            System.out.println(prov);
            if (prov == precio.length()) {
                try {
                    float pre = Float.parseFloat(precio);
                    if (pre > 5 && pre < 3000) {
                        return true;
                    } else {
                        return false;
                    }
                } catch (Exception ex) {
                    return false;
                }
            } else {
                return false;
            }

        }
    }

    public boolean validarEmail(String email) {
        if ("".equals(email) || email.length() > 50) {
            return false;
        } else {
            Pattern pattern = Pattern.compile("^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$");
            Matcher mather = pattern.matcher(email);

            if (mather.find() == true) {
                return true;
            } else {
                return false;
            }
        }

    }
}
