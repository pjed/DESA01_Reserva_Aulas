package Conexion;

import Costantes.Constantes;
import Usuario.Aula;
import Usuario.Reserva;
import Usuario.ReservaAula;
import Usuario.ReservaDetalle;
import Usuario.Rol;
import Usuario.Usuario;
import java.io.FileInputStream;
import java.sql.*;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.sql.rowset.serial.SerialBlob;
import javax.swing.JOptionPane;

public class ConexionEstatica {

    //********************* Atributos *************************
    private static java.sql.Connection Conex;
    //Atributo a través del cual hacemos la conexión física.
    private static java.sql.Statement Sentencia_SQL;
    //Atributo que nos permite ejecutar una sentencia SQL
    private static java.sql.ResultSet Conj_Registros;

    public static void abrirBD() {
        try {
            //Cargar el driver/controlador
            String controlador = "com.mysql.jdbc.Driver";
            //String controlador = "oracle.jdbc.driver.OracleDriver";
            //String controlador = "sun.jdbc.odbc.JdbcOdbcDriver"; 
            //String controlador = "org.mariadb.jdbc.Driver"; // MariaDB la version libre de MySQL (requiere incluir la librería jar correspondiente).
            //Class.forName(controlador).newInstance();
            Class.forName(controlador);

            String URL_BD = "jdbc:mysql://localhost/" + Constantes.BBDD;
            //String URL_BD = "jdbc:mariadb://"+this.servidor+":"+this.puerto+"/"+this.bbdd+"";
            //String URL_BD = "jdbc:oracle:oci:@REPASO";
            //String URL_BD = "jdbc:oracle:oci:@REPASO";
            //String URL_BD = "jdbc:odbc:REPASO";

            //Realizamos la conexión a una BD con un usuario y una clave.
            Conex = java.sql.DriverManager.getConnection(URL_BD, Constantes.usuario, Constantes.password);
            Sentencia_SQL = Conex.createStatement();
            System.out.println("Conexion realizada con éxito");
        } catch (Exception e) {
            System.err.println("Exception: " + e.getMessage());
        }

    }

