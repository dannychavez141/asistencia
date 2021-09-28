/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controladores;

/**
 *
 * @author dahelap
 */
public class mtrabajador {
    private String id;
    private String Dni;
    private String Datos;
 private String login;
  private String pass;

    public mtrabajador(String id, String Dni, String Datos, String login, String pass) {
        this.id = id;
        this.Dni = Dni;
        this.Datos = Datos;
        this.login = login;
        this.pass = pass;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getDni() {
        return Dni;
    }

    public void setDni(String Dni) {
        this.Dni = Dni;
    }

    public String getDatos() {
        return Datos;
    }

    public void setDatos(String Datos) {
        this.Datos = Datos;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }
    
    
}
