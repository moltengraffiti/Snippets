/**
 * @File Name          : customSendMailList.cls
 * @Description        :
 * @Author             : Sam Reilly
 * @Group              :
 * @Last Modified By   : Sam Reilly
 * @Last Modified On   : 27/02/2020, 11:07:25 am
 * @Modification Log   :
 * Ver       Date            Author      		    Modification
 * 1.0    27/02/2020   Sam Reilly     Initial Version
**/

//Pseudo for a bulk(ish) mailing class

public with sharing class sendSomeThings {

List<Messaging.SingleEmailMessage> singleEmailMessagesList = new List<Messaging.SingleEmailMessage>();

public sendSomeThings(){

if(criteraMatching){
    buildTheEmailBody(criteria); //returns newMsg;
             if(newMsg!=null) {
                singleEmailMessagesList.add(newMsg);
            }
}

        if ( singleEmailMessagesList.Size() > 0) {
            Messaging.sendEmail(singleEmailMessagesList);
        }
}


    public Messaging.singleEmailMessage buildTheEmailBody(criteria){

         // build the body etc and pass to the email creation class - body+='string'; etc
        newMsg=sendList(toAddresses, ccAddresses, displayName, subject, body);
        return newMsg;
    }


    public static Messaging.singleEmailMessage sendList(String[] toAddresses, String[] ccAddresses, String setDisplayName, String subject, String body ){

        Messaging.Singleemailmessage mail = new Messaging.Singleemailmessage();

        mail.setToAddresses(toAddresses);
        mail.setCCAddresses(ccAddresses);

        mail.setSenderDisplayName(setDisplayName);
        mail.setSubject(subject);
        mail.setPlainTextBody(body);
        mail.setHtmlBody(body);

       return mail;

    }

