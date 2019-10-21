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
public class Reserva {
    private String idReserva;
    private String fecha;
    private String id_franja;
    private String inicio;
    private String fin;
    private String codAula;
    private String dniUsuario;

    public Reserva() {
    }

    public Reserva(String idReserva, String fecha, String id_franja, String inicio, String fin, String codAula, String dniUsuario) {
        this.idReserva = idReserva;
        this.fecha = fecha;
        this.id_franja = id_franja;
        this.inicio = inicio;
        this.fin = fin;
        this.codAula = codAula;
        this.dniUsuario = dniUsuario;
    }

    public String getIdReserva() {
        return idReserva;
    }

    public void setIdReserva(String idReserva) {
        this.idReserva = idReserva;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getId_franja() {
        return id_franja;
    }

    public void setId_franja(String id_franja) {
        this.id_franja = id_franja;
    }

    public String getInicio() {
        return inicio;
    }

    public void setInicio(String inicio) {
        this.inicio = inicio;
    }

    public String getFin() {
        return fin;
    }

    public void setFin(String fin) {
        this.fin = fin;
    }

    public String getCodAula() {
        return codAula;
    }

    public void setCodAula(String codAula) {
        this.codAula = codAula;
    }

    public String getDniUsuario() {
        return dniUsuario;
    }

    public void setDniUsuario(String dniUsuario) {
        this.dniUsuario = dniUsuario;
    }

    @Override
    public String toString() {
        return "Reserva{" + "idReserva=" + idReserva + ", fecha=" + fecha + ", id_franja=" + id_franja + ", inicio=" + inicio + ", fin=" + fin + ", codAula=" + codAula + ", dniUsuario=" + dniUsuario + '}';
    }
}
