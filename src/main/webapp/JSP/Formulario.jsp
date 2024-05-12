<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:directive.page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"/>
<!DOCTYPE html>
<c:set var="contextPath" value="${pageContext.request.contextPath}" scope="session"/>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/daisyui@4.10.1/dist/full.min.css" rel="stylesheet" type="text/css"/>
        <script src="https://cdn.tailwindcss.com"></script>
        <style>
            body {
                background-image: url('IMG/recepcion.jpeg');
                background-size: cover;
                background-repeat: no-repeat;
            }
        </style>
        <title>Formulario</title>
    </head>
    <body class="bg-green-100">
        <jsp:directive.include file="/INC/nav.inc"/>
        <div class="flex justify-center items-center">
            <form action="<c:out value="${contextPath}" />/Return" method="post">
                <h1 class="text-4xl font-black text-green-300 underline mt-14">Información Personal</h1>
                <label for="nombre" class="text-2xl font-black text-orange-200">Nombre:</label>
                <div class="flex inline mb-4">
                    <input type="text" class="text-lg font-semibold text-cyan-800 w-96" id="nombre" name="nombre" value="${datosFormulario['nombre']}" readonly><img src="${contextPath}/IMG/checked-green.png">
                </div>

                <label for="apellidos" class="text-2xl font-black text-orange-200">Apellidos:</label>
                <div class="flex inline mb-4">
                    <input type="text" class="text-lg font-semibold text-cyan-800 w-96" id="apellidos" name="apellidos" value= "${datosFormulario['apellidos']}" readonly><img src="${contextPath}/IMG/checked-green.png">
                </div>

                <label for="telefono" class="text-2xl font-black text-orange-200">Teléfono de contacto:</label>
                <div class="flex inline mb-4">
                    <input type="text" class="text-lg font-semibold text-cyan-800 w-96" id="telefono" name="telefono" value="${datosFormulario['telefono']}" readonly><img src="${contextPath}/IMG/checked-green.png">
                </div>

                <label for="correo" class="text-2xl font-black text-orange-200">Correo electrónico:</label><br>
                <div class="flex inline mb-4">
                    <input type="text" class="text-lg font-semibold text-cyan-800 w-96" id="correo" name="correo" value="${datosFormulario['correo']}"  readonly><img src="${contextPath}/IMG/checked-green.png">
                </div>

                <h2 class="text-4xl font-black text-green-300 underline mt-4">Reserva</h2>

                <label for="noches" class="text-2xl font-black text-orange-200">Número de noches:</label><br>
                <div class="flex inline mb-4">
                    <input type="number" class="text-lg font-semibold text-cyan-800 w-24" id="noches" name="noches" value="${datosFormulario['noches']}" readonly></input> <img src="${contextPath}/IMG/checked-green.png">
                </div>
                <label for="fecha" class="text-2xl font-black text-orange-200">Fecha de entrada:</label>
                <div class="flex inline mb-4 font-xl text-cyan-800">
                    <select class="text-lg font-semibold text-cyan-800 ml-4 w-24" name="dia" disabled>
                        <option value="${datosFormulario['dia']}" selected>${datosFormulario['dia']}</option>
                    </select>
                    <select class="text-lg font-semibold text-cyan-800 ml-4 w-32" name="mes" disabled>
                        <option value="${datosFormulario['mes']}" selected>${datosFormulario['mes']}</option>
                    </select>
                    <select class="text-lg font-semibold text-cyan-800 ml-4 w-24" name="anio" disabled>
                        <option value="${datosFormulario['anio']}" selected>${datosFormulario['anio']}</option>
                    </select>
                    <img src="${contextPath}/IMG/checked-green.png">
                </div>
                
                <label for="habitacion" class="text-2xl font-black text-orange-200">Habitacion:</label>
                <div class="flex inline mb-4 text-xl text-green-300 font-black">
                    <label><input type="radio" name="habitacion" value="Simple" ${datosFormulario['habitacion'] == 'Simple' ? 'checked' : ''} readonly> Simple</label>
                    <label><input type="radio" class="ml-4 " name="habitacion" value="Doble" ${datosFormulario['habitacion'] == 'Doble' ? 'checked' : ''} readonly> Doble</label>
                    <label><input type="radio" class="ml-4 " name="habitacion" value="Matrimonio" ${datosFormulario['habitacion'] == 'Matrimonio' ? 'checked' : ''} readonly> Matrimonio</label>
                    <img src="${contextPath}/IMG/checked-green.png">
                </div>

                <label for="suplementos" class="text-2xl font-black text-orange-200">Suplementos:</label>
                <div class="flex inline mb-4 text-xl text-green-300 font-black">
                    <label><input type="checkbox"  class="form-checkbox h-5 w-5 text-blue-800" name="suplemento" value="Desayuno" ${datosFormulario['suplementos'].contains('Desayuno') ? 'checked' : ''} disabled> Desayuno</label>
                    <label><input type="checkbox"  class="form-checkbox h-5 w-5 text-blue-800 ml-4" name="suplemento" value="Almuerzo" ${datosFormulario['suplementos'].contains('Almuerzo') ? 'checked' : ''} disabled> Almuerzo</label>
                    <label><input type="checkbox"  class="form-checkbox h-5 w-5 text-blue-800 ml-4" name="suplemento" value="Merienda" ${datosFormulario['suplementos'].contains('Merienda') ? 'checked' : ''} disabled> Merienda</label>
                    <label><input type="checkbox"  class="form-checkbox h-5 w-5 text-blue-800 ml-4" name="suplemento" value="Cena" ${datosFormulario['suplementos'].contains('Cena') ? 'checked' : ''} disabled> Cena</label>
                </div>

                <label for="comentarios" class="text-2xl font-black text-orange-200">Comentarios:</label>
                <div class="flex inline mb-4">
                    <textarea id="comentarios" name="comentarios" class="text-lg font-semibold text-cyan-800 w-96" rows="4" cols="50" readonly>${datosFormulario['comentarios']}</textarea>
                </div>

                <!-- Botones -->
                <div class="flex items-center justify-between">
                    <input type="submit" value="Limpiar formulario" class="bg-gray-200 text-xl font-black text-gray-800 px-4 py-2 rounded hover:bg-blue-600 mb-20">
                    <input type="submit" value="Enviar formulario" class="bg-blue-500 text-xl font-black text-white px-4 py-2 rounded hover:bg-blue-600 mb-20">
                </div>
            </form>
        </div>
        <jsp:directive.include file="/INC/footer.inc"/>
    </body>
</html>
