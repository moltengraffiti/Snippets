/**
 * @File Name          :
 * @Description        :
 * @Author             : Sam Reilly
 * @Group              :
 * @Last Modified By   : Sam Reilly
 * @Last Modified On   : 27/02/2020, 10:10:49 am
 * @Modification Log   :
 * Ver       Date            Author      		    Modification
 * 1.0    27/02/2020   Sam Reilly     Initial Version
**/


public with sharing class batchCaller {

    batchsample bce=new batchsample();
    Id batchprocess=database.executeBatch(bce);
}