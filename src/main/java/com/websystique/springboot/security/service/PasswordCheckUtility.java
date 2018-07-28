package com.websystique.springboot.security.service;

import org.jasypt.util.password.StrongPasswordEncryptor;



//public class CustomAuthenticationProvider   extends DaoAuthenticationProvider  implements AuthenticationProvider  {
public class PasswordCheckUtility {

	/*@Autowired
	private static EncryptionService encryptionService;
*/
	public static void authenticate() {
		/*
		 * if(!user.getPassword().equalsIgnoreCase(encryptionService.
		 * encryptString(token.getCredentials().toString()))){ throw new
		 * BadCredentialsException("The Password entered is not correct."); }
		 */
		 
		StrongPasswordEncryptor strongEncryptor=new StrongPasswordEncryptor();
		EncryptionServiceImpl encryptionService=new EncryptionServiceImpl();
		encryptionService.setStrongEncryptor(strongEncryptor);

		if (!encryptionService.checkPassword("user", "mtJ0axp4ukMy2evdYXZcGJ6wyAJV9Pzz4a9whct2/9/f8VOTTOC2pTn3RuuLXG/j")) {
			System.out.println("Pass not equal");
		}else{
			System.out.println("Pass are equal");
		}

	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		authenticate();
	}

}
