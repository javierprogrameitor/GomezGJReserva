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
            <form action="<c:out value="${contextPath}" />/Controller" method="post">
                <h1 class="text-4xl font-black text-green-300 underline mt-14">Información Personal</h1>        
                <!----Nombre------------------------------------------------->
               <label for="nombre" class="text-2xl font-black text-orange-200"><span class="text-lg font-bold text-red-600">(*)</span> Nombre:</label>
                <div class="flex inline mb-4">
                    <input type="text" class="text-lg font-semibold text-cyan-800 w-96" id="nombre" name="nombre"  placeholder="Ejem: Juan" value="<c:if test="${not empty datosFormulario['nombre']}"><c:out value="${datosFormulario['nombre']}" /></c:if>">
                    <c:if test="${not empty datosFormulario}">
                        <c:choose>
                            <c:when test="${resultado.nombreValido}">
                                <img src="${contextPath}/IMG/checked-green.png">
                            </c:when>
                            <c:otherwise>
                                <img src="${contextPath}/IMG/checked-red.png" >
                            </c:otherwise>
                        </c:choose>
                    </c:if>
                </div>
                <!-- Apellidos--------------------------------------------->
                <label for="apellidos" class="text-2xl font-black text-orange-200"><span class="text-lg font-bold text-red-600">(*)</span> Apellidos:</label>     
                <div class=" flex inline mb-4">
                    <input type="text"  class="text-lg font-semibold text-cyan-800 w-96" id="apellidos" name="apellidos" placeholder="Ejem: Sanchez Garcia" value="<c:if test="${not empty datosFormulario['apellidos']}"><c:out value="${datosFormulario['apellidos']}" /></c:if>">
                    <c:if test="${not empty datosFormulario}">
                        <c:choose>
                            <c:when test="${resultado.apellidosValidos}">
                                <img  src="${contextPath}/IMG/checked-green.png">
                            </c:when>
                            <c:otherwise>
                                <img  src="${contextPath}/IMG/checked-red.png" >
                            </c:otherwise>
                        </c:choose>
                    </c:if>
                </div>
                <!---Teléfono----------------------------------------------------->
                <label for="telefono" class="text-2xl font-black text-orange-200"><span class="text-lg font-bold text-red-600">(*)</span> Teléfono de contacto:</label>
                <div class=" flex inline mb-4">
                    <input type="text"  class="text-lg font-semibold text-cyan-800 w-96" id="telefono" name="telefono" placeholder="Ejem: 924781034" value="<c:if test="${not empty datosFormulario['telefono']}"><c:out value="${datosFormulario['telefono']}" /></c:if>">
                    <c:if test="${not empty datosFormulario}">
                        <c:choose>
                            <c:when test="${resultado.telefonoValido}">
                                <img src="${contextPath}/IMG/checked-green.png">
                            </c:when>
                            <c:otherwise>
                                <img src="${contextPath}/IMG/checked-red.png" >
                            </c:otherwise>
                        </c:choose>
                    </c:if>
                </div>            
                <!---Correo------------------------------------------------------>
                <label for="correo" class="text-2xl font-black text-orange-200"><span class="text-lg font-bold text-red-600">(*)</span> Correo electrónico:</label><br>
                <div class=" flex inline mb-4">
                    <input type="text"  class="text-lg font-semibold text-cyan-800 w-96" id="correo" name="correo" placeholder="Ejem: javierprogrameitor@gmail.com" value="<c:if test="${not empty datosFormulario['correo']}"><c:out value="${datosFormulario['correo']}" /></c:if>">
                    <c:if test="${not empty datosFormulario}">
                        <c:choose>
                            <c:when test="${resultado.correoValido}">
                                <img src="${contextPath}/IMG/checked-green.png">
                            </c:when>
                            <c:otherwise>
                                <img src="${contextPath}/IMG/checked-red.png" >
                            </c:otherwise>
                        </c:choose>
                    </c:if>
                </div>
                <!-- Fin de bloque información personal ------------------------------->
                <h2 class="text-4xl font-black text-green-300 underline mt-4">Reserva</h2>           
                <!-----Número de Noches----------------------------------------------------->
                <label for="noches" class="text-2xl font-black text-orange-200"><span class="text-lg font-bold text-red-600">(*)</span> Número de noches:</label><br>
                <div class=" flex inline mb-4">                          
                    <input type="number"  class="text-lg font-semibold text-cyan-800 w-24" id="noches" name="noches" value="<c:if test="${not empty datosFormulario['noches']}"><c:out value="${datosFormulario['noches']}" /></c:if>">
                    <c:if test="${not empty datosFormulario}">
                        <c:choose>
                            <c:when test="${resultado.nochesValidas}">
                                <img src="${contextPath}/IMG/checked-green.png">
                            </c:when>
                            <c:otherwise>
                                <img src="${contextPath}/IMG/checked-red.png" >
                            </c:otherwise>
                        </c:choose>
                    </c:if>
                </div>              
                <!-----Fecha---------------------------------------------------->
                <label for="fecha" class="text-2xl font-black text-orange-200" ><span class="text-lg font-bold text-red-600">(*)</span> Fecha de entrada:</label>
                <div class="flex inline mb-4 font-xl text-cyan-800">
                    <select class="text-lg font-semibold text-cyan-800 ml-4 w-24" name="dia">
                        <c:forEach var="dia" begin="1" end="31">
                            <option value="${dia}" <c:if test="${not empty datosFormulario['dia'] && datosFormulario['dia'] == dia}">selected</c:if>>${dia}</option>
                        </c:forEach>
                    </select>
                    <select class="text-lg font-semibold text-cyan-800 ml-4 w-32" name="mes">
                        <c:forEach var="mes" items="${['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre']}">
                            <option value="${mes}" <c:if test="${not empty datosFormulario['mes'] && datosFormulario['mes'] == mes}">selected</c:if>>${mes}</option>
                        </c:forEach>
                    </select>
                    <select class="text-lg font-semibold text-cyan-800 ml-4 w-24" name="anio">
                        <c:forEach var="anio" begin="2024" end="2030">
                            <option value="${anio}" <c:if test="${not empty datosFormulario['anio'] && datosFormulario['anio'] == anio}">selected</c:if>>${anio}</option>
                        </c:forEach>
                    </select>

                    <c:if test="${not empty datosFormulario}">
                        <c:choose>
                            <c:when test="${resultado.fechaValida}">
                                <img src="${contextPath}/IMG/checked-green.png">
                            </c:when>
                            <c:otherwise>
                                <img src="${contextPath}/IMG/checked-red.png" >
                            </c:otherwise>
                        </c:choose>
                    </c:if>
                </div> 
                <!----Habitacion---------------------------------------------------->
                <label for="habitacion" class="text-2xl font-black text-orange-200"><span class="text-lg font-bold text-red-600">(*)</span> Habitación:</label>
                <div class=" flex inline mb-4 text-xl text-green-300 font-black" >                          

                    <label><input type="radio" name="habitacion" value="Simple" ${datosFormulario['habitacion']}>Simple</label>
                    <label><input type="radio" class="ml-4 " name="habitacion" value="Doble" ${datosFormulario['habitacion'].contains('Doble') ? 'checked' : ''}>Doble</label>
                    <label><input type="radio" class="ml-4 " name="habitacion" value="Matrimonio" ${datosFormulario['habitacion'].contains('Matrimonio') ? 'checked' : ''}>Matrimonio</label>

                    <c:if test="${not empty datosFormulario}">
                        <c:choose>
                            <c:when test="${resultado.habitacionValida}">
                                <img src="${contextPath}/IMG/checked-green.png">
                            </c:when>
                            <c:otherwise>
                                <img src="${contextPath}/IMG/checked-red.png" >
                            </c:otherwise>
                        </c:choose>
                    </c:if>


                </div> 

                <!----Suplementos---------------------------------------------------->
                <label for="suplemento" class="text-2xl font-black text-orange-200">Suplementos:</label>
                <div class=" flex inline mb-4 text-xl text-green-300 font-black" >                          

                    <label><input type="checkbox"  class="form-checkbox h-5 w-5 text-blue-600"  name="suplemento" value="Desayuno" ${datosFormulario['suplementos'].contains('Desayuno') ? 'checked' : ''}>Desayuno</label>
                    <label><input type="checkbox"  class="form-checkbox h-5 w-5 text-blue-600 ml-4"  name="suplemento" value="Almuerzo" ${datosFormulario['suplementos'].contains('Almuerzo') ? 'checked' : ''}>Almuerzo</label>
                    <label><input type="checkbox"  class="form-checkbox h-5 w-5 text-blue-600 ml-4"  name="suplemento" value="Merienda" ${datosFormulario['suplementos'].contains('Merienda') ? 'checked' : ''}>Merienda</label>
                    <label><input type="checkbox"  class="form-checkbox h-5 w-5 text-blue-600 ml-4"  name="suplemento" value="Cena" ${datosFormulario['suplementos'].contains('Cena') ? 'checked' : ''}>Cena</label>
                </div>          
                <!------Comentarios------------------------------------------------>
                <label for="comentarios" class="text-2xl font-black text-orange-200">Comentarios:</label>
                <div class=" flex inline mb-4">                          
                    <textarea id="comentarios" name="comentarios" class="text-lg font-semibold text-cyan-800 w-96" rows="4" cols="50" placeholder="Ejem: Necesito una cama extra" value="<c:if test="${not empty datosFormulario['comentarios']}"><c:out value="${datosFormulario['comentarios']}" /></c:if>"></textarea>
                    </div>
                    <!-- Botones -->
                    <div class="flex items-center justify-between">
                        <input type="reset" value="Limpiar formulario" class="bg-gray-200 text-xl font-black text-gray-800 px-4 py-2 rounded hover:bg-blue-600 mb-20">
                        <input type="submit" value="Enviar formulario" class="bg-blue-500 text-xl font-black text-white px-4 py-2 rounded hover:bg-blue-600 mb-20">
                    </div>
                </form>
            </div>
        <jsp:directive.include file="/INC/footer.inc"/>
    </body>
</html>

