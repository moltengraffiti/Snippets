/**
 * @File Name          : batchtest.cls
 * @Description        :
 * @Author             : Sam Reilly
 * @Group              :
 * @Last Modified By   : Sam Reilly
 * @Last Modified On   : 27/02/2020, 10:07:53 am
 * @Modification Log   :
 * Ver       Date            Author      		    Modification
 * 1.0    27/02/2020   Sam Reilly     Initial Version
**/


@isTest
public class batchTest {

    @testSetup
    public static void testSetup(){
       //create records for the test
    }

    static testmethod void test(){
        //start the test
        Test.startTest();
        //call the class
        batchsample bc=new batchsample();
        //query the records created above, add to a list
        List<things> testList = [SELECT some things];
        //call the query locater with null
        Database.QueryLocator ql = bc.start(null);
        //pass the values we've queried to execute, along with the batchable context, which will be null
        bc.execute(null, testList);
        //finish, again passing null batchable context
        bc.Finish(null);
         //run some assertions etc to validate the functionality
        //stop tests
        Test.stopTest();

    }

}