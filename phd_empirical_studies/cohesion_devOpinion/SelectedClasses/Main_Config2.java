/*
 *  This file is part of FGMP-Hotelverwaltung
 *
 *  Copyright © 2011, 2010, 2009  Daniel Fischer, David Gawehn, Martin Meyer, Christian Pusch
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

package FGMP_Hotel_Management.Configuration;

import FGMP_Hotel_Management.Language.ErrorMsg;
import FGMP_Hotel_Management.Language.LanguageFile;
import FGMP_Hotel_Management.Messaging;
import java.beans.XMLDecoder;
import java.beans.XMLEncoder;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;

/**
 * Get and set information in the main config file
 *
 * @author David Gawehn
 */
public class Main_Config2 {
    private String fileName;
    private XMLDecoder d;
    private XMLEncoder o;

    private String hotelAddress;
    private String fax;
    private String telephone;
    private String mail;
    private String web;
	private String VAT;
	private String invoice_Place;
    private String invoice_extD;
	private Vector[] cancellationFee = new Vector[2];
	
	private String DB_Host;
    private String DB_Port;
    private String DB_Name;
    private String DB_User;
    private String DB_Password;

    private String Currency;
    private String Bill_Top;
    private String Bill_Bottom;

    private String languageFileAbsolutePath;
	
	public Main_Config2(String fn) throws Exception{
        this.fileName = fn;
        this.init(fn);
    }

    private void init(String fn) throws Exception{
        this.load_config();
    }
	
	private void load_config() throws FileNotFoundException, ArrayIndexOutOfBoundsException{
        d = new XMLDecoder(new BufferedInputStream(new FileInputStream(this.fileName)));

        this.hotelAddress = (String) d.readObject();
		this.fax = (String) d.readObject();
		this.telephone = (String) d.readObject();
		this.mail = (String) d.readObject();
		this.web = (String) d.readObject();
		this.VAT = (String) d.readObject();
		this.invoice_Place = (String) d.readObject();
		this.invoice_extD = (String) d.readObject();
		this.cancellationFee[0] = (Vector)d.readObject();
		this.cancellationFee[1] = (Vector)d.readObject();
		this.DB_Name = (String) d.readObject();
		this.DB_Host = (String) d.readObject();
		this.DB_User = (String) d.readObject();
		this.DB_Port = (String) d.readObject();
		this.DB_Password = (String) d.readObject();
		this.Currency = (String) d.readObject();
		this.Bill_Top = (String) d.readObject();
		this.Bill_Bottom = (String) d.readObject();
		
		String pa = (String) d.readObject();
		if (pa != null) {
			LanguageFile.applyLanguageFile(new File(pa));
		}
    }

    public void save_config() throws FileNotFoundException{
		this.o = new XMLEncoder(new BufferedOutputStream(new FileOutputStream(this.fileName)));
		o.writeObject(hotelAddress);
		o.writeObject(fax);
		o.writeObject(telephone);
		o.writeObject(mail);
		o.writeObject(web);
		o.writeObject(VAT);
		o.writeObject(invoice_Place);
		o.writeObject(invoice_extD);
		o.writeObject(cancellationFee[0]);
		o.writeObject(cancellationFee[1]);
		o.writeObject(DB_Name);
		o.writeObject(DB_Host);
		o.writeObject(DB_User);
		o.writeObject(DB_Port);
		o.writeObject(DB_Password);
		o.writeObject(Currency);
		o.writeObject(Bill_Top);
		o.writeObject(Bill_Bottom);
		o.writeObject(languageFileAbsolutePath);
		o.flush();
    }

	/*			*
	* 	SETs	*
	*			*/			
    public void setBill_Bottom(String Bill_Bottom) {
        this.Bill_Bottom = Bill_Bottom;
    }

    public void setBill_Top(String Bill_Top) {
        this.Bill_Top = Bill_Top;
    }

    public void setCurrency(String Currency) {
        this.Currency = Currency;
    }

    public void setLanguageFileAbsolutePath(String LanguageFileAbsolutePath) {
        this.languageFileAbsolutePath = LanguageFileAbsolutePath;
    }

    public void setVAT(String vat) {
        this.VAT = vat;
    }

    public void setInvoice_Place(String invoice_Place) {
        this.invoice_Place = invoice_Place;
    }

    public void setInvoice_extD(String invoice_extD) {
        this.invoice_extD = invoice_extD;
    }

    public void setCancellationFee(Vector[] cancellation) {
        this.cancellationFee = cancellation;
    }

    public void setHost(String Host) {
        this.DB_Host = Host;
    }

    public void setPassword(String PSWD) {
        this.DB_Password = PSWD;
    }

    public void setPort(String Port) {
        this.DB_Port = Port;
    }

    public void setUser(String User) {
        this.DB_User = User;
    }

    public void setDatabase(String DBName) {
        this.DB_Name = DBName;
    }

    public void setHotelAddress(String text) {
        this.hotelAddress = text;
    }

    public void setTelephone(String text) {
        this.telephone = text;
    }

    public void setFax(String text) {
        this.fax = text;
    }

    public void setMail(String text) {
        this.mail = text;
    }

    public void setWeb(String text) {
        this.web = text;
    }
	
	/*			*
	* 	GETs	*
	*			*/	
    public String getLanguageFileAbsolutePath() {
        return languageFileAbsolutePath;
    }

    public Vector[] getCancellationFee() {
        return cancellationFee;
    }
	public String getDB_Host() {
        return this.DB_Host;
    }

    public String getDB_Port() {
        return this.DB_Port;
    }

    public String getDB_Name() {
        return this.DB_Name;
    }

    public String getDB_Password() {
        return this.DB_Password;
    }

    public String getDB_User() {
        return this.DB_User;
    }

    public String getHotelAddress() {
        return this.hotelAddress;
    }

    public String getFax() {
        return this.fax;
    }

    public String getTelephone() {
        return this.telephone;
    }

    public String getMail() {
        return this.mail;
    }

    public String getWeb() {
        return this.web;
    }

    public String getVAT() {
        return this.VAT;
    }

    public String getInvoice_Place() {
        return this.invoice_Place;
    }

    public String getInvoice_extD() {
        return this.invoice_extD;
    }

    public Vector[] getCancellation() {
        return this.cancellationFee;
    }

    public String getCurrency() {
        return this.Currency;
    }

    public String getBill_Top() {
        return this.Bill_Top;
    }

    public String getBill_Bottom() {
        return this.Bill_Bottom;
    }
}