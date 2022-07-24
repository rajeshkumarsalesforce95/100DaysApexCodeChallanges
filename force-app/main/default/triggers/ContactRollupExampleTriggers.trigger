/*Appcino.com Company -2021-03-05
==================================*/
/*create a picklist field on Contact with 3 values (Status - Draft,InProgress, Completed)
create 3 number fields on Account, one for each picklist option (Draft Count, In-Progress Count, Completed Count)
When a Contact is created/updated/deleted update the related number field on Account with the 
Contact count with each status (basically a custom rollup field)*/

trigger ContactRollupExampleTriggers on Contact (After insert, After Update, After delete, after Undelete) {
    Trigger_Prevent__c myCS = Trigger_Prevent__c.getValues('IsActiveTrigger');
    Set<Id> accIds = new Set<Id>();
    Integer draftCount = 0;
    Integer inProgressCount = 0;
    Integer completedCount = 0;
    List<Account> updateAccList = new List<Account>();
    if(!myCS.Disable_Trigger__c){
        if(Trigger.isInsert || trigger.isUndelete || trigger.isUpdate){
            //ContactRollupExampleTriggersHandler.processContacts(Trigger.new);
            for(contact con : trigger.new){
                if(trigger.oldMap.get(con.id).Status__c!=con.Status__c){
                    accIds.add(con.AccountId);
                }else{
                    accIds.add(con.AccountId);
                }
                
            }
            if(!accIds.isEmpty()){
                List<Account> accList = [select id,name,Draft_Count__c,In_Progress_Count__c,Completed_Count__c,(select id,name,Status__c from Contacts) 
                from Account WHERE Id IN : accIds];
                for(Account acc : accList){
                    if(acc.Contacts.size()>0){
                        for(Contact con : acc.Contacts){
                            if(con.Status__c=='Draft'){
                                draftCount = draftCount + 1;
                            }
                            if(con.Status__c=='InProgress'){
                                inProgressCount = inProgressCount + 1;
                            }
                            if(con.Status__c=='Completed'){
                                completedCount = completedCount + 1;
                            }
                        }
                    }

                    acc.Draft_Count__c = draftCount;
                    acc.In_Progress_Count__c = inProgressCount;
                    acc.Completed_Count__c = completedCount;
                    updateAccList.add(acc);
                }
                if(updateAccList.size()>0){
                    update updateAccList;
                }
            }
        }else if(Trigger.isUpdate){
            //ContactRollupExampleTriggersHandler.processContacts(Trigger.new);
            
        }else if(Trigger.isDelete){
            //ContactRollupExampleTriggersHandler.processContacts(Trigger.old);
        }
    }
}