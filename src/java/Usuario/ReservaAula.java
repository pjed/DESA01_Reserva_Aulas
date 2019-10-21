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
public class ReservaAula {

    private String idReserva;
    private String idFranja;
    private String inicio;
    private String fin;
    private String estadoReserva;

    public ReservaAula() {
    }

    public ReservaAula(String idReserva, String idFranja, String inicio, String fin, String estadoReserva) {
        this.idReserva = idReserva;
        this.idFranja = idFranja;
        this.inicio = inicio;
        this.fin = fin;
        this.estadoReserva = estadoReserva;
    }

    public String getIdReserva() {
        return idReserva;
    }

    public void setIdReserva(String idReserva) {
        this.idReserva = idReserva;
    }

    public String getIdFranja() {
        return idFranja;
    }

    public void setIdFranja(String idFranja) {
        this.idFranja = idFranja;
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

    public String getEstadoReserva() {
        return estadoReserva;
    }

    public void setEstadoReserva(String estadoReserva) {
        this.estadoReserva = estadoReserva;
    }

    @Override
    public String toString() {
        return "ReservaAula{" + "idReserva=" + idReserva + ", idFranja=" + idFranja + ", inicio=" + inicio + ", fin=" + fin + ", estadoReserva=" + estadoReserva + '}';
    }
}
