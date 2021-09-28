/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package premium;

import clases.metodos;
import com.placeholder.PlaceHolder;
import static premium.pantalla.panelCon;
import controladores.mtrabajador;
import static java.awt.Frame.MAXIMIZED_BOTH;
import java.util.Vector;
import javax.swing.JOptionPane;

/**
 *
 * @author Sammy Guergachi <sguergachi at gmail.com>
 */
public class login extends javax.swing.JInternalFrame {

    Vector Usuarios;
    PlaceHolder txtfondos;
    metodos metodos = new metodos();

    public login() {
        initComponents();
        inicio();
    }

    public void inicio() {
        txtfondos = new PlaceHolder(txtacc, "Ingrese Usuario");
        txtfondos = new PlaceHolder(txtpass, "Ingrese Contraseña");
        txtfondos.setCursiva(true);
        obtener();
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jcMousePanel1 = new jcMousePanel.jcMousePanel();
        jLabel1 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        btnsalir = new javax.swing.JButton();
        btnacc = new javax.swing.JButton();
        txtacc = new javax.swing.JTextField();
        txtpass = new javax.swing.JPasswordField();
        jLabel4 = new javax.swing.JLabel();
        jButton3 = new javax.swing.JButton();

        setTitle("Acceso al Sistema");

        jcMousePanel1.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/fondologin.jpg"))); // NOI18N

        jLabel1.setFont(new java.awt.Font("Tahoma", 1, 18)); // NOI18N
        jLabel1.setText("INGRESO AL SISTEMA");

        jLabel2.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        jLabel2.setText("Usuario:");

        jLabel3.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        jLabel3.setText("Clave:");

        btnsalir.setBackground(new java.awt.Color(255, 102, 102));
        btnsalir.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        btnsalir.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/cerrar.png"))); // NOI18N
        btnsalir.setText("CANCELAR");
        btnsalir.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnsalirActionPerformed(evt);
            }
        });

        btnacc.setBackground(new java.awt.Color(102, 102, 255));
        btnacc.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        btnacc.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/acceder.png"))); // NOI18N
        btnacc.setText("ACCEDER");
        btnacc.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnaccActionPerformed(evt);
            }
        });

        txtacc.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        txtacc.setText("00086749");

        txtpass.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        txtpass.setText("12341234");

        jLabel4.setFont(new java.awt.Font("Tahoma", 1, 18)); // NOI18N
        jLabel4.setText("PREMIUM COLLEGE");

        jButton3.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        jButton3.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/web.jpg"))); // NOI18N
        jButton3.setText("Ir al sistema web");
        jButton3.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton3ActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jcMousePanel1Layout = new javax.swing.GroupLayout(jcMousePanel1);
        jcMousePanel1.setLayout(jcMousePanel1Layout);
        jcMousePanel1Layout.setHorizontalGroup(
            jcMousePanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jcMousePanel1Layout.createSequentialGroup()
                .addGroup(jcMousePanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jcMousePanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                        .addGroup(jcMousePanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(jcMousePanel1Layout.createSequentialGroup()
                                .addGap(60, 60, 60)
                                .addComponent(jLabel1)
                                .addGap(50, 50, 50))
                            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jcMousePanel1Layout.createSequentialGroup()
                                .addGroup(jcMousePanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                                    .addGroup(jcMousePanel1Layout.createSequentialGroup()
                                        .addComponent(jLabel3)
                                        .addGap(21, 21, 21))
                                    .addGroup(jcMousePanel1Layout.createSequentialGroup()
                                        .addComponent(jLabel2)
                                        .addGap(18, 18, 18)))
                                .addGroup(jcMousePanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING, false)
                                    .addComponent(txtacc, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, 142, Short.MAX_VALUE)
                                    .addComponent(txtpass, javax.swing.GroupLayout.Alignment.LEADING))
                                .addGap(48, 48, 48)))
                        .addGroup(jcMousePanel1Layout.createSequentialGroup()
                            .addContainerGap()
                            .addGroup(jcMousePanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                                .addComponent(jButton3, javax.swing.GroupLayout.PREFERRED_SIZE, 295, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGroup(jcMousePanel1Layout.createSequentialGroup()
                                    .addComponent(btnsalir)
                                    .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                    .addComponent(btnacc, javax.swing.GroupLayout.PREFERRED_SIZE, 152, javax.swing.GroupLayout.PREFERRED_SIZE)))))
                    .addGroup(jcMousePanel1Layout.createSequentialGroup()
                        .addGap(69, 69, 69)
                        .addComponent(jLabel4, javax.swing.GroupLayout.PREFERRED_SIZE, 191, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        jcMousePanel1Layout.setVerticalGroup(
            jcMousePanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jcMousePanel1Layout.createSequentialGroup()
                .addGap(26, 26, 26)
                .addComponent(jLabel1)
                .addGap(18, 18, 18)
                .addComponent(jLabel4)
                .addGap(18, 18, 18)
                .addGroup(jcMousePanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(txtacc, javax.swing.GroupLayout.PREFERRED_SIZE, 28, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel2))
                .addGap(22, 22, 22)
                .addGroup(jcMousePanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(txtpass, javax.swing.GroupLayout.PREFERRED_SIZE, 28, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel3))
                .addGap(18, 30, Short.MAX_VALUE)
                .addGroup(jcMousePanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btnsalir)
                    .addComponent(btnacc))
                .addGap(33, 33, 33)
                .addComponent(jButton3)
                .addGap(32, 32, 32))
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jcMousePanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jcMousePanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void jButton3ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton3ActionPerformed
        metodos.abriweb();
    }//GEN-LAST:event_jButton3ActionPerformed

    private void btnaccActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnaccActionPerformed
        String usuario = txtacc.getText();
        String pass = txtpass.getText();
        validar(usuario, pass);
    }//GEN-LAST:event_btnaccActionPerformed

    private void btnsalirActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnsalirActionPerformed
        pantalla.btninicio.setVisible(true);
        pantalla.btnsallir.setVisible(true);
        this.dispose();
    }//GEN-LAST:event_btnsalirActionPerformed
    public void obtener() {
        Usuarios = pantalla.conexion.datosTrabajadores();

    }

    public void acceder() {
        pantalla.menubar.setVisible(true);
        pantalla.btninicio.setVisible(false);
       // pantalla.btnsallir.setVisible(false);
        this.dispose();
    }

    private void validar(String log, String pass) {
        boolean acc=false;
        for (int i = 0; i < Usuarios.size(); i++) {
            mtrabajador usuario = (mtrabajador) Usuarios.get(i);
         
            if (log.equals(usuario.getLogin()) && pass.equals(usuario.getPass())) {
                 JOptionPane.showMessageDialog(rootPane, "Datos de Usuario Correcto: BIENVENIDO AL SISTEMA");
                acceder();  
                pantalla.Usuario=usuario;
                pantalla.itemUsuario.setText("Usuario:"+usuario.getDatos());
                acc=true;
                 panelCon.setVisible(true);
            }
        }
        if (acc==false) {
            JOptionPane.showMessageDialog(rootPane, "Datos de inicio de Sesion Incorrectos");
        }

    }
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnacc;
    private javax.swing.JButton btnsalir;
    private javax.swing.JButton jButton3;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private jcMousePanel.jcMousePanel jcMousePanel1;
    private javax.swing.JTextField txtacc;
    private javax.swing.JPasswordField txtpass;
    // End of variables declaration//GEN-END:variables

}
