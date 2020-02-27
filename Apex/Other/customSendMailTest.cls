/**
 * Created by REIL2762 on 25/05/2018.
 */

 //TODO - the string addresses here should be queried from custom mdata, not hardcoded
@isTest
public with sharing class customSendMailTest {

@isTest
    public static void sendTestMail() {
        String[] toAddresses = new string[]{'someemailaddress@example.com'};
        String[] ccAddresses = new string[]{'someemailaddress@example.com'};
        String senderDisplay = 'Testing the CustomSendMail class';
        String subject = 'customSendMailTest';
        String[] bodyMain = new String[]{'This is a test mail...'};
        String body = '';
        test.StartTest();
        CustomSendMail.sendMail(toAddresses, ccAddresses, senderDisplay, subject, body);
        test.StopTest();
    }
}