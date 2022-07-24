//Requirment - Whenever user change the Phone Number on Account Object then
// Same Phone Number should be update on all the related Contacts.

trigger AccountPhoneUpdateTrigger on Account (after update) {
    Trigger_Prevent__c myCS = Trigger_Prevent__c.getValues('IsActiveTrigger');//Disable the Trigger using Custom Setting
    Map<Id,String> newMap = new Map<Id,String>();
    if(!myCS.Disable_Trigger__c){
        if(trigger.isUpdate && trigger.isAfter){
            for(Account acc : trigger.new){
                if(trigger.oldMap.get(acc.id).phone!=acc.phone){
                    newMap.put(acc.id,acc.Phone);
                    
                }
            }
        }
    }
    if(!newMap.isEmpty()){
        List<Contact> conList = [select Phone from Contact WHERE AccountId IN:newMap.keySet()];
        for(contact con : conList){
            con.phone = newMap.get(con.AccountId);
        }
        
        Update conList;
    }
}