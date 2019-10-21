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
public class Aula {
    private String codAula;
    private String descripcion;

    public Aula(String codAula, String descripcion) {
        this.codAula = codAula;
        this.descripcion = descripcion;
    }

    public String getCodAula() {
        return codAula;
    }

    public void setCodAula(String codAula) {
        this.codAula = codAula;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    @Override
    public String toString() {
        return "Aula{" + "codAula=" + codAula + ", descripcion=" + descripcion + '}';
    }
}
