// Requirment-2 Whenever user change the Phone Number on Contact Object then
// Same Phone Number should be update to Associated Parent Account Object.
// 
trigger ContactPhoneUpdateTrigger on Contact (after Update) {
	Trigger_Prevent__c myCS = Trigger_Prevent__c.getValues('IsActiveTrigger');
    Map<Id,String> mapAccountVsPhone = new Map<Id,String>();
    if(!myCS.Disable_Trigger__c){
        if(trigger.isUpdate){
            for(Contact eachContact : trigger.new){
                if((trigger.oldMap.get(eachContact.Id).Phone != eachContact.Phone) && (eachContact.AccountId!=NULL)){
                    mapAccountVsPhone.put(eachContact.AccountId, eachContact.Phone);
                }
            }
            if(!mapAccountVsPhone.isEmpty()){
                List<Account> accountsList = [SELECT Phone FROM Account WHERE Id IN:mapAccountVsPhone.keySet()];
                for(Account eachAccount : accountsList){
                    eachAccount.Phone = mapAccountVsPhone.get(eachAccount.Id);
                }
                update accountsList;   
            }
        }
    }
}