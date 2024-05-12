package es.albarregas.models;

import java.time.LocalDate;
import java.util.Map;

public class Validaciones {

    //Validaciones pasando el Map()
    public boolean validar(Map<String, String> datosFormulario, int dia, int mes, int anio) {
        // Verificar si los campos del formulario están vacíos o nulos
        for (String value : datosFormulario.values()) {
            if (value == null || value.trim().isEmpty()) {
                return false; // Si al menos un campo está vacío o nulo, retorna false
            }
        }
        
        if (!validarNombre(datosFormulario.get("nombre"))) {
            
            return false;
        }

        if (!validarApellidos(datosFormulario.get("apellidos"))) {
            return false;
        }

        // Validar el teléfono
        if (!validarTelefono(datosFormulario.get("telefono"))) {
            return false;
        }

        // Validar el correo electrónico
        if (!validarCorreo(datosFormulario.get("correo"))) {
            return false;
        }
        
        // Validar el correo noches
        if (!validarNumNoches(datosFormulario.get("noches"))) {
            return false;
        }

        if (!validarHabitacion(datosFormulario.get("habitacion"))) {
            return false;
        }
 
        return validarFecha(dia, mes, anio);
    }

    //------------------------Fin del Map()------------------------------
   
    public boolean validarNombre(String nombre) {

        return nombre != null && !nombre.trim().isEmpty();
    }

    public boolean validarApellidos(String apellidos) {

        return apellidos != null && !apellidos.trim().isEmpty();
    }

    public boolean validarTelefono(String telefono) {

        if (telefono.matches("9\\d{8}")) {
            return true;
        }
        return false;
    }

    public boolean validarCorreo(String correo) {

        if (!correo.matches("\\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}\\b")) {
            return false; // Si el correo electrónico no tiene el formato adecuado, retorna false
        }
        return true; // Si todos los campos tienen valores no nulos y no están vacíos, retorna true
    }

    
    public boolean validarNumNoches(String noches) {

        if (noches == null || noches.isEmpty()) {
            return false; // Si el campo número de noches está vacío o nulo, retorna false
        }
        // Convertir el String a int y verificar si es mayor que cero
        int numNoches = Integer.parseInt(noches);
        if (numNoches <= 0) {
            return false; // Si el número de noches es menor o igual a cero, retorna false
        }
        return true;
    }

    public boolean validarHabitacion(String habitacion) {
        if (habitacion != null && (habitacion.equals("Simple") || habitacion.equals("Doble") || habitacion.equals("Matrimonio"))) {
            return true;
        }
        return false;
    }
    
    public boolean validarFecha(int dia, int mes, int anio) {
        LocalDate fechaActual = LocalDate.now();
        // Verificar que el día sea válido para el mes y el año
        if (!this.esDiaValido(dia, mes, anio)) {
            return false;
        }

        // Verificar que la fecha no sea en el pasado
        LocalDate fechaFormulario = LocalDate.of(anio, mes, dia);

        if (fechaFormulario.isBefore(fechaActual) || fechaFormulario.isEqual(fechaActual)) {
            return false;
        }
        return true;
    }

    public boolean esDiaValido(int dia, int mes, int anio) {
        if (dia < 1 || mes < 1 || mes > 12) {
            return false;
        }
        if (dia > 31) {
            return false;
        }
        if (mes == 2) { // Febrero
            if (anio % 4 == 0 && (anio % 100 != 0 || anio % 400 == 0)) { // Año bisiesto
                return dia <= 29;
            } else {
                return dia <= 28;
            }
        } else if (mes == 4 || mes == 6 || mes == 9 || mes == 11) { // Abril, Junio, Septiembre, Noviembre
            return dia <= 30;
        }
        return true;
    }

    // La fecha se termoina de validar en el Controller.java
    public int obtenerNumeroMes(String mesStr) {
        String[] meses = {"Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"};
        for (int i = 0; i < meses.length; i++) {
            if (meses[i].equalsIgnoreCase(mesStr)) {
                return i + 1; // Los meses en LocalDate empiezan en 1
            }
        }
        return 0; // Si el mes no se encuentra, retorna 0
    }

}
