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

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Provide methods to write (insert/update) to the database
 * 
 * @author Daniel Fischer, David Gawehn
 */
public class DB_InsertUpdate {

    /**
     * Create a new record in a table
     *
     * @param Table     Target table to be written
     * @param Values    ArrayList of data, length of the list must be the same number of table columns
     * @return          1, when written, -1 if not written
     */
    public static int insertAt (String Table, ArrayList Values) {

        try {
            String values = "";
            for (int i = 0; i < Values.size() - 1; i++) {
                values = values.concat("'" + String.valueOf(Values.get(i)) + "',");
            }
            values = values.concat("'" + String.valueOf(Values.get(Values.size() - 1)) + "'");
            Statement statement = DB_Backend.getConnection().createStatement();
            int insertAt = statement.executeUpdate("INSERT INTO " + Table + " VALUES (" + values + ")");
            return insertAt;

        } catch (SQLException ex) {
            Logger.getLogger(DB_InsertUpdate.class.getName()).log(Level.SEVERE, null, ex);
            return -1;
        }
    }


    /**
     * Update the record in a table where the column "where" and the value of "what" are given
     *
     * @param Table     target table
     * @param Values    the values in the form: "Column Name", value, "Column Name", value...
     * @param where     column for the where clause
     * @param what      value for the condition
     * @return          1, when successful; -1, when not
     */
    public static int update (String Table, ArrayList Values, String where, int what) {
        try {
            String values = "";
            for (int i = 0; i < Values.size() - 2; i += 2) {
                values = values.concat(String.valueOf(Values.get(i)) + "='" + String.valueOf(Values.get(i + 1)) + "', ");
            }
            values = values.concat(String.valueOf(Values.get(Values.size() - 2)) + "='" + String.valueOf(Values.get(Values.size() - 1)) + "'");
            PreparedStatement statement = DB_Backend.getConnection().prepareStatement("UPDATE " + Table + " SET " + values + " WHERE " + where + "= ? LIMIT 1");
            statement.setInt(1,what);
            int update = statement.executeUpdate();
            return update;
        } catch (SQLException ex) {
            Logger.getLogger(DB_InsertUpdate.class.getName()).log(Level.SEVERE, null, ex);
            return -1;
        }
    }

    public static int update (String Table, ArrayList Values, String where, String what) {
        try {
            String values = "";
            for (int i = 0; i < Values.size() - 2; i += 2) {
                values = values.concat(String.valueOf(Values.get(i)) + "='" + String.valueOf(Values.get(i + 1)) + "', ");
            }
            values = values.concat(String.valueOf(Values.get(Values.size() - 2)) + "='" + String.valueOf(Values.get(Values.size() - 1)) + "'");
            PreparedStatement statement = DB_Backend.getConnection().prepareStatement("UPDATE " + Table + " SET " + values + " WHERE " + where + "= ? LIMIT 1");
            statement.setString(1,what);
            int update = statement.executeUpdate();
            return update;
        } catch (SQLException ex) {
            Logger.getLogger(DB_InsertUpdate.class.getName()).log(Level.SEVERE, null, ex);
            return -1;
        }
    }
}