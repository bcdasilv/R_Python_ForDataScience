/*
 *  This file is part of FGMP-Hotelverwaltung
 *
 *  Copyright © 2010, 2009  Daniel Fischer, David Gawehn, Martin Meyer, Christian Pusch
 *
 *  FGMP-Hotelverwaltung is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 */

package FGMP_Hotel_Management.Datenbank2;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
import FGMP_Hotel_Management.Messaging;

/**
 * Provide methods for the connection to the database
 *
 * @author Daniel Fischer, David Gawehn
 */
public class DB_Backend {
  
    private final static int conns= 5;
    public static Connection [] con_pool = new Connection [conns];

    private static int concount=-1;
    private String Host;
    private String Port;
    private String Database;
    private String User;
    private String Password;

    public DB_Backend(String h, String p, String d, String u, String pw) {
        init(h, p, d, u, pw);
    }

    public void init(String h, String p, String d, String u, String pw) {
        Host = h;
        Port = p;
        Database = d;
        User = u;
        Password = pw;
    }

    /**
     * Provide the central connection to the MySQL database
     *
     * @param host          Database computer host
     * @param database	    DB name
     * @param user          DB-User
     * @param PW            User-Password
     * @return              false, if failed
     */
    public static Boolean connect_DB(String host, String database, String user, String PW) {
        
        Boolean connected = false;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            
                try {
                    for (int i=0; i<5; i++) {
                        con_pool[i] = DriverManager.getConnection("jdbc:mysql://" + host + "/" + database, user, PW);
                    }
                    connected = true;
                    
                } catch (SQLException ex) {
                    Messaging.show_Dialog(ex.toString().substring(ex.toString().indexOf(":")+1), "Error", JOptionPane.ERROR_MESSAGE);
                }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connected;
    }

    /**
     * Provide the central connection to the MySQL database
     */
    public Boolean connect_DB() {

        Boolean connected = false;

        try {
            Class.forName("com.mysql.jdbc.Driver");

                try {
                    for (int i=0; i<conns; i++) {
                        con_pool[i] = DriverManager.getConnection("jdbc:mysql://" + Host.concat(":").concat(Port).concat("/").concat(Database), User, Password);
                    }
                    connected = true;

                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connected;
    }

    /**
     * Closing the database connection
     **/
    public static void close_DB() {
        try {
            for (int i=0; i<conns; i++) {
                if (con_pool[i]!=null)
                    con_pool[i].close();
            }
        } catch (SQLException ex) {
            Logger.getLogger(DB_Backend.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Obtain a connection from the connection pool
     */
    public static Connection getConnection() {

        if (concount<conns-1) {
            concount++;
        } else {
            concount=0;
        }
        return con_pool[concount];
    }
        
}