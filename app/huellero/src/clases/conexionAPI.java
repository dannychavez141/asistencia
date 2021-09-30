/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Vector;
import javax.swing.JOptionPane;

/**
 *
 * @author dahelap
 */
public class conexionAPI {

    private static String urlRec;

    public conexionAPI() {

        this.urlRec = "http://localhost/asistencia/apis";

    }

    public String getUrlRec() {
        return urlRec;
    }

    public void setUrlRec(String urlRec) {
        this.urlRec = urlRec;
    }

    public Vector datosAlumnos(String bus) {
        Vector Alumnos = new Vector();
        String respuesta = "";
        try {
            respuesta = peticionHttpGet(this.urlRec + "/alumnosApi.php?ac=todos&busq=" + bus);
            //  System.out.println("La respuesta es:\n" + respuesta);
        } catch (Exception e) {
            // Manejar excepción
            e.printStackTrace();
        }
        JsonParser parser = new JsonParser();
        JsonArray gsonArr = parser.parse(respuesta).getAsJsonArray();
        for (JsonElement obj : gsonArr) {
            // Object of array
            JsonObject gsonObj = obj.getAsJsonObject();
            String codigo = gsonObj.get("codAlu").getAsString();
            String nombres = gsonObj.get("nomAlu").getAsString();
            String apepa = gsonObj.get("apepaAlu").getAsString();
            String apema = gsonObj.get("apemaAlu").getAsString();
            String est = gsonObj.get("est").getAsString();
            String huella1 = gsonObj.get("huella1").getAsString();
            String huella2 = gsonObj.get("huella2").getAsString();
            String imgh1 = gsonObj.get("imghuella1").getAsString();
            String imgh2 = gsonObj.get("imghuella2").getAsString();
            mAlumno alumno = new mAlumno(codigo, nombres, apepa, apema, est, huella1, huella2, imgh1, imgh2);
            System.out.println(alumno.toString());
            Alumnos.add(alumno);
        }

        return Alumnos;
    }

    public mAlumno buscarAlumno(String id) {
        mAlumno alumno = null;
        String respuesta = "";
        try {
            String url = this.urlRec + "/alumnosApi.php?ac=buno&cod=" + id;
            System.out.println(url);
            respuesta = peticionHttpGet(url);
            System.out.println("La respuesta es:\n" + respuesta);
        } catch (Exception e) {
            // Manejar excepción
            e.printStackTrace();
        }

        try {
            JsonParser parser = new JsonParser();
            JsonArray json = (JsonArray) parser.parse(respuesta);
            System.out.println(json);

            for (JsonElement obj : json) {
                System.out.println(obj);
                // Object of array
                JsonObject gsonObj = obj.getAsJsonObject();

                // Primitives elements of object
                String codigo = gsonObj.get("codAlu").getAsString();
                String nombres = gsonObj.get("nomAlu").getAsString();
                String apepa = gsonObj.get("apepaAlu").getAsString();
                String apema = gsonObj.get("apemaAlu").getAsString();
                String est = gsonObj.get("est").getAsString();
                String huella1 = gsonObj.get("huella1").getAsString();
                String huella2 = gsonObj.get("huella2").getAsString();
                String imgh1 = gsonObj.get("imghuella1").getAsString();
                String imgh2 = gsonObj.get("imghuella2").getAsString();
                alumno = new mAlumno(codigo, nombres, apepa, apema, est, huella1, huella2, imgh1, imgh2);

            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return alumno;
    }

    public static String peticionHttpGet(String urlParaVisitar) throws Exception {
        // Esto es lo que vamos a devolver
        StringBuilder resultado = new StringBuilder();
        // Crear un objeto de tipo URL
        URL url = new URL(urlParaVisitar);

        // Abrir la conexión e indicar que será de tipo GET
        HttpURLConnection conexion = (HttpURLConnection) url.openConnection();
        conexion.setRequestMethod("GET");
        // Búferes para leer
        BufferedReader rd = new BufferedReader(new InputStreamReader(conexion.getInputStream()));
        String linea;
        // Mientras el BufferedReader se pueda leer, agregar contenido a resultado
        while ((linea = rd.readLine()) != null) {
            resultado.append(linea);
        }
        // Cerrar el BufferedReader
        rd.close();
        // Regresar resultado, pero como cadena, no como StringBuilder
        return resultado.toString();
    }

    public static String peticionHttpPost(String urlParaVisitar, String[] datos, String metodo) throws Exception {
        // Esto es lo que vamos a devolver
        StringBuilder resultado = new StringBuilder();
        // Crear un objeto de tipo URL
        URL url = new URL(urlRec + urlParaVisitar);

        // Abrir la conexión e indicar que será de tipo GET
        HttpURLConnection con = (HttpURLConnection) url.openConnection();
        con.setDoOutput(true);
        con.setDoInput(true);
        con.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
        con.setRequestProperty("Accept", "application/json");
        con.setRequestMethod("POST");
        con.connect();
        JsonObject params = new JsonObject();

        params.addProperty("ac", metodo);
        for (int i = 0; i < datos.length; i++) {
            params.addProperty("" + i, datos[i]);
        }
        System.out.println(params.toString());
        OutputStreamWriter wr = new OutputStreamWriter(con.getOutputStream());
        wr.write(params.toString());
        wr.flush();
        wr.close();
        // Búferes para leer
        BufferedReader rd = new BufferedReader(new InputStreamReader(con.getInputStream()));
        String linea;
        // Mientras el BufferedReader se pueda leer, agregar contenido a resultado
        while ((linea = rd.readLine()) != null) {
            resultado.append(linea);
        }
        // Cerrar el BufferedReader
        rd.close();
        // Regresar resultado, pero como cadena, no como StringBuilder
        return resultado.toString();
    }

    public void consultar(String consulta) throws Exception {
        String respuesta = peticionHttpGet(consulta);
        JOptionPane.showMessageDialog(null, respuesta);
    }
}
