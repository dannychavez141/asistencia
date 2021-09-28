/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.nio.file.FileSystems;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Base64;
import javax.imageio.ImageIO;

/**
 *
 * @author dahe
 */
public class cHuella {

    public void crearImagen(BufferedImage huella,byte [] binhuella,int id) {
        try {
            Path path = FileSystems.getDefault().getPath("");
            String directoryName = path.toAbsolutePath().toString() + "\\src\\img\\huella"+id+".png";
            System.out.println("Current Working Directory is = " + directoryName);
            // Con este código se agregan los bytes al archivo.
            File outputfile = new File(directoryName);
            ImageIO.write(huella, "png", outputfile);
            String code=Base64.getEncoder().encodeToString(binhuella);
            for (int i = 0; i < binhuella.length; i++) {
                  System.out.print(binhuella[i]);
            }
          

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

    }
}
