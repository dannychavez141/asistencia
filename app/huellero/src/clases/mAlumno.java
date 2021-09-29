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

    private String codigo;
    private String nombres;
    private String apepa;
    private String apema;
    private String est;
    private String huella1;
    private String huella2;
    private String imghuella1;
    private String imghuella2;

    public mAlumno(String codigo, String nombres, String apepa, String apema, String est, String huella1, String huella2, String imghuella1, String imghuella2) {
        this.codigo = codigo;
        this.nombres = nombres;
        this.apepa = apepa;
        this.apema = apema;
        this.est = est;
        this.huella1 = huella1;
        this.huella2 = huella2;
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

    public String getHuella1() {
        return huella1;
    }

    public void setHuella1(String huella1) {
        this.huella1 = huella1;
    }

    public String getHuella2() {
        return huella2;
    }

    public void setHuella2(String huella2) {
        this.huella2 = huella2;
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

    @Override
    public String toString() {
        return "mAlumno{" + "codigo=" + codigo + ", nombres=" + nombres + ", apepa=" + apepa + ", apema=" + apema + ", est=" + est + ", huella1=" + huella1 + ", huella2=" + huella2 + ", imghuella1=" + imghuella1 + ", imghuella2=" + imghuella2 + '}';
    }


}
