/**
 * @File Name          : databaseSaveResult.cls
 * @Description        :
 * @Author             : Sam Reilly
 * @Group              :
 * @Last Modified By   : Sam Reilly
 * @Last Modified On   : 27/02/2020, 11:17:46 am
 * @Modification Log   :
 * Ver       Date            Author      		    Modification
 * 1.0    27/02/2020   Sam Reilly     Initial Version
**/

        for (Database.SaveResult sr : srList) {
            if (sr.isSuccess()) {
                System.debug('Record successfully saved ' + sr.getId());
                countRecordsProcessed += 1;
            } else {

                for (Database.Error err : sr.getErrors()) {
                    msgBodyText += 'The following error occurred: ' + err.getStatusCode() + ': ' + err.getMessage() + '. ' + 'Record not updated: ' + err.getFields();
                    System.debug('The following error has occurred.');
                    System.debug(err.getStatusCode() + ': ' + err.getMessage());
                    System.debug('Record not updated: ' + err.getFields());
                }
            }

    }