
package avanzadas;

import javax.swing.JOptionPane;
import logic.connection;

public class Administrador extends javax.swing.JFrame {
    public Avanzadas A = new Avanzadas();
    connection  cnnDB = new connection();
    public Administrador() {
        initComponents();
        this.setTitle("Módulo Administrador / Gerente");
    }

  
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jTabbedPane1 = new javax.swing.JTabbedPane();
        jPanel2 = new javax.swing.JPanel();
        ConsultaCentral = new javax.swing.JButton();
        jScrollPane3 = new javax.swing.JScrollPane();
        QueryAreaH = new javax.swing.JTextArea();
        FechaInicioH = new javax.swing.JTextField();
        FechaFinalH = new javax.swing.JTextField();
        jLabel9 = new javax.swing.JLabel();
        jLabel10 = new javax.swing.JLabel();
        jLabel11 = new javax.swing.JLabel();
        QueryH = new javax.swing.JComboBox<>();
        jPanel1 = new javax.swing.JPanel();
        H1_Consultar1 = new javax.swing.JButton();
        FechaInicioSJ = new javax.swing.JTextField();
        FechaFinalSJ = new javax.swing.JTextField();
        QuerySJ = new javax.swing.JComboBox<>();
        jScrollPane1 = new javax.swing.JScrollPane();
        QueryAreaSJ = new javax.swing.JTextArea();
        jLabel1 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        TipoPaqueteSJ = new javax.swing.JComboBox<>();
        jLabel4 = new javax.swing.JLabel();
        jPanel3 = new javax.swing.JPanel();
        QuerySJ1 = new javax.swing.JComboBox<>();
        jLabel5 = new javax.swing.JLabel();
        jLabel6 = new javax.swing.JLabel();
        jLabel7 = new javax.swing.JLabel();
        FechaInicioSJ2 = new javax.swing.JTextField();
        FechaFinalSJ1 = new javax.swing.JTextField();
        TipoPaqueteSJ1 = new javax.swing.JComboBox<>();
        jLabel8 = new javax.swing.JLabel();
        jScrollPane2 = new javax.swing.JScrollPane();
        QueryAreaSJ1 = new javax.swing.JTextArea();
        H1_Consultar2 = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        jPanel2.setBackground(new java.awt.Color(204, 204, 255));

