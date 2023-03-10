/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.nio.file.FileSystems;
import java.nio.file.Path;
import java.util.Base64;
import javax.imageio.ImageIO;
import sun.misc.BASE64Decoder;

/**
 *
 * @author dahe
 */
public class cHuella {
public static  BufferedImage decodificarhuella(String imageString) {
 
        BufferedImage image = null;
        byte[] imageByte = null;
        try {
            BASE64Decoder decoder = new BASE64Decoder();
            imageByte = decoder.decodeBuffer(imageString);
           ByteArrayInputStream bis = new ByteArrayInputStream(imageByte);
            image = ImageIO.read(bis);
            bis.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return image;
    }
    public void crearImagen(BufferedImage huella, byte[] binhuella, int id) {
        try {
            Path path = FileSystems.getDefault().getPath("");
            String directoryName = path.toAbsolutePath().toString() + "\\src\\img\\huella" + id + ".png";
            System.out.println("Current Working Directory is = " + directoryName);
            // Con este código se agregan los bytes al archivo.
            File outputfile = new File(directoryName);
            ImageIO.write(huella, "png", outputfile);
          /*  String code = Base64.getEncoder().encodeToString(binhuella);
            for (int i = 0; i < binhuella.length; i++) {
              //  System.out.print(binhuella[i]);
            }*/

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

    }

    public String imagen64(String nhuella) {
        String base64 = "";
        try {
            Path path = FileSystems.getDefault().getPath("");
            String directoryName = path.toAbsolutePath().toString() + "\\src\\img\\" + nhuella;
            File file = new File(directoryName);
            FileInputStream fileInputStreamReader = new FileInputStream(file);
            byte[] bytes = new byte[(int) file.length()];
            fileInputStreamReader.read(bytes);
            base64 = Base64.getEncoder().encodeToString(bytes);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return base64;
    }
}
