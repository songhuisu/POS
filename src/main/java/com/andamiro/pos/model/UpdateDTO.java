package com.andamiro.pos.model;

import javax.validation.constraints.*;

public class UpdateDTO {
	private String id;
	private String pw;
	private String checkPw;
	
	@NotBlank(message = "이름을 입력 해주세요.")
	private String name;
	
	@NotBlank(message = "전화번호를 입력 해주세요.")
    @Pattern(regexp = "[0-9]{10,11}", message = "10~11자리의 숫자만 입력가능합니다")
	private String phone;
	
	@NotBlank(message = "메일을 입력 해주세요.")
    @Email(message = "메일의 양식을 지켜주세요.")
	private String email;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getCheckPw() {
		return checkPw;
	}
	public void setCheckPw(String checkPw) {
		this.checkPw = checkPw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
}