        ConsultaCentral.setIcon(new javax.swing.ImageIcon(getClass().getResource("/images/Misc-Web-Database-icon.png"))); // NOI18N
        ConsultaCentral.setText("Consultar");
        ConsultaCentral.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                ConsultaCentralActionPerformed(evt);
            }
        });

        QueryAreaH.setColumns(20);
        QueryAreaH.setRows(5);
        jScrollPane3.setViewportView(QueryAreaH);

        FechaInicioH.setText("YYYY/MM/DD");

        FechaFinalH.setText("YYYY/MM/DD");

        jLabel9.setText("Fecha Inicio:");

        jLabel10.setText("Fecha Final:");

        jLabel11.setText("Consultas para la Sede Central");

        QueryH.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Monto recaudado por sucursal para un periodo especifico.", "Monto recaudado por sucursal y por tipo de paquete para un periodo especifico.", "Tres mejores clientes.", " " }));

        javax.swing.GroupLayout jPanel2Layout = new javax.swing.GroupLayout(jPanel2);
        jPanel2.setLayout(jPanel2Layout);
        jPanel2Layout.setHorizontalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel2Layout.createSequentialGroup()
                        .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel9)
                            .addComponent(jLabel10))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addComponent(FechaFinalH, javax.swing.GroupLayout.DEFAULT_SIZE, 132, Short.MAX_VALUE)
                            .addComponent(FechaInicioH)))
                    .addComponent(jLabel11)
                    .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING, false)
                        .addComponent(QueryH, javax.swing.GroupLayout.Alignment.LEADING, 0, 0, Short.MAX_VALUE)
                        .addComponent(ConsultaCentral)
                        .addComponent(jScrollPane3, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, 203, Short.MAX_VALUE)))
                .addContainerGap(242, Short.MAX_VALUE))
        );
        jPanel2Layout.setVerticalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel2Layout.createSequentialGroup()
                .addGap(25, 25, 25)
                .addComponent(jLabel11)
                .addGap(18, 18, 18)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(FechaInicioH, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel9))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel10)
                    .addComponent(FechaFinalH, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(22, 22, 22)
                .addComponent(QueryH, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jScrollPane3, javax.swing.GroupLayout.DEFAULT_SIZE, 126, Short.MAX_VALUE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(ConsultaCentral)
                .addContainerGap())
        );

        jTabbedPane1.addTab("Heredia", jPanel2);

        jPanel1.setBackground(new java.awt.Color(204, 204, 255));

        H1_Consultar1.setIcon(new javax.swing.ImageIcon(getClass().getResource("/images/Misc-Web-Database-icon.png"))); // NOI18N
        H1_Consultar1.setText("Consultar");
        H1_Consultar1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                H1_Consultar1ActionPerformed(evt);
            }
        });

        FechaInicioSJ.setText("YYYY/MM/DD");

        FechaFinalSJ.setText("YYYY/MM/DD");

        QuerySJ.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Cantidad de dinero recaudado ", "Cantidad de paquetes", "Montos promedios de los paquetes", "Monto promedio pagado por paquete por cliente", "Monto de paquete para un tipo de paquete" }));

        QueryAreaSJ.setColumns(20);
        QueryAreaSJ.setRows(5);
        jScrollPane1.setViewportView(QueryAreaSJ);

        jLabel1.setText("Fecha Inicio:");

        jLabel2.setText("Fecha Final:");

        jLabel3.setText("Tipo");

        TipoPaqueteSJ.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Electronicos", "ropa", "juguetes", "hogar", "comida", "quimicos", "herramientas" }));

        jLabel4.setText("Consultas para la Sede de San José");

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(jPanel1Layout.createSequentialGroup()
                                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(jLabel1)
                                    .addComponent(jLabel2)
                                    .addComponent(jLabel3))
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addGroup(jPanel1Layout.createSequentialGroup()
                                        .addComponent(FechaInicioSJ, javax.swing.GroupLayout.PREFERRED_SIZE, 89, javax.swing.GroupLayout.PREFERRED_SIZE)
                                        .addGap(0, 0, Short.MAX_VALUE))
                                    .addGroup(jPanel1Layout.createSequentialGroup()
                                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING, false)
                                            .addComponent(TipoPaqueteSJ, javax.swing.GroupLayout.Alignment.LEADING, 0, 89, Short.MAX_VALUE)
                                            .addComponent(FechaFinalSJ, javax.swing.GroupLayout.Alignment.LEADING))
                                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 74, Short.MAX_VALUE)
                                        .addComponent(QuerySJ, javax.swing.GroupLayout.PREFERRED_SIZE, 179, javax.swing.GroupLayout.PREFERRED_SIZE))))
                            .addGroup(jPanel1Layout.createSequentialGroup()
                                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                                    .addComponent(H1_Consultar1)
                                    .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 212, javax.swing.GroupLayout.PREFERRED_SIZE))
                                .addGap(0, 0, Short.MAX_VALUE)))
                        .addGap(32, 32, 32))
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addComponent(jLabel4)
                        .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel4)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel1)
                    .addComponent(FechaInicioSJ, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(FechaFinalSJ, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel2)
                    .addComponent(QuerySJ, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(7, 7, 7)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel3)
                    .addComponent(TipoPaqueteSJ, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 167, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(H1_Consultar1)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        jTabbedPane1.addTab("San José ", jPanel1);

        jPanel3.setBackground(new java.awt.Color(204, 204, 255));

        QuerySJ1.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Cantidad de dinero recaudado ", "Cantidad de paquetes", "Montos promedios de los paquetes", "Monto promedio pagado por paquete por cliente", "Monto de paquete para un tipo de paquete" }));

        jLabel5.setText("Consultas para la Sede de Cartago");

        jLabel6.setText("Fecha Final:");

        jLabel7.setText("Fecha Inicio:");

        FechaInicioSJ2.setText("YYYY/MM/DD");

        FechaFinalSJ1.setText("YYYY/MM/DD");

        TipoPaqueteSJ1.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Electronicos", "ropa", "juguetes", "hogar", "comida", "quimicos", "herramientas" }));

        jLabel8.setText("Tipo");

        QueryAreaSJ1.setColumns(20);
        QueryAreaSJ1.setRows(5);
        jScrollPane2.setViewportView(QueryAreaSJ1);

        H1_Consultar2.setIcon(new javax.swing.ImageIcon(getClass().getResource("/images/Misc-Web-Database-icon.png"))); // NOI18N
        H1_Consultar2.setText("Consultar");
        H1_Consultar2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                H1_Consultar2ActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel3Layout = new javax.swing.GroupLayout(jPanel3);
        jPanel3.setLayout(jPanel3Layout);
        jPanel3Layout.setHorizontalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel3Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel3Layout.createSequentialGroup()
                        .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                            .addGroup(javax.swing.GroupLayout.Alignment.LEADING, jPanel3Layout.createSequentialGroup()
                                .addComponent(jLabel5)
                                .addGap(0, 0, Short.MAX_VALUE))
                            .addGroup(javax.swing.GroupLayout.Alignment.LEADING, jPanel3Layout.createSequentialGroup()
                                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(jLabel7)
                                    .addComponent(jLabel6)
                                    .addComponent(jLabel8))
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(TipoPaqueteSJ1, 0, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                    .addComponent(FechaFinalSJ1)
                                    .addComponent(FechaInicioSJ2))))
                        .addGap(18, 18, 18)
                        .addComponent(QuerySJ1, javax.swing.GroupLayout.PREFERRED_SIZE, 179, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(jPanel3Layout.createSequentialGroup()
                        .addComponent(jScrollPane2, javax.swing.GroupLayout.PREFERRED_SIZE, 212, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(H1_Consultar2)))
                .addGap(81, 81, 81))
        );
        jPanel3Layout.setVerticalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel3Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel5)
                .addGap(18, 18, 18)
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel7)
                    .addGroup(jPanel3Layout.createSequentialGroup()
                        .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(FechaInicioSJ2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(QuerySJ1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(FechaFinalSJ1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jLabel6))))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addGroup(jPanel3Layout.createSequentialGroup()
                        .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel8)
                            .addComponent(TipoPaqueteSJ1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jScrollPane2, javax.swing.GroupLayout.PREFERRED_SIZE, 167, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addComponent(H1_Consultar2))
                .addContainerGap(52, Short.MAX_VALUE))
        );

        jTabbedPane1.addTab("Cartago", jPanel3);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jTabbedPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 460, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jTabbedPane1)
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void H1_Consultar1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_H1_Consultar1ActionPerformed
        // TODO add your handling code here:
        QueryAreaSJ.setText("");
        String msgQuery = QuerySJ.getSelectedItem().toString();
        String Query = "";
        String Inicio = FechaInicioSJ.getText();
        String Final = FechaFinalSJ.getText();
        String Tipo = TipoPaqueteSJ.getSelectedItem().toString();
        String result;
        
        if (msgQuery.equals("Cantidad de dinero recaudado ")) {
            Query = "SELECT sum(Monto) FROM Paquete_SanJose WHERE EstadoPaquete = 'retirado'";
        }
        else if (msgQuery.equals("Cantidad de paquetes")){
            Query = "SELECT COUNT(Cliente_Paquete_SanJose.IdPaquete) AS 'Cantidad' "
                    + "FROM Cliente_Paquete_SanJose "
                    + "INNER JOIN Cliente_SanJose ON Cliente_SanJose.IdCliente = Cliente_Paquete_SanJose.IdCliente "
                    + "INNER JOIN Paquete_SanJose ON Paquete_SanJose.IdPaquete = Cliente_Paquete_SanJose.IdPaquete "
                    + "WHERE Paquete_SanJose.EstadoPaquete = 'retirado' "
                    + "AND  FechaIngreso  >= '"+ Inicio +"' AND FechaIngreso <= '"+ Final + "' "
                    //+ "AND Cliente_SanJose.Cedula = 89765739"
                    + "GROUP BY Cliente_Paquete_SanJose.IdCliente;";
        }
        else if(msgQuery.equals("Montos promedios de los paquetes")){
            Query = "SELECT AVG(Monto) AS 'PromedioMontoTotal' "
            + "FROM  Paquete_SanJose "
            + "WHERE EstadoPaquete = 'retirado' "
            + "AND FechaIngreso  >= '"+ Inicio +"' AND FechaIngreso <= '"+ Final +"';";
        }
        else if (msgQuery.equals( "Monto promedio pagado por paquete por cliente")){
            Query = "SELECT AVG(Monto) AS 'PromedioMontoTotal' "
            + "FROM  Cliente_Paquete_SanJose "
            + "INNER JOIN Paquete_SanJose ON Paquete_SanJose.IdPaquete = Cliente_Paquete_SanJose.IdPaquete "
            + "INNER JOIN Cliente_SanJose ON Cliente_SanJose.IdCliente = Cliente_Paquete_SanJose.IdCliente "
            + "WHERE EstadoPaquete = 'retirado' "
            + "and FechaIngreso  >= '"+Inicio+"' AND FechaIngreso <= '"+Final+"' "
           // + "AND Cliente_SanJose.Cedula = 89765739 "
            + "GROUP BY Cliente_Paquete_SanJose.IdCliente; ";
        }
        else if(msgQuery.equals("Monto de paquete para un tipo de paquete")){
            if (Tipo != "Tipo"){
                Query = "SELECT SUM(Monto) as 'MontoPorTipo' " +
                "FROM  Paquete_SanJose " +
                "WHERE EstadoPaquete = 'retirado' AND Tipo = '"+Tipo+"' " +
                "AND FechaIngreso  >= '"+Inicio+"' AND FechaIngreso <= '"+Final+"' ";
            }
            else{
                JOptionPane.showMessageDialog(null,"Favor ingresar tipo para la consulta");
            }
        }
        else{
            System.out.println("Paciencia");
        }
        System.out.println(msgQuery);
        System.out.println(Query);
        result = msgQuery + " " +cnnDB.sendQuery(Query,"couriertecSanJoseDB",1);
        QueryAreaSJ.append(result);
       
    }//GEN-LAST:event_H1_Consultar1ActionPerformed

    private void H1_Consultar2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_H1_Consultar2ActionPerformed
        // TODO add your handling code here:
        QueryAreaSJ.setText("");
        String msgQuery = QuerySJ.getSelectedItem().toString();
        String Query = "";
        String Inicio = FechaInicioSJ.getText();
        String Final = FechaFinalSJ.getText();
        String Tipo = TipoPaqueteSJ.getSelectedItem().toString();
        String result;
        
        if (msgQuery.equals("Cantidad de dinero recaudado ")) {
            Query = "SELECT sum(Monto) FROM Paquete WHERE EstadoPaquete = 'retirado'";
        }
        else if (msgQuery.equals("Cantidad de paquetes")){
            Query = "SELECT COUNT(Cliente_Paquete_Cartago.IdPaquete) AS 'Cantidad'"
                    + "FROM Cliente_Paquete_Cartago"
                    + "INNER JOIN Cliente_Cartago ON Cliente_Cartago.IdCliente = Cliente_Paquete_Cartago.IdCliente"
                    + "INNER JOIN Paquete_Cartago ON Paquete_Cartago.IdPaquete = Cliente_Paquete_Cartago.IdPaquete"
                    + "WHERE Paquete_Cartago.EstadoPaquete = 'retirado'"
                    + "AND  FechaIngreso  >= '"+ Inicio +"' AND FechaIngreso <= '"+ Final
                    + "AND Cliente_Cartago.Cedula = 89765739"
                    + "GROUP BY Cliente_Paquete_Cartago.IdCliente;";
        }
        else if(msgQuery.equals("Montos promedios de los paquetes")){
            Query = "SELECT AVG(Monto) AS 'PromedioMontoTotal'"
            + "FROM  Paquete_Cartago"
            + "WHERE EstadoPaquete = 'retirado'"
            + "AND FechaIngreso  >= '"+ Inicio +"' AND FechaIngreso <= '"+ Final +"';";
        }
        else if (msgQuery.equals( "Monto promedio pagado por paquete por cliente")){
            Query = "SELECT AVG(Monto) AS 'PromedioMontoTotal'"
            + "FROM  Cliente_Paquete_Cartago"
            + "INNER JOIN Paquete_Cartago ON Paquete_Cartago.IdPaquete = Cliente_Paquete_Cartago.IdPaquete"
            + "INNER JOIN Cliente_Cartago ON Cliente_Cartago.IdCliente = Cliente_Paquete_Cartago.IdCliente"
            + "WHERE EstadoPaquete = 'retirado'"
            + "and FechaIngreso  >= '"+Inicio+"' AND FechaIngreso <= '"+Final+"' "
            + "AND Cliente_Cartago.Cedula = 89765739"
            + "GROUP BY Cliente_Paquete_Cartago.IdCliente;";
        }
        else if(msgQuery.equals("Monto de paquete para un tipo de paquete")){
            if (Tipo != "Tipo"){
                Query = "SELECT SUM(Monto) as 'MontoPorTipo'" +
                "FROM  Paquete_Cartago " +
                "WHERE EstadoPaquete = 'retirado' AND Tipo = '"+Tipo+"' " +
                "AND FechaIngreso  >= '"+Inicio+"' AND FechaIngreso <= '"+Final+"'";
            }
            else{
                JOptionPane.showMessageDialog(null,"Favor ingresar tipo para la consulta");
            }
        }
        else{
            System.out.println("Paciencia");
        }
        System.out.println(msgQuery);
        
        System.out.println(Query);
        result = msgQuery + " " +cnnDB.sendQuery(Query,"couriertecCartagoDB",1);
        
        
        QueryAreaSJ.append(result);
       
    }//GEN-LAST:event_H1_Consultar2ActionPerformed

    private void ConsultaCentralActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_ConsultaCentralActionPerformed
        // TODO add your handling code here:\
        QueryAreaH.setText("");
        String msgQuery2 = QueryH.getSelectedItem().toString();
        String Query = "";
        String Inicio = FechaInicioH.getText();
        String Final = FechaFinalH.getText();
        String result = "";
            if(msgQuery2.equals("Monto recaudado por sucursal para un periodo especifico.")){
                Query = "SELECT sum(Monto) FROM Paquete INNER JOIN Paquete_Sucursal "
                + "ON Paquete.IdPaquete = Paquete_Sucursal.IdPaquete WHERE EstadoPaquete = 'retirado' \n" 
                + "and FechaIngreso  >= '"+Inicio+"' AND FechaIngreso <= '"+Final+"' group by  IdSucursal  ";
                result = msgQuery2 + " " + cnnDB.sendQuery(Query,"couriertecDB",1);
            }
            else if (msgQuery2.equals("Monto recaudado por sucursal y por tipo de paquete para un periodo especifico.")){
                Query = "SELECT sum(Monto), tipo FROM Paquete  WHERE EstadoPaquete = 'retirado' \n" 
                + "and FechaIngreso  >= '"+Inicio+"' AND FechaIngreso <= '"+Final+"' GROUP BY Tipo ";
                result = msgQuery2 + " " + cnnDB.sendQuery(Query,"couriertecDB",2);
            }
            else if (msgQuery2.equals("Tres mejores clientes.")){
                Query = "SELECT Top 3 Paquete.monto, Cliente_Paquete.IdCliente, Cliente_Paquete.IdPaquete  FROM  Cliente_Paquete \n" +
                "JOIN Paquete on Paquete.IdPaquete = Cliente_Paquete.IdPaquete \n" +
                "JOIN Cliente on Cliente.IdCliente = Cliente_Paquete.IdCliente \n" +
                "WHERE EstadoPaquete = 'retirado' and FechaIngreso  >= '"+Inicio+"' AND FechaIngreso <= '"+Final+"'\n" +
                "GROUP BY Paquete.monto, Cliente_Paquete.IdCliente, Cliente_Paquete.IdPaquete\n" +
                "Having Paquete.monto >  avg(Paquete.monto) ;";
                result = msgQuery2 + " " + cnnDB.sendQuery(Query,"couriertecDB",3);
            }
            else{
                System.out.println("No entro al Combobox");
            }
        
        //System.out.println(msgQuery2);
        System.out.println(Query);
        //result = msgQuery2 + " " +cnnDB.sendQuery(Query,"couriertecDB");      
        
        QueryAreaH.append(result);
    
    }//GEN-LAST:event_ConsultaCentralActionPerformed

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
            java.util.logging.Logger.getLogger(Administrador.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(Administrador.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(Administrador.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(Administrador.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new Administrador().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton ConsultaCentral;
    private javax.swing.JTextField FechaFinalH;
    private javax.swing.JTextField FechaFinalSJ;
    private javax.swing.JTextField FechaFinalSJ1;
    private javax.swing.JTextField FechaInicioH;
    private javax.swing.JTextField FechaInicioSJ;
    private javax.swing.JTextField FechaInicioSJ2;
    private javax.swing.JButton H1_Consultar1;
    private javax.swing.JButton H1_Consultar2;
    private javax.swing.JTextArea QueryAreaH;
    private javax.swing.JTextArea QueryAreaH1;
    private javax.swing.JTextArea QueryAreaH2;
    private javax.swing.JTextArea QueryAreaH3;
    private javax.swing.JTextArea QueryAreaSJ;
    private javax.swing.JTextArea QueryAreaSJ1;
    private javax.swing.JComboBox<String> QueryH;
    private javax.swing.JComboBox<String> QuerySJ;
    private javax.swing.JComboBox<String> QuerySJ1;
    private javax.swing.JComboBox<String> TipoPaqueteSJ;
    private javax.swing.JComboBox<String> TipoPaqueteSJ1;
    private javax.swing.JButton jButton2;
    private javax.swing.JButton jButton3;
    private javax.swing.JButton jButton4;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel10;
    private javax.swing.JLabel jLabel11;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JLabel jLabel9;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JPanel jPanel3;
    private javax.swing.JPanel jPanel4;
    private javax.swing.JPanel jPanel5;
    private javax.swing.JPanel jPanel6;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JScrollPane jScrollPane3;
    private javax.swing.JScrollPane jScrollPane4;
    private javax.swing.JScrollPane jScrollPane5;
    private javax.swing.JScrollPane jScrollPane6;
    private javax.swing.JTabbedPane jTabbedPane1;
    private javax.swing.JTabbedPane jTabbedPane2;
    private javax.swing.JTabbedPane jTabbedPane3;
    private javax.swing.JTabbedPane jTabbedPane4;
    // End of variables declaration//GEN-END:variables
}
