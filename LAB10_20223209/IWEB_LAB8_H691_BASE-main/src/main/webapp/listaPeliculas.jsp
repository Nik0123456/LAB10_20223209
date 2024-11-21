

<%@page import="java.util.ArrayList"%>
<%@page import="com.example.pruebalaboratorio1.beans.*"%>
<%@page import="java.text.NumberFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    //Job job = (Job) request.getAttribute("job");
    ArrayList<pelicula> listaPeliculas = (ArrayList) request.getAttribute("listaPeliculas");
    ArrayList<genero> listaGeneros = (ArrayList) request.getAttribute("listaGeneros");
    ArrayList<streaming> listaStreaming = (ArrayList) request.getAttribute("listaStreaming");
    String searchTerm = request.getParameter("searchTerm");
    genero generoSeleccionado = (genero) request.getAttribute("generoSeleccionado") != null ? (genero) request.getAttribute("generoSeleccionado") : new genero();
    streaming streamingSeleccionado = (streaming) request.getAttribute("streamingSeleccionado") != null ? (streaming) request.getAttribute("streamingSeleccionado") : new streaming();
    NumberFormat formatter = NumberFormat.getInstance();
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Películas</title>
</head>
<body>

<h1>Lista de Películas</h1>

<form action="listaPeliculas" method="POST">
    <div class="combobox-container">

        <label>Selecciona tus opciones: </label>

        <select name="genero" class="form-control">

            <option>Seleccione un Género</option>
            <% for (genero genero: listaGeneros){ %>

            <option value = "<%=genero.getIdGenero()%>" <%=genero.getIdGenero()== generoSeleccionado.getIdGenero() ? "selected" : ""%> >
                <%=genero.getNombre()%>
            </option>

            <%}%>
        </select>

        <select name="streaming" class="form-control">

            <option>Seleccione un Streaming</option>
            <% for (streaming streaming: listaStreaming){ %>

            <option value = "<%=streaming.getIdStreaming()%>" <%=streaming.getIdStreaming()==streamingSeleccionado.getIdStreaming() ? "selected" : ""%>>
                <%=streaming.getNombreServicio()%>
            </option>

            <%}%>
        </select>

        <input type="hidden" name="action" value="filtrar">
        <button type="submit">Filtrar</button>
        <button type="submit" form="limpiarForm">Limpiar</button>
    </div>

</form>
<form action="listaPeliculas" id="limpiarForm" method="GET">
    <input type="hidden" name="action" value="listar">
</form>


<table border="1">
    <tr>

        <th>Titulo</th>
        <th>Director</th>
        <th>Ano Publicacion</th>
        <th>Rating</th>
        <th>BoxOffice</th>
        <th>Genero</th>
        <th>Duracion</th>
        <th>Streaming</th>
        <th>Premios Oscar</th>
        <th>Actores</th>
        <th>Borrar</th>

    </tr>
    <%
        for (pelicula movie : listaPeliculas) {
    %>
    <tr>

        <td><a href="viewPelicula?idPelicula=<%= movie.getIdPelicula() %>"><%=movie.getTitulo()%></a></td>
        <td><%=movie.getDirector()%></td>
        <td><%=movie.getAnoPublicacion()%></td>
        <td><%=movie.getRating()%>/10</td>
        <td>$<%=formatter.format(movie.getBoxOffice())%></td>
        <td><%=movie.getGenero().getNombre()%></td>
        <td><%= movie.getDuracion() %> </td>
        <td><%=movie.getStreaming().getNombreServicio()%> </td>
        <td><%=movie.isPremioOscar()%> </td>
        <td><a href="listaActores?idPelicula=<%= movie.getIdPelicula() %>">Ver Actores</a></td>
        <%
            if (1 == 1) {
        %>
        <td> <a href="listaPeliculas?action=borrar&idPelicula=<%= movie.getIdPelicula() %>" class="button-link">Borrar</a></td>
        <%
            }
        %>
    </tr>

    <%
        }
    %>

</table>

</body>
</html>