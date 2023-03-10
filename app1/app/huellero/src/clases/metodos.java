/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package clases;

import java.awt.Desktop;
import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import javax.swing.JOptionPane;

/**
 * 
 * @author Sammy Guergachi <sguergachi at gmail.com>
 */
public class metodos {
public void abriweb(){
    String url="http://intranet.premiumcollege.edu.pe/";
    try {
        Desktop.getDesktop().browse(new URI(url));
    } catch (URISyntaxException ex) {
        JOptionPane.showMessageDialog(null, "Error de ejecucion");
    } catch (IOException ex) {
        JOptionPane.showMessageDialog(null, "Error de ejecucion");
    }

}
}
