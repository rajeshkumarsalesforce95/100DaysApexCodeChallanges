/*
 * Update bulk Account name using batch apex 
 * Company - Techfocus
*/
global class MyBatchApex implements Database.Batchable<sObject> {
    global Database.QueryLocator start(Database.BatchableContext bc) {
        // collect the batches of records or objects to be passed to execute
        return Database.getQueryLocator('Select id,name from Account');
    }
    global void execute(Database.BatchableContext bc, List<sObject> records){
        // process each batch of records
        List<Account> accList = (List<Account>)records;
        List<sObject> sObjList = new List<sObject>();
        for(Account acc : accList){
            acc.name = 'Rajesh Kumar';
            sObjList.add(acc);
        }
        
        if(sObjList.size()>0){
            update sObjList;
        }
    }    
    global void finish(Database.BatchableContext bc){
        // execute any post-processing operations
    }    
}