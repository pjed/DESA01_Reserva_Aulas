/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Usuario;

/**
 *
 * @author DarkS
 */
public class Rol {
    
    private String idRol;
    private String descRol;

    
    public Rol() {
     
    }
    
    public Rol(String idRol, String descRol) {
        this.idRol = idRol;
        this.descRol = descRol;
    }

    public String getIdRol() {
        return idRol;
    }

    public void setIdRol(String idRol) {
        this.idRol = idRol;
    }

    public String getDescRol() {
        return descRol;
    }

    public void setDescRol(String descRol) {
        this.descRol = descRol;
    }

    @Override
    public String toString() {
        return "Rol{" + "idRol=" + idRol + ", descRol=" + descRol + '}';
    }    
}