    public static void cerrarBD() {
        try {
            // resultado.close();
            Conex.close();
            System.out.println("Desconectado de la Base de Datos"); // Opcional para seguridad
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "Error de Desconexion", JOptionPane.ERROR_MESSAGE);
        }
    }

    public static Usuario existeUsuario(String usuario, String clave) {
        Usuario existe = null;
        try {
            String sentencia = "SELECT * FROM usuarios WHERE USUARIO =? AND PASSWORD =?";
            //Preparamos la sentencia para evitar la inyección.
            PreparedStatement sentenciaPreparada = ConexionEstatica.Conex.prepareStatement(sentencia);
            sentenciaPreparada.setString(1, usuario);
            sentenciaPreparada.setString(2, clave);

            ConexionEstatica.Conj_Registros = sentenciaPreparada.executeQuery();
            if (ConexionEstatica.Conj_Registros.next())//Si devuelve true es que existe.
            {
                existe = new Usuario(Conj_Registros.getString("DNI_USUARIO"), Conj_Registros.getString("USUARIO"), Conj_Registros.getString("PASSWORD"), Conj_Registros.getString("ACTIVO"), Conj_Registros.getString("FOTO"), Conj_Registros.getString("CORREO"), Conj_Registros.getString("NOMBRE"), Conj_Registros.getString("APELLIDOS"), Conj_Registros.getInt("EDAD"), Conj_Registros.getString("PASSWORD_REP"));
            }
        } catch (SQLException ex) {
            System.out.println("Error en el acceso a la BD.");
        }
        return existe;//Si devolvemos null el usuario no existe.
    }

    public static ArrayList<Rol> obtenerRolesUsuario(Usuario usuario) {
        ArrayList<Rol> roles = new ArrayList<Rol>();
        try {
            String sentencia = "SELECT b.ID_ROL, b.DESC_ROL FROM aulas.rol_usuarios as a, aulas.roles as b where a.ID_ROL = b.ID_ROL and DNI_USUARIO=?";

            PreparedStatement sentenciaPreparada = ConexionEstatica.Conex.prepareStatement(sentencia);
            sentenciaPreparada.setString(1, usuario.getDni());

            ConexionEstatica.Conj_Registros = sentenciaPreparada.executeQuery();
            while (Conj_Registros.next()) {
                roles.add(new Rol(Conj_Registros.getString("ID_ROL"), Conj_Registros.getString("DESC_ROL")));
                //usuario = new Usuario(Conj_Registros.getString("USUARIO"), Conj_Registros.getString("NOMBRE"), Conj_Registros.getInt("EDAD"), Conj_Registros.getString("CLAVE"), Conj_Registros.getString("CLAVE_REP"), Conj_Registros.getString("TIPO"), Conj_Registros.getInt("NUM_SESION"));
//                System.out.println("----");
//                b.mostrarInfo();
//                System.out.println("----");
                //usuarios.add(usuario);
            }
        } catch (SQLException ex) {
        }
        return roles;
    }

    public static ReservaDetalle obtenerDetallesReserva(String idReserva) {
        ReservaDetalle rd = new ReservaDetalle();
        try {
            String sentencia = "SELECT d.COD_AULA, d.DESCRIPCION, a.FECHA, b.INICIO, b.FIN FROM aulas.reservas as a, aulas.franjas as b, aulas.aulas as d WHERE a.AULAS_COD_AULA = d.COD_AULA AND a.FRANJAS_ID_FRANJA = b.ID_FRANJA AND ID_RESERVA = '" + idReserva + "'";

            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia);
            while (Conj_Registros.next()) {
                String codAula = Conj_Registros.getString("COD_AULA");
                String descripcion = Conj_Registros.getString("DESCRIPCION");
                String fecha = Conj_Registros.getDate("FECHA").toString();
                String inicio = Conj_Registros.getString("INICIO");
                String fin = Conj_Registros.getString("FIN");

                rd = new ReservaDetalle(codAula, descripcion, fecha, inicio, fin);
            }
        } catch (SQLException ex) {
        }
        return rd;
    }

    public static ArrayList<Aula> obtenerAulas() {
        ArrayList<Aula> aulas = new ArrayList<Aula>();
        Aula aula;
        try {
            String sentencia = "SELECT * FROM aulas";
            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia);
            while (Conj_Registros.next()) {

                aula = new Aula(Conj_Registros.getString("COD_AULA"), Conj_Registros.getString("DESCRIPCION"));
                aulas.add(aula);
            }
        } catch (SQLException ex) {
        }
        return aulas;
    }

    public static ArrayList<ReservaAula> obtenerReservasFecha(String fecha, String aula) {
        ArrayList<ReservaAula> reservas = new ArrayList<ReservaAula>();
        ReservaAula reserva;
        try {
            String sentencia = "SELECT a.ID_RESERVA, b.ID_FRANJA, b.INICIO, b.FIN, CASE WHEN a.FECHA  IS NULL THEN 'Libre' ELSE 'Reservado' END AS ESTADO_RESERVA \n" +
                                "FROM (aulas.reservas as a \n" +
                                "INNER JOIN aulas.aulas as c\n" +
                                "ON a.AULAS_COD_AULA = c.COD_AULA and c.COD_AULA='"+aula+"')\n" +
                                "RIGHT JOIN aulas.franjas as b \n" +
                                "ON a.FRANJAS_ID_FRANJA = b.ID_FRANJA AND FECHA = DATE('"+fecha+"') \n" +
                                "ORDER BY ID_FRANJA;";

            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia);
            while (Conj_Registros.next()) {

                reserva = new ReservaAula(Conj_Registros.getString("ID_Reserva"), Conj_Registros.getString("ID_FRANJA"), Conj_Registros.getString("INICIO"), Conj_Registros.getString("FIN"), Conj_Registros.getString("ESTADO_RESERVA"));
                reservas.add(reserva);
            }
        } catch (SQLException ex) {
        }
        return reservas;
    }

    public static ArrayList<Reserva> obtenerReservasAulaProfesor(Usuario usuario) {
        ArrayList<Reserva> reservas = new ArrayList<Reserva>();
        Reserva reserva;
        try {
            String sentencia = "SELECT a.ID_RESERVA, a.FECHA, b.ID_FRANJA, b.INICIO, b.FIN, a.AULAS_COD_AULA, a.USUARIOS_DNI_USUARIOS FROM aulas.reservas as a, aulas.franjas as b WHERE a.FRANJAS_ID_FRANJA = b.ID_FRANJA and  a.USUARIOS_DNI_USUARIOS = '" + usuario.getDni() + "';";

            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia);
            while (Conj_Registros.next()) {

                reserva = new Reserva(String.valueOf(Conj_Registros.getInt("ID_RESERVA")), 
                        Conj_Registros.getDate("FECHA").toString(), 
                        String.valueOf(Conj_Registros.getInt("ID_FRANJA")), 
                        Conj_Registros.getString("INICIO"), 
                        Conj_Registros.getString("FIN"), 
                        String.valueOf(Conj_Registros.getInt("AULAS_COD_AULA")), Conj_Registros.getString("USUARIOS_DNI_USUARIOS"));
                reservas.add(reserva);
            }
        } catch (SQLException ex) {
        }
        return reservas;
    }

    /*
    public static LinkedList obtenerCiudades() {
        LinkedList ciudades = new LinkedList<>();
        Ciudad c = null;
        try {
            String sentencia = "SELECT * FROM sectores, ciudades WHERE sectores.Cod_Sector = ciudades.Cod_Sector";
            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia);
            while (Conj_Registros.next()) {
                boolean hab = false;
                if (Conj_Registros.getString("Habitable").equals("s")) {
                    hab = true;
                }
                c = new Ciudad(Conj_Registros.getString("Nombre"), Conj_Registros.getInt("habitantes"), Conj_Registros.getInt("escudos"), hab);
                ciudades.add(c);
            }
        } catch (SQLException ex) {
        }
        return ciudades;
    }

    public static LinkedList obtenerSecoresNH() {
        LinkedList sectoresnh = new LinkedList<>();
        Sector_nh nh = null;
        try {
            String sentencia = "SELECT * FROM sectores, sector_no_h WHERE sectores.Cod_Sector = sector_no_h.Cod_Sector";
            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia);
            while (Conj_Registros.next()) {
                boolean hab = false;
                if (Conj_Registros.getString("Habitable").equals("s")) {
                    hab = true;
                }
                nh = new Sector_nh(Conj_Registros.getString("Descripcion"), hab);
                sectoresnh.add(nh);
            }
        } catch (SQLException ex) {
        }
        return sectoresnh;
    }
     */
    //----------------------------------------------------------
    public static void Modificar_Dato(String tabla, int nueva_edad, Usuario usuario) throws SQLException {
        //String Sentencia = "UPDATE " + tabla + " SET EDAD = " + nueva_edad + " WHERE USUARIO = '" + usuario.getUsuario() + "'";
        //Sentencia_SQL.executeUpdate(Sentencia);
    }

    public static void Modificar_Dato_Sesion(String tabla, int sesion, Usuario usuario) throws SQLException {
        //String Sentencia = "UPDATE " + tabla + " SET NUM_SESION = '" + sesion + "' WHERE USUARIO = '" + usuario.getUsuario() + "'";
        //Sentencia_SQL.executeUpdate(Sentencia);
    }

    public static void Modificar_Contrasena(String tabla, String password, Usuario usuario) throws SQLException {
        String Sentencia = "UPDATE " + tabla + " SET PASSWORD = '" + password + "', PASSWORD_REP = '" + password + "' WHERE DNI_USUARIO = '" + usuario.getDni() + "'";
        Sentencia_SQL.executeUpdate(Sentencia);
    }

    public static void Modificar_Foto(String tabla, String foto, Usuario usuario) throws SQLException {
        String Sentencia = "UPDATE " + tabla + " SET FOTO = '" + foto + "' WHERE USUARIO = '" + usuario.getNombre_usuario() + "'";
        Sentencia_SQL.executeUpdate(Sentencia);
    }

    //----------------------------------------------------------
    public static void Insertar_Dato(String tabla, Usuario usuario) throws SQLException {
        String Sentencia = "INSERT INTO " + tabla
                + " VALUES ('" + usuario.getDni() + "','"
                + usuario.getNombre_usuario() + "','"
                + usuario.getPassword() + "',"
                + usuario.getActivo() + ",'"
                + usuario.getFoto() + "','"
                + usuario.getCorreo() + "','"
                + usuario.getNombre() + "','"
                + usuario.getApellidos() + "','"
                + usuario.getEdad() + "','"
                + usuario.getPassword_rep() + "')";
        Sentencia_SQL.execute(Sentencia);
    }

    public static void Insertar_Reserva(String tabla, String dniUsuario, String idFranja, String codAula, String fecha) throws SQLException {
        String Sentencia = "INSERT INTO " + tabla
                + " VALUES (NULL,'"
                + fecha + "','"
                + idFranja + "',"
                + codAula + ",'"
                + dniUsuario + "')";
        Sentencia_SQL.execute(Sentencia);
    }

    //----------------------------------------------------------
    public static void Borrar_Dato(String tabla, Usuario usuario, String idFranja) throws SQLException {
        String Sentencia = "DELETE FROM " + tabla + " WHERE USUARIOS_DNI_USUARIOS = '" + usuario.getDni() + "' AND ID_RESERVA = '" + idFranja + "';";
        Sentencia_SQL.executeUpdate(Sentencia);
    }

}
