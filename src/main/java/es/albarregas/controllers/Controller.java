package es.albarregas.controllers;

import es.albarregas.beans.Reserva;
import es.albarregas.beans.Resultado;
import es.albarregas.models.Validaciones;

import java.io.IOException;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.beanutils.BeanUtils;

/**
 *
 * @author javier
 */
@WebServlet(name = "Controller", urlPatterns = {"/Controller"})
public class Controller extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Codificacion
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        // Crear instancias de las clases Validaciones y Resultado
        Validaciones correcto = new Validaciones();
        Resultado resultado = new Resultado();

        String diaStr = request.getParameter("dia");
        String mesStr = request.getParameter("mes");
        String anioStr = request.getParameter("anio");

        // Parsear los valores a enteros    
        int dia = Integer.parseInt(diaStr);
        int mes = correcto.obtenerNumeroMes(mesStr); // Convertir el mes de nombre a número
        int anio = Integer.parseInt(anioStr);

        String[] habitacion = request.getParameterValues("habitacion");
        String habitacionStr = (habitacion != null) ? String.join(", ", habitacion) : "";

        // Obtener los valores de los suplementos y convertirlos a una cadena única
        String[] suplementos = request.getParameterValues("suplemento");
        String suplementosStr = (suplementos != null) ? String.join(", ", suplementos) : "Ninguno";

        String comentarios = request.getParameter("comentarios");
        if (comentarios == null || comentarios.isEmpty()) {
            comentarios = "comentarios";
        }
        // Crear un Map para almacenar los datos del formulario
        Map<String, String> datosFormulario = new HashMap<>();
        datosFormulario.put("nombre", request.getParameter("nombre"));
        datosFormulario.put("apellidos", request.getParameter("apellidos"));
        datosFormulario.put("telefono", request.getParameter("telefono"));
        datosFormulario.put("correo", request.getParameter("correo"));
        datosFormulario.put("noches", request.getParameter("noches"));
        datosFormulario.put("dia", diaStr);
        datosFormulario.put("mes", mesStr);
        datosFormulario.put("anio", anioStr);
        datosFormulario.put("habitacion", habitacionStr);
        datosFormulario.put("suplementos", suplementosStr);
        datosFormulario.put("comentarios", comentarios);

        boolean valido = correcto.validar(datosFormulario, dia, mes, anio);

        //Validar cada campo realizando la llamada a cada método de validación
        resultado.setNombreValido(correcto.validarNombre(datosFormulario.get("nombre")));
        resultado.setApellidosValidos(correcto.validarApellidos(datosFormulario.get("apellidos")));
        resultado.setTelefonoValido(correcto.validarTelefono(datosFormulario.get("telefono")));
        resultado.setCorreoValido(correcto.validarCorreo(datosFormulario.get("correo")));
        resultado.setNochesValidas(correcto.validarNumNoches(datosFormulario.get("noches")));
        resultado.setFechaValida(correcto.validarFecha(dia, mes, anio));
        resultado.setHabitacionValida(correcto.validarHabitacion(datosFormulario.get("habitacion")));

        //Si no es válido añadimos los datos al Atributo de petición para mostrarlos en el index.jsp
        if (!valido) {
            request.setAttribute("datosFormulario", datosFormulario);
        }
        //Ahora el Beans Reserva.java
        Reserva datos = new Reserva();
        try {
            // Utilizar BeanUtils.populate para llenar la instancia de Reserva con los datos de la solicitud
            BeanUtils.populate(datos, request.getParameterMap());
            // Setear las propiedades adicionales
            datos.setDiaReserva(dia);
            datos.setMesReserva(mes);
            datos.setAnioReserva(anio);
        } catch (Exception e) {
            // Manejar excepciones si ocurren
            e.printStackTrace();
        }
        //Para validar si son nulos o vacios 
        resultado.setValido(valido);
        request.setAttribute("resultado", resultado);
        //Cuando todo es correcto....
        if (valido == true) {
            //Introduzco los datos del formulario en petición para mostrarlo en Formulario.jsp
            request.setAttribute("datosFormulario", datosFormulario);
            request.getRequestDispatcher("JSP/Formulario.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }
}
