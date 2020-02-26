/**
 * @File Name          : batchsample.cls
 * @Description        :
 * @Author             : Sam Reilly
 * @Group              :
 * @Last Modified By   : Sam Reilly
 * @Last Modified On   : 27/02/2020, 10:09:53 am
 * @Modification Log   :
 * Ver       Date            Author      		    Modification
 * 1.0    27/02/2020   Sam Reilly     Initial Version
**/


global classbatchsample implements Database.Batchable<SObject>, Database.Stateful {

    global Database.queryLocator start(Database.BatchableContext BC){
        return Database.getQueryLocator('SELECT some things');

    }

    global void execute(Database.batchableContext bc, List<items> scope){

    }

    global void finish(Database.batchableContext bc){

    }
}