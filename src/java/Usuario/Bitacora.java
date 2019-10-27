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
public class Bitacora {
    private String idLog;
    private String accion;
    private String fyh;
    private String correo;
    private String rol;

    public Bitacora() {
    }

    public Bitacora(String idLog, String accion, String fyh, String correo, String rol) {
        this.idLog = idLog;
        this.accion = accion;
        this.fyh = fyh;
        this.correo = correo;
        this.rol = rol;
    }

    public String getIdLog() {
        return idLog;
    }

    public void setIdLog(String idLog) {
        this.idLog = idLog;
    }

    public String getAccion() {
        return accion;
    }

    public void setAccion(String accion) {
        this.accion = accion;
    }

    public String getFyh() {
        return fyh;
    }

    public void setFyh(String fyh) {
        this.fyh = fyh;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }

    @Override
    public String toString() {
        return "Bitacora{" + "idLog=" + idLog + ", accion=" + accion + ", fyh=" + fyh + ", correo=" + correo + ", rol=" + rol + '}';
    }
}
