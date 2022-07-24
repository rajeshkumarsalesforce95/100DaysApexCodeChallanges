/*Appcino.com Company -2021-03-05
==================================*/
/*create a picklist field on Contact with 3 values (Status - Draft,InProgress, Completed)
create 3 number fields on Account, one for each picklist option (Draft Count, In-Progress Count, Completed Count)
When a Contact is created/updated/deleted update the related number field on Account with the 
Contact count with each status (basically a custom rollup field)*/

trigger customRollUpFromContact on Contact (after insert, After Update, After delete, after undelete) {
	Trigger_Prevent__c myCS = Trigger_Prevent__c.getValues('IsActiveTrigger');
    if(!myCS.Disable_Trigger__c){
        
        if(trigger.isAfter && Trigger.isInsert || trigger.isundelete){
            TriggerHelper.insertAndDeleteLogic(trigger.new);  
        } 
        if(trigger.isAfter && Trigger.isDelete){
           TriggerHelper.insertAndDeleteLogic(trigger.old); 
        } 
        if(Trigger.isAfter && trigger.isUpdate){
           TriggerHelper.updateLogic(trigger.oldMap,trigger.new);
        }  
    }
}