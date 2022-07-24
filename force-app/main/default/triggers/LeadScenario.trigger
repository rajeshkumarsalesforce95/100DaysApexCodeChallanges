/* Q.2 Whenever Lead is created with LeadSource as Local then give rating as cold otherwise hot.
 */
trigger LeadScenario on Lead (before insert) {
    Trigger_Prevent__c myCS = Trigger_Prevent__c.getValues('IsActiveTrigger');
    if(!myCS.Disable_Trigger__c){
        for(lead ld : trigger.new){
            if(ld.leadsource == 'Local'){
                ld.Rating = 'Cold';
            }else{
                ld.Rating = 'Hot';
           }
       }
   }
}