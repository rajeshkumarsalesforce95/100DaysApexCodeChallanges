/* Q.1 Whenever a case is created with origin as ‘Phone’ then set status as ‘New’ and Priority as ‘High’.*/

trigger CaseOrigin on Case (before insert) {
    Trigger_Prevent__c myCS = Trigger_Prevent__c.getValues('IsActiveTrigger');
    if(!myCS.Disable_Trigger__c){
        for(case c : trigger.new){
            if(c.origin == 'Phone'){
                c.status = 'New';
                c.priority = 'High';
             }
         }
     }
}