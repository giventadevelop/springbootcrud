package com.websystique.springboot.model;

import java.io.Serializable;
import java.math.BigInteger;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;

@Entity
@Table(name="user_files")
//@NamedQuery(name="UserFile.findAll", query="SELECT u FROM UserFile u")
public class UserFile implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private long id;

	@Column(name="user_id")
	private int userId;

	@Lob
	@Column(name="user_picture")
	private byte[] userPicture;

	@Column(name="user_picture_content_type")
	private String userPictureContentType;

	public UserFile() {
	}

	public long getId() {
		return this.id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public int getUserId() {
		return this.userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public byte[] getUserPicture() {
		return this.userPicture;
	}

	public void setUserPicture(byte[] userPicture) {
		this.userPicture = userPicture;
	}

	public String getUserPictureContentType() {
		return this.userPictureContentType;
	}

	public void setUserPictureContentType(String userPictureContentType) {
		this.userPictureContentType = userPictureContentType;
	}

}