package es.albarregas.beans;

import java.io.Serializable;

public class Reserva implements Serializable {

    private String nombre;
    private String apellidos;
    private String telefono;
    private String correo;
    private String numeroNoche;
    private int diaReserva;
    private int mesReserva;
    private int anioReserva;
    private String[] habitacion;
    private String[] suplementos;
    private String comentarios;

    public String[] getSuplementos() {
        return suplementos;
    }

    public void setSuplementos(String[] suplementos) {
        this.suplementos = suplementos;
    }

    public String getComentarios() {
        return comentarios;
    }

    public void setComentarios(String comentarios) {
        this.comentarios = comentarios;
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

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getNumeroNoche() {
        return numeroNoche;
    }

    public void setNumeroNoche(String numeroNoche) {
        this.numeroNoche = numeroNoche;
    }

    public int getDiaReserva() {
        return diaReserva;
    }

    public void setDiaReserva(int diaReserva) {
        this.diaReserva = diaReserva;
    }

    public int getMesReserva() {
        return mesReserva;
    }

    public void setMesReserva(int mesReserva) {
        this.mesReserva = mesReserva;
    }

    public int getAnioReserva() {
        return anioReserva;
    }

    public void setAnioReserva(int anioReserva) {
        this.anioReserva = anioReserva;
    }

    public String[] getHabitacion() {
        return habitacion;
    }

    public void setHabitacion(String[] habitacion) {
        this.habitacion = habitacion;
    }

}
