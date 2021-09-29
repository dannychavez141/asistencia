/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

/**
 *
 * @author dahelap
 */
public class mAlumno {
    private String id;
     private String dni;
      private String datos;
       private String rfid;
       private String saldo;

    public String getSaldo() {
        return saldo;
    }

    public void setSaldo(String saldo) {
        this.saldo = saldo;
    }

    public mAlumno(String id, String dni, String datos, String rfid, String saldo) {
        this.id = id;
        this.dni = dni;
        this.datos = datos;
        this.rfid = rfid;
        this.saldo = saldo;
    }

    public mAlumno(String id, String dni, String datos, String rfid) {
        this.id = id;
        this.dni = dni;
        this.datos = datos;
        this.rfid = rfid;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getDatos() {
        return datos;
    }

    public void setDatos(String datos) {
        this.datos = datos;
    }

    public String getRfid() {
        return rfid;
    }

    public void setRfid(String rfid) {
        this.rfid = rfid;
    }
       
    
}
