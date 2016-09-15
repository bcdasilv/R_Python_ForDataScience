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

import FGMP_Hotel_Management.Language.ErrorMsg;
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.DefaultComboBoxModel;
import javax.swing.DefaultListModel;
import javax.swing.JOptionPane;
import FGMP_Hotel_Management.Messaging;

/**
 * Provide several "helpers" for the DB access
 *
 * @author Daniel Fischer, David Gawehn
 */
public class DB_Helpers {

    /**
     * Provides the nearest free ID of a table
     * MAY STILL BE OPTIMIZED
     *
     * @param Table     DB-Table
     * @param Column    Column IDs
     * @return          -1, if failed, otherwise ID
     */
    public static int getNextID(String Table, String Column) {
        try {
            Statement stmt_id = DB_Backend.getConnection().createStatement();
            ResultSet max_id = stmt_id.executeQuery("SELECT MAX(" + Column + ") FROM " + Table);
            max_id.next();
            return max_id.getInt(1) + 1;
        } catch (SQLException ex) {
            Logger.getLogger(DB_Helpers.class.getName()).log(Level.SEVERE, null, ex);
            return -1;
        }
    }

    /**
     * Delete a record from a table
     *
     * @param Table                 table Name
     * @param where                 column Name
     * @param what                  column entry
     * @return                      -1, if failed, otherwise 1
     */
    public static int delEntry(String Table, String where, int what){
        try{
            PreparedStatement stmt_id = DB_Backend.getConnection().prepareStatement("DELETE FROM " + Table + " WHERE " + where + " = ?");
            stmt_id.setInt(1,what);
            stmt_id.execute();
            return 1;
        } catch (SQLException ex){
            Logger.getLogger(DB_Helpers.class.getName()).log(Level.SEVERE, null, ex);
            Messaging.show_Dialog(ErrorMsg.msg[1], "Error", JOptionPane.ERROR_MESSAGE);
            return -1;
        }
    }


    public static int delEntry(String Table, String where, String what){
        try{
            PreparedStatement stmt_id = DB_Backend.getConnection().prepareStatement("DELETE FROM " + Table + " WHERE " + where + " = ?");
            stmt_id.setString(1,what);
            stmt_id.execute();
            return 1;
        } catch (SQLException ex){
            Logger.getLogger(DB_Helpers.class.getName()).log(Level.SEVERE, null, ex);
            Messaging.show_Dialog(ErrorMsg.msg[1], "Error", JOptionPane.ERROR_MESSAGE);
            return -1;
        }
    }

   
    /**
     * Fill a combo box with entries from the database conditions
     *
     * @param Model                 DefaultComboBoxModel
     * @param List_id               ArrayList of entries to be filled
     * @param Table                 DB-Table
     * @param Column_name    		DB column names
     * @param Column_ID             DB column IDs
     */
    public static void getComboItems(DefaultComboBoxModel Model, ArrayList List_id, String Table, String Column_name, String Column_ID) {
        try {
            if (Model != null) {
                Model.removeAllElements();
            }
            List_id.clear();
            Statement stmt = DB_Backend.getConnection().createStatement();
            ResultSet RS = stmt.executeQuery("SELECT * FROM " + Table + " ORDER BY " + Column_ID);
            while (RS.next()) {
                if (Model != null) {
                    Model.addElement(RS.getString(Column_name));
                }
                List_id.add(RS.getString(Column_ID));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DB_Helpers.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     *  Fill a JList with entries from the database conditions
     *
     * @param ListModel             DefaultListModel
     * @param Liste                 ArrayList of IDs
     * @param Table                 DB-Table
     * @param Column_name		    DB-Column names
     * @param Column_ID             DB-Column IDs
     */
    public static void getListItems(DefaultListModel ListModel, ArrayList Liste, String Table, String Column_name, String Column_ID) {
        try {
            Statement stmt = DB_Backend.getConnection().createStatement();
            Liste.clear();
            ListModel.clear();
            ResultSet rs = stmt.executeQuery("SELECT * FROM " + Table);
            while (rs.next()) {
                ListModel.addElement(rs.getString(Column_name));
                if (Liste != null) {
                    Liste.add(rs.getString(Column_ID));
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(DB_Helpers.class.getName()).log(Level.SEVERE, null, ex);
        }
}

    /**
     * Checks whether a room loaded from the database can be deleted
     */
    public static boolean isRoomDeletable(int ID) {
       try {
            PreparedStatement stmt1 = DB_Backend.getConnection().prepareStatement("SELECT * FROM booking_room WHERE room_id = ?");
            stmt1.setInt(1, ID);
            ResultSet rs1 = stmt1.executeQuery();
            while(rs1.next()) {
                int counter = 0;
                PreparedStatement stmt2 = DB_Backend.getConnection().prepareStatement("SELECT * FROM booking WHERE booking_id= ? && paid = '0'");
                stmt2.setString(1, rs1.getString("booking_id"));
                ResultSet rs2 = stmt2.executeQuery();
                while(rs2.next()) {
                    counter++;
                }
                if (counter > 0) {
                    return false;
                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(DB_Helpers.class.getName()).log(Level.SEVERE, null, ex);
        }
        return true;
    }
    
    /**
     * Returns the number rooms in use at the specified date d
     * 
     * @param d date
     * @return  number of rooms
     */

    public static int getReservedRoomsAtDate(Date d) {
        int res = 0;
        try {
            PreparedStatement stmt1 = DB_Backend.getConnection().prepareStatement("SELECT * FROM booking,booking_room WHERE booking.arrivaldate <= ? AND booking.departuredate >= ? AND booking.cancellation = 0 AND booking.booking_id = booking_room.booking_id");
            stmt1.setDate(1, d);
            stmt1.setDate(2, d);
            ResultSet rs1 = stmt1.executeQuery();
            while(rs1.next()) {
                res++;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DB_Helpers.class.getName()).log(Level.SEVERE, null, ex);
        }
        return res;
    }

    /**
     * Returns the number of rooms in the database
     *
     * @return number of rooms
     */

    public static int getNumberOfRooms() {
        int rooms = 0;
        try {
            PreparedStatement stmt1 = DB_Backend.getConnection().prepareStatement("SELECT * FROM room");
            ResultSet rs1 = stmt1.executeQuery();
            while (rs1.next()) {
                rooms++;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DB_Helpers.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rooms;
    }
}