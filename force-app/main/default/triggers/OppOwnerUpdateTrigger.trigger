trigger OppOwnerUpdateTrigger on Opportunity (After update) {
    Map<Id,Opportunity> oppOldMap = Trigger.oldMap;
    Set<Id> oppIds = new Set<Id>();
    Map<Id,Id> oppIdsAndAccIdsMap = new Map<Id,Id>();
    Trigger_Prevent__c myCS = Trigger_Prevent__c.getValues('IsActiveTrigger');
    if(!myCS.Disable_Trigger__c){
        for(Opportunity opp: Trigger.new){
            Opportunity oldOpp = oppOldMap.get(opp.Id); 
            if(opp.OwnerId!=oldOpp.OwnerId){
                oppIdsAndAccIdsMap.put(opp.id,opp.AccountId);
            }
        }
    }
}


//select id,name from CaseTeamRole