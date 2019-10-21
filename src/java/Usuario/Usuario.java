/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Usuario;

import java.util.ArrayList;


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
    private String foto;
    private String correo;
    private int edad;
    private String nombre;
    private String apellidos;
    private ArrayList<Rol> roles;
    
    public Usuario() {
        
    }

    public Usuario(String dni, String nombre_usuario, String password, String activo, String foto, String correo, String nombre, String apellidos, int edad, String password_rep) {
        this.dni = dni;
        this.nombre_usuario = nombre_usuario;
        this.password = password;
        this.activo = activo;
        this.foto = foto;
        this.correo = correo;
        this.edad = edad;
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.password_rep = password_rep;
        this.roles = null;
    }

    public ArrayList<Rol> getRoles() {
        return roles;
    }

    public void setRoles(ArrayList<Rol> roles) {
        this.roles = roles;
    }


    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
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
        return "Usuario{" + "dni=" + dni + ", nombre_usuario=" + nombre_usuario + ", password=" + password + ", password_rep=" + password_rep + ", activo=" + activo + ", foto=" + foto + ", correo=" + correo + ", edad=" + edad + ", nombre=" + nombre + ", apellidos=" + apellidos + ", roles=" + roles + '}';
    }
}
