package com.example.huelleroapp.clases;

import android.content.Context;
import android.content.SharedPreferences;

public class config {
    private String servidor = "http://asistenciaunu.ccpu.org.pe/";
    Context con;
    SharedPreferences appSettings;
    public config(Context con) {
        this.con = con;
        this.appSettings = con.getSharedPreferences("Preferencias", Context.MODE_PRIVATE);
    }

    public String getServidor() {
        return servidor;
    }

    public void setServidor(String servidor) {
        this.servidor = servidor;
    }



}
