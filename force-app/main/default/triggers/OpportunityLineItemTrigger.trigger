/* We have a Opportunity and Opportunity Line Object, again Opportunity LineItems we have Product Lookup and Product there is one field called Faimly.
	1. Opportunity  - TotalCountProductFaimly_A, TotalCountProductFaimly_B 
	2. Opportunity Line and
	3. Product - faimly field
We have to create 2 fields on Opportunity Object like ProductFaimly_A and  ProductFaimly_B, Total number of LineItems which are belong from the ProductFamily_A 
and we have to update the total number of ProductFaimly_B on LineItems */

trigger OpportunityLineItemTrigger on OpportunityLineItem (after insert, after update, after delete) {
	Trigger_Prevent__c myCS = Trigger_Prevent__c.getValues('IsActiveTrigger');
    if(!myCS.Disable_Trigger__c){
        if(trigger.isAfter && Trigger.isInsert || trigger.isundelete){
            OpportunityLineItemTriggerHandler.insertAndDeleteLogic(trigger.new);  
        } 
        if(trigger.isAfter && Trigger.isDelete){
           OpportunityLineItemTriggerHandler.insertAndDeleteLogic(trigger.old); 
        } 
        if(Trigger.isAfter && trigger.isUpdate){
           OpportunityLineItemTriggerHandler.updateLogic(trigger.oldMap,trigger.new);
        }  
    }
}