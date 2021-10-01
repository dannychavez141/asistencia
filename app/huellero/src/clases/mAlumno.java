/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

import java.sql.Blob;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;

/**
 *
 * @author dahelap
 */
public class mAlumno {

    private String codigo;
    private String nombres;
    private String apepa;
    private String apema;
    private String est;
    private String imghuella1;
    private String imghuella2;
    private Blob bhuella1;
    private Blob bhuella2;

    public Blob getBhuella1() {
        return bhuella1;
    }

    public void setBhuella1(Blob bhuella1) {
        this.bhuella1 = bhuella1;
    }

    public Blob getBhuella2() {
        return bhuella2;
    }

    public void setBhuella2(Blob bhuella2) {
        this.bhuella2 = bhuella2;
    }

    public mAlumno(String codigo, String nombres, String apepa, String apema, String est, String imghuella1, String imghuella2, Blob bhuella1, Blob bhuella2) {
        this.codigo = codigo;
        this.nombres = nombres;
        this.apepa = apepa;
        this.apema = apema;
        this.est = est;
        this.imghuella1 = imghuella1;
        this.imghuella2 = imghuella2;
        this.bhuella1 = bhuella1;
        this.bhuella2 = bhuella2;
    }

    public mAlumno(String codigo, String nombres, String apepa, String apema, String est, String imghuella1, String imghuella2) {
        this.codigo = codigo;
        this.nombres = nombres;
        this.apepa = apepa;
        this.apema = apema;
        this.est = est;
        this.imghuella1 = imghuella1;
        this.imghuella2 = imghuella2;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getApepa() {
        return apepa;
    }

    public void setApepa(String apepa) {
        this.apepa = apepa;
    }

    public String getApema() {
        return apema;
    }

    public void setApema(String apema) {
        this.apema = apema;
    }

    public String getEst() {
        return est;
    }

    public void setEst(String est) {
        this.est = est;
    }

    public String getImghuella1() {
        return imghuella1;
    }

    public void setImghuella1(String imghuella1) {
        this.imghuella1 = imghuella1;
    }

    public String getImghuella2() {
        return imghuella2;
    }

    public void setImghuella2(String imghuella2) {
        this.imghuella2 = imghuella2;
    }

    public void crear() throws ClassNotFoundException, SQLException {
        conexionSQL bd = new conexionSQL();
        String sql = "UPDATE `alumno`SET `imghuella1` = ?, `imghuella2` = ?, `bhuella1` = ?, `bhuella2` =? WHERE `codAlu` = ?;";
        PreparedStatement ps = bd.conexion.prepareStatement(sql);
        ps.setString(1, this.imghuella1);
        ps.setString(2, this.imghuella2);
        ps.setBlob(3, bhuella1);
        ps.setBlob(4, bhuella2);
        ps.setString(5, codigo);
        ps.executeUpdate();
        bd.conexion.close();
    }

  

    @Override
    public String toString() {
        return "mAlumno{" + "codigo=" + codigo + ", nombres=" + nombres + ", apepa=" + apepa + ", apema=" + apema + ", est=" + est + ", imghuella1=" + imghuella1 + ", imghuella2=" + imghuella2 + '}';
    }

}
