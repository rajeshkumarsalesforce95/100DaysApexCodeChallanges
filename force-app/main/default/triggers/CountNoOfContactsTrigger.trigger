// Whenever the user insert,update,delete and Undelete the contacts record associated with Account object then
// in that case the Account should be updated a field called - 'Count No Of Contacts' Records
trigger CountNoOfContactsTrigger on Contact (after insert, after Update, after delete, after undelete) {
	Trigger_Prevent__c myCS = Trigger_Prevent__c.getValues('IsActiveTrigger');
    Set<Id> accIds = new Set<Id>();
    Set<Id> oldAccIds = new Set<Id>();
    List<Account> updateAccounts = new List<Account>();
    if(!myCS.Disable_Trigger__c){
        
        //1. Insert & undelete records
        if(trigger.isInsert || trigger.isundelete){
            for(Contact con : trigger.new){
                accIds.add(con.AccountId);
            }
            if(!accIds.isEmpty()){
                List<Account> accList = [select id,name,Count_No_Of_Contacts__c,(select id,name from Contacts) from Account WHERE Id IN : accIds];
                for(Account acc : accList){
                    acc.Count_No_Of_Contacts__c = acc.Contacts.size();
                    //updateAccounts.add(acc);
                }
                Update accList;
            }
        }
        //2. Update
        if(trigger.isUpdate){
            for(Contact con : trigger.new){
                if(trigger.OldMap.get(con.id).AccountId!=con.AccountId){
                   accIds.add(con.AccountId); 
                   oldAccIds.add(trigger.OldMap.get(con.id).AccountId);
                }   
            }
            //New Account Updating...
            if(!accIds.isEmpty()){
                List<Account> accList = [select id,name,Count_No_Of_Contacts__c,(select id,name from Contacts) from Account WHERE Id IN : accIds];
                for(Account acc : accList){
                    acc.Count_No_Of_Contacts__c = acc.Contacts.size();
                }
                Update accList;
            }
            //Old Account Updating...
            if(!oldAccIds.isEmpty()){
                List<Account> oldAccList = [select id,name,Count_No_Of_Contacts__c,(select id,name from Contacts) from Account WHERE Id IN : oldAccIds];
                for(Account acc : oldAccList){
                    acc.Count_No_Of_Contacts__c = acc.Contacts.size();
                }
                Update oldAccList;
            }
        }
         //3. Delete
        if(trigger.isdelete){
            for(Contact con : trigger.Old){
                accIds.add(con.AccountId); 
            }
            if(!accIds.isEmpty()){
                List<Account> oldAccList = [select id,name,Count_No_Of_Contacts__c,(select id,name from Contacts) from Account WHERE Id IN : accIds];
                for(Account acc : oldAccList){
                    acc.Count_No_Of_Contacts__c = acc.Contacts.size();
                    updateAccounts.add(acc);
                }
                Update updateAccounts;
            }
        }
    }
}