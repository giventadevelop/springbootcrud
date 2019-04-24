/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.websystique.springboot.service;



import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;

/**
 * @author:Debraj Mallick
 * @version 1.0
 * @Company:WWW.CLOUDLABZ.COM
 * @Date:27th August, 2011
 */
public class EmailWithCc {

    public static String sendEmail(String destinationAddress, String ccAddress, String subject, String msg) throws Exception {

//        String destinationAddress = "mr.abhijit.8@gmail.com, bwnayan@gmail.com";
//        String ccAddress = "sridebrajmallick@gmail.com";
//        String subject = "test mail";
//        String msg = "testing me";

        String status = "success";
        // Create a session
        String host = "smtp.gmail.com";
        Properties props = new Properties();

        props.put("mail.transport.protocol", "smtp");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", "25");
        props.put("mail.smtp.auth", "true");
        // We need TTLS, which gmail requires
        props.put("mail.smtp.starttls.enable", "true");

        // Create a session
        Session session = Session.getDefaultInstance(props, new Auth());
        try {
            // Make a new message
            MimeMessage message = new MimeMessage(session);

            // Who is this message from
            message.setFrom(new InternetAddress("info@adwiise.com", subject));

            // who will get the email (To:)
            message.addRecipients(Message.RecipientType.TO, InternetAddress.parse(destinationAddress, false));
            // who will get the email as (carbon copy)
            message.addRecipients(Message.RecipientType.CC, InternetAddress.parse(ccAddress, false));
            
            message.addRecipients(Message.RecipientType.CC, InternetAddress.parse("info@adwiise.com", false));

            // Subject and bodyok
            message.setSubject(subject);
            // message.setText(msg);
            message.setContent(msg, "text/html; charset=ISO-8859-1");

            Transport.send(message);
            System.out.println("Mail sent!");
        } catch (Exception e) {
            status = "faild";
            throw new Exception("unable to send email");
        }
        return status;
    }
}
