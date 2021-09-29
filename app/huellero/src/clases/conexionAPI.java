/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

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

    private String direccionUsu;
    private String direccionAlum;
    private String consulta;
    private String urlRec;

    public conexionAPI() {

        this.direccionUsu = direccionUsu;
        this.direccionAlum = direccionAlum;
        this.consulta = consulta;
        this.urlRec = urlRec;

    }

    public String getUrlRec() {
        return urlRec;
    }

    public void setUrlRec(String urlRec) {
        this.urlRec = urlRec;
    }

    public conexionAPI(String direccionUsu, String direccionAlum, String consulta) {
        this.direccionUsu = direccionUsu;
        this.direccionAlum = direccionAlum;
        this.consulta = consulta;
    }

    public String getDireccionUsu() {
        return direccionUsu;
    }

    public void setDireccionUsu(String direccionUsu) {
        this.direccionUsu = direccionUsu;
    }

    public String getDireccionAlum() {
        return direccionAlum;
    }

    public void setDireccionAlum(String direccionAlum) {
        this.direccionAlum = direccionAlum;
    }

    public String getConsulta() {
        return consulta;
    }

    public void setConsulta(String consulta) {
        this.consulta = consulta;
    }

    public Vector datosTrabajadores() {
        Vector Trabajadores = new Vector();
        String respuesta = "";
        try {
            respuesta = peticionHttpGet(direccionUsu);
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

            // Primitives elements of object
            String id = gsonObj.get("idUsuario").getAsString();
            String dni = gsonObj.get("dni").getAsString();
            String datos = gsonObj.get("nomb").getAsString() + " " + gsonObj.get("apepa").getAsString() + " " + gsonObj.get("apema").getAsString();
            String login = gsonObj.get("dni").getAsString();
            String pass = gsonObj.get("pass").getAsString();
            // mtrabajador trabajador = new mtrabajador(id, dni, datos, login, pass);
            // Trabajadores.add(trabajador);
        }

        return Trabajadores;

    }

    public Vector datosAlumnos(String bus) {
        Vector Alumnos = new Vector();
        String respuesta = "";
        try {
            respuesta = peticionHttpGet(direccionAlum + bus);
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
            String id = gsonObj.get("idAlumnos").getAsString();
            String dni = gsonObj.get("dni").getAsString();
            String datos = gsonObj.get("alu").getAsString();
            String rfid = gsonObj.get("targeta").getAsString();
            String saldo = gsonObj.get("saldo").getAsString();
            mAlumno alumno = new mAlumno(id, dni, datos, rfid, saldo);
            Alumnos.add(alumno);
        }

        return Alumnos;
    }

    public mAlumno buscarAlumno(String rfidc) {
        mAlumno alumno = null;
        String respuesta = "";
        try {
            String url = consulta + rfidc;
            System.out.println(url);
            respuesta = peticionHttpGet(url);
            //  System.out.println("La respuesta es:\n" + respuesta);
        } catch (Exception e) {
            // Manejar excepción
            e.printStackTrace();
        }
        JsonParser parser = new JsonParser();
        try {
            JsonArray gsonArr = parser.parse(respuesta).getAsJsonArray();
            for (JsonElement obj : gsonArr) {

                // Object of array
                JsonObject gsonObj = obj.getAsJsonObject();

                // Primitives elements of object
                String id = gsonObj.get("idAlumnos").getAsString();
                String dni = gsonObj.get("dni").getAsString();
                String datos = gsonObj.get("alu").getAsString();
                String rfid = gsonObj.get("targeta").getAsString();
                String saldo = gsonObj.get("saldo").getAsString();
                alumno = new mAlumno(id, dni, datos, rfid, saldo);

            }
        } catch (Exception e) {
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

    public static String peticionHttpPost(String urlParaVisitar, String[] datos) throws Exception {
        // Esto es lo que vamos a devolver
        StringBuilder resultado = new StringBuilder();
        // Crear un objeto de tipo URL
        URL url = new URL(urlParaVisitar);

        // Abrir la conexión e indicar que será de tipo GET
        HttpURLConnection con = (HttpURLConnection) url.openConnection();
        con.setDoOutput(true);
        con.setDoInput(true);
        con.setRequestProperty("Content-Type", "application/json");
        con.setRequestProperty("Accept", "application/json");
        con.setRequestMethod("POST");
        JsonObject params = new JsonObject();
        for (int i = 0; i < datos.length; i++) {
            params.addProperty("" + i, datos[i]);
        }
        OutputStreamWriter wr = new OutputStreamWriter(con.getOutputStream());
        wr.write(params.toString());
        wr.flush();

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

    public void cambiarRfid(String id, String rfid, String Usuario) throws Exception {

        /*String url = urlFid + "key=acm1ptbt&id=" + id + "&targeta=" + rfid + "&usuario=" + Usuario;
        System.out.println(url);
        String respuesta = peticionHttpGet(url);
        JOptionPane.showMessageDialog(null, respuesta);*/
    }

    public void recarga(String id, String Usuario, String recarga, String saldo) throws Exception {

        String url = urlRec + "key=acm1ptbt&id=" + id + "&usuario=" + Usuario + "&monto=" + recarga + "&saldo=" + saldo;
        System.out.println(url);
        String respuesta = peticionHttpGet(url);
        JOptionPane.showMessageDialog(null, respuesta);
    }

    public void consultar() throws Exception {
        String respuesta = peticionHttpGet(consulta);
        JOptionPane.showMessageDialog(null, respuesta);
    }
}
