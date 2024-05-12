package es.albarregas.beans;

import java.io.Serializable;

public class Resultado implements Serializable {

    private boolean valido;
    private boolean nombreValido;
    private boolean apellidosValidos;
    private boolean telefonoValido;
    private boolean correoValido;
    private boolean nochesValidas;
    private boolean fechaValida;
    private boolean habitacionValida;

    public boolean isValido() {
        return valido;
    }

    public void setValido(boolean valido) {
        this.valido = valido;
    }

    public boolean isNombreValido() {
        return nombreValido;
    }

    public void setNombreValido(boolean nombreValido) {
        this.nombreValido = nombreValido;
    }

    public boolean isApellidosValidos() {
        return apellidosValidos;
    }

    public void setApellidosValidos(boolean apellidosValidos) {
        this.apellidosValidos = apellidosValidos;
    }

    public boolean isTelefonoValido() {
        return telefonoValido;
    }

    public void setTelefonoValido(boolean telefonoValido) {
        this.telefonoValido = telefonoValido;
    }

    public boolean isCorreoValido() {
        return correoValido;
    }

    public void setCorreoValido(boolean correoValido) {
        this.correoValido = correoValido;
    }

    public boolean isNochesValidas() {
        return nochesValidas;
    }

    public void setNochesValidas(boolean nochesValidas) {
        this.nochesValidas = nochesValidas;
    }

    public boolean isFechaValida() {
        return fechaValida;
    }

    public void setFechaValida(boolean fechaValida) {
        this.fechaValida = fechaValida;
    }

    public boolean isHabitacionValida() {
        return habitacionValida;
    }

    public void setHabitacionValida(boolean habitacionValida) {
        this.habitacionValida = habitacionValida;
    }


}
