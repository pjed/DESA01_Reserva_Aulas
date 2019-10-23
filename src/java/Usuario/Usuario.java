/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Usuario;

import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;

/**
 *
 * @author daw201
 */
public class Usuario {

    private String dni;
    private String nombre_usuario;
    private String password;
    private String password_rep;
    private String activo;
    private byte[] foto; //Foto en formato binario, será la leída del formulario.
    private Blob fotoBlob; //Formato en formato BLOB será la leída de MySQL.
    private String foto_defecto;
    private String correo;
    private int edad;
    private String nombre;
    private String apellidos;
    private String rol;
    private String descRol;
    private ArrayList<Rol> roles;

    public Usuario() {

    }
    
    public Usuario(String dni, String nombre_usuario, String password, String activo, byte[] foto, Blob fotoBlob, String fotoDefecto, String correo, String nombre, String apellidos, int edad, String password_rep) {
        this.dni = dni;
        this.nombre_usuario = nombre_usuario;
        this.password = password;
        this.activo = activo;
        this.foto = foto;
        this.fotoBlob = fotoBlob;
        this.foto_defecto = fotoDefecto;
        this.correo = correo;
        this.edad = edad;
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.password_rep = password_rep;
        this.roles = null;
    }

    public Usuario(String dni, String nombre_usuario, String password, String activo, byte[] foto, Blob fotoBlob, String fotoDefecto, String correo, String nombre, String apellidos, int edad, String password_rep, String rol) {
        this.dni = dni;
        this.nombre_usuario = nombre_usuario;
        this.password = password;
        this.activo = activo;
        this.foto = foto;
        this.fotoBlob = fotoBlob;
        this.foto_defecto = fotoDefecto;
        this.correo = correo;
        this.edad = edad;
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.password_rep = password_rep;
        this.rol = rol;
    }

    public Usuario(String dni, String correo, String nombre, String apellidos, int edad, String activo, String idRol, String descRol) {
        this.dni = dni;
        this.correo = correo;
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.edad = edad;
        this.activo = activo;
        this.rol = idRol;
        this.descRol = descRol;
        this.nombre_usuario = null;
        this.password = null;
        this.foto = null;
        this.fotoBlob = null;
        this.roles = null;
        this.password_rep = null;
    }

    public String getFoto_defecto() {
        return foto_defecto;
    }

    public void setFoto_defecto(String foto_defecto) {
        this.foto_defecto = foto_defecto;
    }
    
    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }

    public String getDescRol() {
        return descRol;
    }

    public void setDescRol(String descRol) {
        this.descRol = descRol;
    }

    public ArrayList<Rol> getRoles() {
        return roles;
    }

    public void setRoles(ArrayList<Rol> roles) {
        this.roles = roles;
    }

    public byte[] getFoto() {
        return foto;
    }

    public void setFoto(byte[] foto) {
        this.foto = foto;
    }

    public Blob getFotoBlob() {
        return fotoBlob;
    }

    public void setFotoBlob(Blob fotoBlob) {
        this.fotoBlob = fotoBlob;
    }

    public String getFotoimgString() {
        String image = null;
        try {
            byte[] imageBytes = this.fotoBlob.getBytes(1, (int) this.fotoBlob.length());
            String encodedImage = Base64.getEncoder().encodeToString(imageBytes);
            image = "data:image/jpg;base64," + encodedImage;

        } catch (SQLException ex) {
        }
        return image;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getNombre_usuario() {
        return nombre_usuario;
    }

    public void setNombre_usuario(String nombre_usuario) {
        this.nombre_usuario = nombre_usuario;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getActivo() {
        return activo;
    }

    public void setActivo(String activo) {
        this.activo = activo;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getPassword_rep() {
        return password_rep;
    }

    public void setPassword_rep(String password_rep) {
        this.password_rep = password_rep;
    }

    @Override
    public String toString() {
        return "Usuario{" + "dni=" + dni + ", nombre_usuario=" + nombre_usuario + ", password=" + password + ", password_rep=" + password_rep + ", activo=" + activo + ", foto=" + foto + ", fotoBlob=" + fotoBlob + ", correo=" + correo + ", edad=" + edad + ", nombre=" + nombre + ", apellidos=" + apellidos + ", rol=" + rol + ", descRol=" + descRol + ", roles=" + roles + '}';
    }
}
