package premium;

import clases.hilo;
import com.panamahitek.ArduinoException;
import com.panamahitek.PanamaHitek_Arduino;
import controladores.conexionAPI;
import controladores.mAlumno;
import controladores.mtrabajador;
import java.awt.Dimension;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
import jssc.SerialPortEvent;
import jssc.SerialPortEventListener;
import jssc.SerialPortException;

public class pantalla extends javax.swing.JFrame {

    public static Vector Alumnos;
    public static mtrabajador Usuario;
    public static AsignarTarjeta asignar ;
    public static buscarAlumno buscar;
     public static String urlBase = "http://intranet.premiumcollege.edu.pe/";
    public static String direccionUsu = urlBase +"ajax/verUsuarios.php?clave=acm1ptbt";
    public static String direccionAlum = urlBase +"ajax/cAlumnos.php?control=all&bus=";
    public static String urlFid = urlBase +"ajax/cAlumnos.php?control=updaterfid&";
    public static String urlRec = urlBase +"ajax/cAlumnos.php?control=rec&";
    public static String consulta = urlBase +"ajax/cAlumnos.php?control=rfid&id=";
    public static controladores.conexionAPI conexion = new conexionAPI(direccionUsu, direccionAlum, urlFid, consulta,urlRec);
    public static login acceso = new login();
    hilo hilo = new hilo();
    public static boolean visivilidad = true, maximizado = false ,inicioa=false,iniciob=false,seleccionado=false,conectado=false;
 private PanamaHitek_Arduino Arduino = new PanamaHitek_Arduino();
    private final SerialPortEventListener Escucha = new SerialPortEventListener() {
        @Override
        public void serialEvent(SerialPortEvent spe) {

            try {
                if (Arduino.isMessageAvailable()) {
                    String respuesta = Arduino.printMessage();
                   respuesta=respuesta.replace("#", "");
                    accion(respuesta);
                }

            } catch (SerialPortException ex) {
                Logger.getLogger(pantalla.class.getName()).log(Level.SEVERE, null, ex);
            } catch (ArduinoException ex) {
                Logger.getLogger(pantalla.class.getName()).log(Level.SEVERE, null, ex);
            }

        }
    };
     public void accion(String respuesta) {
        System.out.println("Respuesta:" + respuesta);
         if (iniciob==true) {
             mAlumno alumno= conexion.buscarAlumno(respuesta);
             buscarAlumno.llenar(alumno);
         }
         if (seleccionado==true) {
             mAlumno alumno= conexion.buscarAlumno(respuesta);
             AsignarTarjeta.evaluar(alumno,respuesta);
         }
    }
    /**
     * Creates new form pantalla
     */
    public pantalla() {
        initComponents();
        login();
        hilo.start();
    }

    public void login() {
        menubar.setVisible(false);
        this.setLocationRelativeTo(null);
        escritorio.add(acceso);
        Dimension desktopSize = escritorio.getSize();
        Dimension FrameSize = acceso.getSize();
        acceso.setLocation((desktopSize.width - FrameSize.width) / 2, (desktopSize.height - FrameSize.height) / 2);
        acceso.setVisible(visivilidad);
        panelCon.setVisible(false);
    }

