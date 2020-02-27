/**
 * @File Name          : ManageChangeItemController.cls
 * @Description        :
 * @Author             : Sam Reilly
 * @Group              :
 * @Last Modified By   : Sam Reilly
 * @Last Modified On   : 27/02/2020, 12:01:24 pm
 * @Modification Log   :
 * Ver       Date            Author      		    Modification
 * 1.0    27/02/2020   Sam Reilly     Initial Version
**/


/**
Custom controller for the ManageChangeItems page
 */
public with sharing class ManageChangeItemController {

    Case sourceCase;
    Change_Item__c ci= new Change_Item__c();
    public List<Change_Item__c> ciList { get; set; }
    public String deletionId { get; set; }
    public String indexNo {get; set; }
    public Integer idxno;

    public ManageChangeItemController(ApexPages.StandardController stdController) {

        sourceCase = (Case)stdController.getRecord();

        if(sourceCase!=null){
            loadItems();
    }
}

//Load any existing change items on the case
    public void loadItems(){

        ciList=new List<Change_Item__c>();

        for(Change_Item__c c: [SELECT Id, Case__c, Change_Type__c,Item_Status__c, Release_Status__c, Change_Detail__c, Item_Name__c, Change__c, Object__c, Deployment_Method__c, Release__c FROM Change_Item__c WHERE Case__c =:this.sourceCase.Id AND isDeleted=:false]){
            ciList.add(c);
        }

    }

//Add a new change item
    public void addItem(){
        Change_Item__c c = new Change_Item__c();
        c.Case__c=sourceCase.Id;
        ciList.add(c);

    }
//Save the list
    public Pagereference saveItem(){
        try{
        upsert ciList;
        }

        catch(DmlException e){
        System.debug('****DML Error*** '+ e.getMessage());
        }

        PageReference pg = new ApexPages.StandardController( this.sourceCase ).view();
        pg.setRedirect(true);
        return pg;
    }

//Cancel out of the page
    public Pagereference cancelItem(){
        PageReference pg = new ApexPages.StandardController( this.sourceCase ).view();
        pg.setRedirect(true);
        return pg;
    }

//Delete any item in any order from the list
    public void deleteItem(){
        System.debug('********Delete function called********');

        Change_Item__c delCi=null;
         idxno=Integer.valueof(indexNo);

        if(deletionId!=null && deletionId.length()>0){
            System.debug('*****ID of the record to delete before loop***** '+deletionId);
            for (Change_Item__c delItem :ciList){
                if (delItem.Id == deletionId){
                    delCi=delItem;
                    break;

                }
            }
        }

        else{
            System.debug('******Index No is***** ' +indexNo);
           try{

             System.debug('******Idx No is***** ' +idxno);
            ciList.remove(idxno);
           }
           catch(exception e){
                System.debug('****List deletion error*** '+ e.getMessage());
           }
        }


        if(delCi!=null){
            System.debug('*****ID of the record to delete after loop***** '+delCi);
             ciList.remove(idxno);
            try{
            delete delCi;
            }
            catch(DmlException e){
                System.debug('****DML Error*** '+ e.getMessage());
            }
        }
    }
}