/**
 * @File Name          : ManageChangeItemControllerTest.cls
 * @Description        : 
 * @Author             : Sam Reilly
 * @Group              : 
 * @Last Modified By   : Sam Reilly
 * @Last Modified On   : 27/02/2020, 12:03:41 pm
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    27/02/2020   Sam Reilly     Initial Version
**/


 /** Test needs improvements, check list size, index no etc
**/
@isTest
public with sharing class ManageChangeItemControllerTest {
    @isTest
    public static void ManageChangeItemControllerTest() {

        Epic__c e= TestDataFactory.createEpic();
        Case c= TestDataFactory.createCase(e.Id);

        Test.startTest();

        PageReference pg = Page.ManageChangeItems;
        Test.setCurrentPage(pg);

        ApexPages.StandardController controller = new ApexPages.StandardController(c);

        ManageChangeItemController ciTest = new ManageChangeItemController(controller);

        ciTest.addItem();
        ciTest.saveItem();

        Change_Item__c cDel=new Change_Item__c();
        cDel.Case__c=c.Id;
        ciTest.ciList.add(cDel);
        Change_Item__c cDel1=new Change_Item__c();
        cDel1.Case__c=c.Id;
        ciTest.ciList.add(cDel1);

        ciTest.saveItem();

        ciTest.loadItems();
        ciTest.cancelItem();
        ciTest.loadItems();
        ciTest.deletionId=cDel.Id;
        ciTest.indexNo='0';
        ciTest.deleteItem();
        ciTest.deleteItem();

        String savePage = ciTest.saveItem().getUrl();
        String cancelPage = ciTest.cancelItem().getUrl();

         Test.stopTest();


    }
}