    public void salir() {
        int eleccion = JOptionPane.showConfirmDialog(null, "¿Desea Confirmar el Salir de la aplicacion?");
        if (eleccion == 0) {
            hilo.setDispose(false);
            
            try {
                Arduino.killArduinoConnection();
            } catch (ArduinoException ex) {
                ///Logger.getLogger(pantalla.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            this.dispose();
        }
    }

    public void tamaño() {
        if (maximizado == false) {
            this.setExtendedState(MAXIMIZED_BOTH);//maximizado
            maximizado = !maximizado;
            //btnmaximiced.setText("Achicar");
        } else {
            this.setExtendedState(NORMAL);//maximizado
            maximizado = !maximizado;
            // btnmaximiced.setText("Maximizar");
        }
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jDesktopPane1 = new javax.swing.JDesktopPane();
        escritorio = new jcMousePanel.jcMousePanel();
        txthora = new javax.swing.JLabel();
        btnsallir = new javax.swing.JButton();
        btninicio = new javax.swing.JButton();
        panelCon = new javax.swing.JPanel();
        jLabel1 = new javax.swing.JLabel();
        jComboBox1 = new javax.swing.JComboBox<>();
        jButton1 = new javax.swing.JButton();
        menubar = new javax.swing.JMenuBar();
        jMenu1 = new javax.swing.JMenu();
        jMenuItem2 = new javax.swing.JMenuItem();
        jMenuItem1 = new javax.swing.JMenuItem();
        itemUsuario = new javax.swing.JMenu();
        jMenuItem3 = new javax.swing.JMenuItem();
        jMenuItem4 = new javax.swing.JMenuItem();

        setDefaultCloseOperation(javax.swing.WindowConstants.DO_NOTHING_ON_CLOSE);
        setTitle("Sistema Comedo UNU");

        jDesktopPane1.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0)));

        escritorio.setToolTipText("");
        escritorio.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/fondo.jpg"))); // NOI18N

        txthora.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        txthora.setText("hora/fecha");

        btnsallir.setBackground(new java.awt.Color(255, 102, 102));
        btnsallir.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        btnsallir.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/cerrar.png"))); // NOI18N
        btnsallir.setText("SALIR");
        btnsallir.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnsallirActionPerformed(evt);
            }
        });

        btninicio.setBackground(new java.awt.Color(102, 102, 255));
        btninicio.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        btninicio.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/usuario.png"))); // NOI18N
        btninicio.setText("Iniciar Session");
        btninicio.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btninicioActionPerformed(evt);
            }
        });

        jLabel1.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        jLabel1.setText("Dispositivo:");

        jComboBox1.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        jComboBox1.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "COM1", "COM2", "COM3", "COM4", "COM5", "COM6", "COM7", "COM8", "COM9", "COM10", "COM11", "COM12", "COM13", "COM14", "COM15" }));

        jButton1.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        jButton1.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/conectar.png"))); // NOI18N
        jButton1.setText("CONECTAR");
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout panelConLayout = new javax.swing.GroupLayout(panelCon);
        panelCon.setLayout(panelConLayout);
        panelConLayout.setHorizontalGroup(
            panelConLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(panelConLayout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel1)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jComboBox1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addComponent(jButton1)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        panelConLayout.setVerticalGroup(
            panelConLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(panelConLayout.createSequentialGroup()
                .addContainerGap()
                .addGroup(panelConLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel1)
                    .addComponent(jComboBox1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jButton1))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        javax.swing.GroupLayout escritorioLayout = new javax.swing.GroupLayout(escritorio);
        escritorio.setLayout(escritorioLayout);
        escritorioLayout.setHorizontalGroup(
            escritorioLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, escritorioLayout.createSequentialGroup()
                .addContainerGap(527, Short.MAX_VALUE)
                .addGroup(escritorioLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addComponent(txthora, javax.swing.GroupLayout.PREFERRED_SIZE, 495, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addGroup(escritorioLayout.createSequentialGroup()
                        .addComponent(panelCon, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addGroup(escritorioLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                            .addComponent(btninicio, javax.swing.GroupLayout.PREFERRED_SIZE, 160, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(btnsallir, javax.swing.GroupLayout.PREFERRED_SIZE, 102, javax.swing.GroupLayout.PREFERRED_SIZE))))
                .addGap(30, 30, 30))
        );
        escritorioLayout.setVerticalGroup(
            escritorioLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(escritorioLayout.createSequentialGroup()
                .addContainerGap()
                .addGroup(escritorioLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(escritorioLayout.createSequentialGroup()
                        .addComponent(btnsallir)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(btninicio))
                    .addComponent(panelCon, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 565, Short.MAX_VALUE)
                .addComponent(txthora)
                .addContainerGap())
        );

        jDesktopPane1.setLayer(escritorio, javax.swing.JLayeredPane.DEFAULT_LAYER);

        javax.swing.GroupLayout jDesktopPane1Layout = new javax.swing.GroupLayout(jDesktopPane1);
        jDesktopPane1.setLayout(jDesktopPane1Layout);
        jDesktopPane1Layout.setHorizontalGroup(
            jDesktopPane1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(escritorio, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        jDesktopPane1Layout.setVerticalGroup(
            jDesktopPane1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(escritorio, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );

        menubar.setBackground(new java.awt.Color(153, 153, 255));
        menubar.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0)));
        menubar.setForeground(new java.awt.Color(102, 102, 255));
        menubar.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));

        jMenu1.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0)));
        jMenu1.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/icoalum.jpg"))); // NOI18N
        jMenu1.setText("Alumnos");

        jMenuItem2.setAccelerator(javax.swing.KeyStroke.getKeyStroke(java.awt.event.KeyEvent.VK_A, java.awt.event.InputEvent.CTRL_DOWN_MASK));
        jMenuItem2.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/rdif.jpg"))); // NOI18N
        jMenuItem2.setText("Asignar o Recargar Tarjeta");
        jMenuItem2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItem2ActionPerformed(evt);
            }
        });
        jMenu1.add(jMenuItem2);

        jMenuItem1.setAccelerator(javax.swing.KeyStroke.getKeyStroke(java.awt.event.KeyEvent.VK_B, java.awt.event.InputEvent.CTRL_DOWN_MASK));
        jMenuItem1.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/alumnos.png"))); // NOI18N
        jMenuItem1.setText("Identificar Alumno");
        jMenuItem1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItem1ActionPerformed(evt);
            }
        });
        jMenu1.add(jMenuItem1);

        menubar.add(jMenu1);

        itemUsuario.setBorder(new javax.swing.border.MatteBorder(null));
        itemUsuario.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/sess.png"))); // NOI18N
        itemUsuario.setText("Sesion");
        itemUsuario.setAlignmentX(-0.5F);

        jMenuItem3.setAccelerator(javax.swing.KeyStroke.getKeyStroke(java.awt.event.KeyEvent.VK_T, java.awt.event.InputEvent.CTRL_DOWN_MASK));
        jMenuItem3.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/salir.jpg"))); // NOI18N
        jMenuItem3.setText("Cerrar Sesion");
        jMenuItem3.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItem3ActionPerformed(evt);
            }
        });
        itemUsuario.add(jMenuItem3);

        jMenuItem4.setAccelerator(javax.swing.KeyStroke.getKeyStroke(java.awt.event.KeyEvent.VK_S, java.awt.event.InputEvent.CTRL_DOWN_MASK));
        jMenuItem4.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/cerrar.png"))); // NOI18N
        jMenuItem4.setText("Salir");
        jMenuItem4.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItem4ActionPerformed(evt);
            }
        });
        itemUsuario.add(jMenuItem4);

        menubar.add(itemUsuario);

        setJMenuBar(menubar);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jDesktopPane1)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jDesktopPane1)
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void jMenuItem3ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItem3ActionPerformed
        int eleccion = JOptionPane.showConfirmDialog(null, "¿Desea Confirmar el cierre de Session?");
        if (eleccion == 0) {
            login();
        }
    }//GEN-LAST:event_jMenuItem3ActionPerformed

    private void btninicioActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btninicioActionPerformed
        login();
    }//GEN-LAST:event_btninicioActionPerformed

    private void jMenuItem4ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItem4ActionPerformed
        salir();
    }//GEN-LAST:event_jMenuItem4ActionPerformed

    private void jMenuItem1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItem1ActionPerformed
      if(iniciob==true){
         buscar.dispose();
     }
        buscar = new buscarAlumno();
        escritorio.add(buscar);
        Dimension desktopSize = escritorio.getSize();
        Dimension FrameSize = buscar.getSize();
        buscar.setLocation((desktopSize.width - FrameSize.width) / 2, (desktopSize.height - FrameSize.height) / 2);
        buscar.setVisible(true);
        iniciob=true;
    }//GEN-LAST:event_jMenuItem1ActionPerformed

    private void jMenuItem2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItem2ActionPerformed
     if(inicioa==true){
        asignar.dispose();
     }
        asignar = new AsignarTarjeta();
        escritorio.add(asignar);
        Dimension desktopSize = escritorio.getSize();
        Dimension FrameSize = asignar.getSize();
        asignar.setLocation((desktopSize.width - FrameSize.width) / 2, (desktopSize.height - FrameSize.height) / 2);
        asignar.setVisible(true);
        inicioa=true;
    }//GEN-LAST:event_jMenuItem2ActionPerformed

    private void btnsallirActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnsallirActionPerformed
        salir();
    }//GEN-LAST:event_btnsallirActionPerformed
 public void conectarArduino() throws ArduinoException {
        String puerto = (String) jComboBox1.getSelectedItem();
        System.out.println(""+puerto);
        int velocidad = 9600;
        Arduino = new PanamaHitek_Arduino();
        Arduino.arduinoRXTX(puerto, velocidad, Escucha);
        conectado=true;

    }
    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
        try {
            conectarArduino();
            JOptionPane.showMessageDialog(panelCon,"Conexion Realizada Correctamente");
        } catch (ArduinoException ex) {
            JOptionPane.showMessageDialog(panelCon, ex.getMessage());
            conectado=false;
        }
    }//GEN-LAST:event_jButton1ActionPerformed

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(pantalla.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(pantalla.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(pantalla.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(pantalla.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new pantalla().setVisible(true);
            }
        });
    }


    // Variables declaration - do not modify//GEN-BEGIN:variables
    public static javax.swing.JButton btninicio;
    public static javax.swing.JButton btnsallir;
    public static jcMousePanel.jcMousePanel escritorio;
    public static javax.swing.JMenu itemUsuario;
    public static javax.swing.JButton jButton1;
    public static javax.swing.JComboBox<String> jComboBox1;
    public static javax.swing.JDesktopPane jDesktopPane1;
    public static javax.swing.JLabel jLabel1;
    public static javax.swing.JMenu jMenu1;
    public static javax.swing.JMenuItem jMenuItem1;
    public static javax.swing.JMenuItem jMenuItem2;
    public static javax.swing.JMenuItem jMenuItem3;
    public static javax.swing.JMenuItem jMenuItem4;
    public static javax.swing.JMenuBar menubar;
    public static javax.swing.JPanel panelCon;
    public static javax.swing.JLabel txthora;
    // End of variables declaration//GEN-END:variables
}
