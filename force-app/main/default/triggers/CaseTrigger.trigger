/* 360 degree technlogies Pvt. Ltd.
======================================*/

/*whenever a case is created, Create a task on case related contact, and The case can't be close until the 
related task Status is marked as completed. Assumption, there can be other task on contact that are not for case, 
and multiple case can also be possible.*/

trigger CaseTrigger on Case (before update) {
    Trigger_Prevent__c myCS = Trigger_Prevent__c.getValues('IsActiveTrigger');
    if(!myCS.Disable_Trigger__c){
        Set<Id> setCaseId = new Set<Id>();
        for (Case theCase:trigger.new) {
            if(theCase.status=='Closed'){
                setCaseId.add(theCase.id);
            }
        }
        
        if(setCaseId.size() > 0 ){
        
            List<Task> lstTask = [SELECT WhatId,id 
                                    FROM Task 
                                    WHERE WhatId in :setCaseId 
                                    and What.Type = 'Case'
                                    and IsClosed  = false];
        
            Map< String, List<Task> > mapCaseWiseTask = new Map< String, List<Task> >();
            for(Task ts : lstTask){
                if( mapCaseWiseTask.containsKey(ts.WhatId) ){
                    List<Task> lstT = mapCaseWiseTask.get(ts.WhatId);
                    lstT.add(ts);
                }else {
                    List<Task> lstT = new List<Task>();
                    lstT.add(ts);
                    mapCaseWiseTask.put( ts.WhatId , lstT );
                }
            }
            
            for( Case theCase : trigger.new ) 
            {
                if(theCase.status=='Closed' && mapCaseWiseTask.containsKey(theCase.id) ){
                    theCase.adderror('Please close the task before closing case');  
                }
            }
        }
    }
}