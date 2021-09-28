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
public class controles {

    public int comparar(String resp) {
        int codigo = 0;
        try {

            codigo = Integer.parseInt(resp);
        } catch (Exception e) {
            return 0;
        }
        return codigo;
    }
}
