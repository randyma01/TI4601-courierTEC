/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package logic;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;


/**
 *
 * @author Hazel
 */
public class connection {
    Connection connectionCT;
    public Connection getCnn(String user, String password,String Database){
        String Server = "localhost";
        //String Database = "CourierITCRcDB";
        String url = "jdbc:sqlserver://"+Server+":1433"
                + ";database="+Database+";user="+user+";password="+password+";SSL:false"
                + "encrypt=true;trustServerCertificate=false;loginTimeout=30;";
        url = String.format(url);
        System.out.println(url);
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connectionCT = DriverManager.getConnection(url);
            String msg = "Conecto";
            System.out.println(msg);
            JOptionPane.showMessageDialog(null,msg);
        }
        catch (Exception e) {
            System.out.println(e);
        }
        return connectionCT ;
    }
    public Connection Cnn(String Database){
        String Server = "localhost";
        //String Database = "couriertecDB";
        String url = "jdbc:sqlserver://"+Server+":1433"
                + ";database="+Database+";user=randyma;password=Alex2004;SSL:false"
                + "encrypt=true;trustServerCertificate=false;loginTimeout=30;";
        url = String.format(url);
       // System.out.println(url);
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connectionCT = DriverManager.getConnection(url);
            String msg = "Conecto";
            System.out.println(msg);
          //  JOptionPane.showMessageDialog(null,msg);
        }
        catch (Exception e) {
            System.out.println(e);
        }
        return connectionCT ;
    }
    public Connection getConn(){
        return connectionCT;
    }
    public String sendQuery(String query,String Database,int num){
        Connection cnn = Cnn(Database);
        Statement stmt;
        String result = "";
        System.out.println(query);
        try {
            stmt = cnn.createStatement();
            stmt.executeQuery(query);
            ResultSet resultSet = stmt.executeQuery(query);
             while (resultSet.next()){
                if (num ==3 ){
                  result = result + " \n " + resultSet.getString(1) + " "+ resultSet.getString(2)
                  + resultSet.getString(3);
                }
                else if (num == 2){
                  result = result + " \n " + resultSet.getString(1) + " "+ resultSet.getString(2);
                }
                else{
                    result = result + " \n " + resultSet.getString(1) ;
                }

             }
            System.out.println(result);
        } catch (SQLException e) {
            System.out.println("Error");
            System.out.println(e.getMessage());
        }
        return result;
    }
    public  void verPaquetes(JTable tab, String query,String database){
        //DefaultTableModel tabla = new DefaultTableModel();
        //tab.setModel(tabla);
        try{
            DefaultTableModel tablam = new DefaultTableModel();
            System.out.println(query);
            clearTable(tablam);
            Connection  cnn = Cnn(database);
            Statement statement = cnn.createStatement();
            ResultSet rs = statement.executeQuery(query);
            tablam.addColumn("ID Paquete");
            tablam.addColumn("Tipo");
            tablam.addColumn("Descripción");
            tablam.addColumn("Peso");
            tablam.addColumn("Precio");
            tablam.addColumn("Estado");
            tablam.addColumn("Sucursal");

         while (rs.next()) {
            String data[]  = {rs.getString(1), rs.getString(2), rs.getString(3)
            ,rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7)};
            tablam.addRow(data);
        }
        tab.setModel(tablam);
        }
         catch (Exception e){
            System.out.println(e);
        }

    }

    public void clearTable(DefaultTableModel tab){
        for (int i = tab.getRowCount()-1 ; i >=0; i--){
            tab.removeRow(i);
        }

    }

    public Boolean logIn(String User,String ID){
        Boolean value = false;
        Connection cnn = Cnn("couriertecDB");
        Statement stmt;
        String query = "Select Cedula, Nombre From " + User ;
        String result = "";
        System.out.println(query);
        try {
            stmt = cnn.createStatement();
            stmt.executeQuery(query);
            ResultSet resultSet = stmt.executeQuery(query);
            String msg = "Bienvenido ";
             while (resultSet.next()){
                System.out.println(resultSet.getString(1));
                if (resultSet.getString(1).equals(ID)){
                   value = true;
                    System.out.println("Esta en la Base de Datos");
                    msg = msg + resultSet.getString(2);
                    JOptionPane.showMessageDialog(null,msg);
                }
             }
        }
              catch (SQLException e) {
            System.out.println("Error");
            System.out.println(e.getMessage());
        }
        return value;
    }
}
