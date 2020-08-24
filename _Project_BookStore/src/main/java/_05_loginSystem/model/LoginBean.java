package _05_loginSystem.model;

public class LoginBean {
	String phone; 
	String password;
	String invalidCredentials;
	boolean rememberMe;
	
	public LoginBean() {
	}
	
	public LoginBean(String phone, String password, boolean rememberMe) {
		this.phone = phone;
		this.password = password;
		this.rememberMe = rememberMe;
	}
	
	public String getPhone() {
		return phone;
	}
	
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}

	public boolean isRememberMe() {
		return rememberMe;
	}

	public void setRememberMe(boolean rememberMe) {
		this.rememberMe = rememberMe;
	}

	public String getInvalidCredentials() {
		return invalidCredentials;
	}

	public void setInvalidCredentials(String invalidCredentials) {
		this.invalidCredentials = invalidCredentials;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("LoginBean [phone");
		builder.append(phone);
		builder.append(", password=");
		builder.append(password);
		builder.append(", rememberMe=");
		builder.append(rememberMe);
		builder.append("]");
		return builder.toString();
	}
	
	
}
