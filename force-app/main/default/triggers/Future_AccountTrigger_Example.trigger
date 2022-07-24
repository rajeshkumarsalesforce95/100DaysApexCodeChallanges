trigger Future_AccountTrigger_Example on Account (After insert) {
    Trigger_Prevent__c myCS = Trigger_Prevent__c.getValues('IsActiveTrigger');
    if(!myCS.Disable_Trigger__c){
        Map<Id,Account> accMap = Trigger.newMap;
        Set<Id> accIds = accMap.keySet();
        Future_AccountTriggerHandler.invoke(accIds);
    }
}