/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.sistemas.modelo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;

import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author cliente
 */
public class ConexionJava {

    Connection conexion=null;
    Statement est=null;
    
public ConexionJava() {
   try {
      Class.forName("com.mysql.jdbc.Driver");
      conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/pasarelabd","root","1234");
      est= conexion.createStatement();
   }catch (ClassNotFoundException ex) {
            Logger.getLogger(ConexionJava.class.getName()).log(Level.SEVERE, null, ex);
   } catch (SQLException ex) {
            Logger.getLogger(ConexionJava.class.getName()).log(Level.SEVERE, null, ex);
   }
}

public boolean ejecutarSQL(String textsql)
{
   try {
      est.executeUpdate(textsql);
   } catch (SQLException ex) {
      ex.printStackTrace();
   return false;
   }
 
   return true;
}
 

public ResultSet ejecutarSQLSelect(String textsql)
{
   ResultSet resultado;
   try {
      resultado = est.executeQuery(textsql);
   } catch (SQLException ex) {
      ex.printStackTrace();
      return null;
   }
   return resultado;
}
}