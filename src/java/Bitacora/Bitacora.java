/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Bitacora;

import Costantes.Constantes;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.GregorianCalendar;

/**
 * Este fichero se creará en el servidor:
 * glassfishXX/glassfish/domains/domain1/config
 *
 * @author fernando
 */
public class Bitacora {

    public static void escribirBitacora(String accion, String correoUsuario, String rol) throws SQLException {
        Calendar fecha = new GregorianCalendar();
        int ano = fecha.get(Calendar.YEAR);
        int mes = fecha.get(Calendar.MONTH);
        int dia = fecha.get(Calendar.DAY_OF_MONTH);
        int hora = fecha.get(Calendar.HOUR_OF_DAY);
        int minuto = fecha.get(Calendar.MINUTE);
        /*
        FileWriter fw = null;
        try {
            fw = new FileWriter(Constantes.ficheroBitacora, true);

            try (BufferedWriter bufferedWriter = new BufferedWriter(fw)) {
                bufferedWriter.write(accion + " &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; " + ano + "-" + mes + "-" + dia + " " + hora + ":" + minuto + " &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; " + correoUsuario + " &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; " + rol);
                bufferedWriter.newLine();
            }
        } catch (IOException ex) {
            System.out.println(ex.getMessage());
        }*/
        String f_log= ano + "-" + mes + "-" + dia + " " + hora + ":" + minuto;
        Conexion.ConexionEstatica.abrirBD();
        Conexion.ConexionEstatica.Insertar_Bitacora("bitacora", accion, f_log, correoUsuario, rol);
        Conexion.ConexionEstatica.cerrarBD();
    }
}
