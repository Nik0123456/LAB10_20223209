package com.example.pruebalaboratorio1.daos;

import com.example.pruebalaboratorio1.beans.genero;
import com.example.pruebalaboratorio1.beans.streaming;
import com.example.pruebalaboratorio1.beans.pelicula;

import java.sql.*;
import java.util.ArrayList;

public class listasDao extends baseDao{

    public ArrayList<genero> listarGeneros() {

        ArrayList<genero> listaGeneros = new ArrayList<>();

        String query = "SELECT * FROM mydb.genero";

        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(query))
        {

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {

                System.out.println("Se ha leido correctamente los datos de la tabla genero");

                genero genero = new genero();

                int idGenero = rs.getInt("idGenero");

                genero.setIdGenero(idGenero);

                String nombre = rs.getString("nombre");

                genero.setNombre(nombre);

                listaGeneros.add(genero);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return listaGeneros;
    }

    public ArrayList<streaming> listarStraming() {

        ArrayList<streaming> listaStreaming = new ArrayList<>();

        String query = "SELECT * FROM mydb.Streaming";

        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(query))
        {

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {

                System.out.println("Se ha leido correctamente los datos de la tabla streaming");

                streaming streaming = new streaming();

                int idStreaming = rs.getInt("idStreaming");
                streaming.setIdStreaming(idStreaming);

                String nombreServicio = rs.getString("nombreServicio");
                streaming.setNombreServicio(nombreServicio);

                listaStreaming.add(streaming);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return listaStreaming;
    }
}
