/**
 * Created by REIL2762 on 3/04/2018.
 */

//Sample class for sending once off alerts etc, not for bulk mailing - for multiple can return individual mail, add to a list and send the list - see customSendmailList.cls



public with sharing class CustomSendMail {

    public static void sendmail(String[] toAddresses, String[] ccAddresses, String setDisplayName, String subject, String body ){

        Messaging.Singleemailmessage mail = new Messaging.Singleemailmessage();

        mail.setToAddresses(toAddresses);
        mail.setCCAddresses(ccAddresses);

        mail.setSenderDisplayName(setDisplayName);
        mail.setSubject(subject);
        mail.setPlainTextBody(body);
        mail.setHtmlBody(body);

        Messaging.sendEmail(new Messaging.Singleemailmessage[] {mail});

    }

}