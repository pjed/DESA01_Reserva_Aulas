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
public class ReservaDetalle {
    private String codAula;
    private String descAula;
    private String fecha;
    private String inicio;
    private String fin;

    public ReservaDetalle() {
    }

    public ReservaDetalle(String codAula, String descAula, String fecha, String inicio, String fin) {
        this.codAula = codAula;
        this.descAula = descAula;
        this.fecha = fecha;
        this.inicio = inicio;
        this.fin = fin;
    }

    public String getCodAula() {
        return codAula;
    }

    public void setCodAula(String codAula) {
        this.codAula = codAula;
    }

    public String getDescAula() {
        return descAula;
    }

    public void setDescAula(String descAula) {
        this.descAula = descAula;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
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
        return "ReservaDetalle{" + "codAula=" + codAula + ", descAula=" + descAula + ", fecha=" + fecha + ", inicio=" + inicio + ", fin=" + fin + '}';
    }
}
