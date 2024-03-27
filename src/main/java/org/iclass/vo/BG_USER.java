package org.iclass.vo;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Timestamp;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode
@JsonIgnoreProperties(ignoreUnknown = true)
public class BG_USER {

	private String user_id;
	private String user_password;
	private String user_name;
	private Date create_dttm; 
	
	public void setJoinDate(Date now) {
		this.create_dttm = create_dttm;
		
	}
	
	   public void encryptPassword() throws NoSuchAlgorithmException {
	        this.user_password = encrypt(this.user_password);
	    }

	    public String encrypt(String text) throws NoSuchAlgorithmException {
	        MessageDigest md = MessageDigest.getInstance("SHA-256");
	        md.update(text.getBytes());
	        return bytesToHex(md.digest());
	    }
	    private String bytesToHex(byte[] bytes) {
	        StringBuilder builder = new StringBuilder();
	        for (byte b : bytes) {
	            builder.append(String.format("%02x", b));
	        }
	        return builder.toString();
	    }

}

