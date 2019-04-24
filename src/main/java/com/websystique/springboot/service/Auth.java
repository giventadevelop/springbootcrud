/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.websystique.springboot.service;

import javax.mail.*;
/**
 * @author:Sourav nandan, Dipankar Bej
 * @version 1.1v
 * @Company:WWW.CLOUDLABZ.COM
 * @Description: For Storing & Returning Mail Credentials for sending mails
 * @Date:06/07/2010
 * @Project: Adwiise
 *
 */

class Auth extends Authenticator {
  //private static final String SMTP_HOST_NAME = "smtp.gmail.com";
  private static final String SMTP_AUTH_USER = "info@adwiise.com";
  private static final String SMTP_AUTH_PWD  = "adwiiseinfo";
    
    @Override
    public PasswordAuthentication getPasswordAuthentication()
    { 
        String username = SMTP_AUTH_USER;
        String password = SMTP_AUTH_PWD;
        return new PasswordAuthentication(username, password);
    }

}
