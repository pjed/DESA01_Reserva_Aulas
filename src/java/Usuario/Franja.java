/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Usuario;

/**
 *
 * @author daw201
 */
public class Franja {
    private String idFranja;
    private String inicio;
    private String fin;

    public Franja() {
    }

    public Franja(String idFranja, String inicio, String fin) {
        this.idFranja = idFranja;
        this.inicio = inicio;
        this.fin = fin;
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

    @Override
    public String toString() {
        return "Franja{" + "idFranja=" + idFranja + ", inicio=" + inicio + ", fin=" + fin + '}';
    }
}
