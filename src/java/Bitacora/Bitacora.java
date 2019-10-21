/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Bitacora;

import Costantes.Constantes;
import java.io.FileWriter;
import java.io.IOException;
import java.sql.Date;
import java.util.Calendar;
import java.util.GregorianCalendar;

/**
 * Este fichero se creará en el servidor:
 * glassfishXX/glassfish/domains/domain1/config
 *
 * @author fernando
 */
public class Bitacora {

    public static void escribirBitacora(String m) {
        Calendar fecha = new GregorianCalendar();
        int ano = fecha.get(Calendar.YEAR);
        int mes = fecha.get(Calendar.MONTH);
        int dia = fecha.get(Calendar.DAY_OF_MONTH);
        int hora = fecha.get(Calendar.HOUR_OF_DAY);
        int minuto = fecha.get(Calendar.MINUTE);

        FileWriter fw = null;
        System.out.println(m);
        try {
            fw = new FileWriter(Constantes.ficheroBitacora, true);
            fw.write("" + dia + "/" + mes + "/" + ano + "    " + hora + ":" + minuto + " ****** " + m + "\r\n");
            fw.close();
        } catch (IOException ex) {
            System.out.println(ex.getMessage());
        }
    }
}