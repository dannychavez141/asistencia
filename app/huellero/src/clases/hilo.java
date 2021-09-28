/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package clases;


import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * 
 * @author Sammy Guergachi <sguergachi at gmail.com>
 */
public class hilo extends Thread{
    public static boolean dispose=true;

    public static boolean isDispose() {
        return dispose;
    }

    public static void setDispose(boolean dispose) {
        hilo.dispose = dispose;
    }
public void run()
{
    while (dispose) {        
        try {
            darhora();
        } catch (InterruptedException ex) {
            Logger.getLogger(hilo.class.getName()).log(Level.SEVERE, null, ex);
        }
;
    }
}
public void darhora() throws InterruptedException{
   Calendar calendario= new GregorianCalendar();
  int hora, minutos, segundos,dia,mes, anio;
    String msj="";
hora =calendario.get(Calendar.HOUR);
minutos = calendario.get(Calendar.MINUTE);
segundos = calendario.get(Calendar.SECOND);
dia =calendario.get(Calendar.DAY_OF_MONTH);
mes = calendario.get(Calendar.MONTH)+1;
anio = calendario.get(Calendar.YEAR);
//   // System.out.println("Hora:"+hora+":"+minutos+":"+segundos+" Fecha:"+dia+"/"+mes+"/"+anio);
//   if(pantalla.conectado==true){
//        msj=" || Estado-CONECTADO";
//   }else{
//    msj=" || Estado-DESCONECTADO";
//   }
// pantalla.txthora.setText("Hora:"+hora+":"+minutos+":"+segundos+"  Fecha:"+dia+"/"+mes+"/"+anio+msj); 
 Thread.sleep(1000);
}
}
