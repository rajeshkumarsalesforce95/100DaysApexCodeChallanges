/*Whenever Account name is update then the related contacts firstname aslo update as account name
 * 360 degree cloud tech. Interview Question-2021-10-04
*/
trigger AccountTrigger on Account (after update) {
    Trigger_Prevent__c myCS = Trigger_Prevent__c.getValues('IsActiveTrigger');
    Set<Id> accIds = new Set<Id>();
    List<Contact> conUpdate = new List<Contact>();
    if(!myCS.Disable_Trigger__c){
        for(Account acc : trigger.new){
            accIds.add(acc.id);
        }
        
        List<Account> accList =[select id,name,(select id,name,lastname,firstname from Contacts) from Account WHERE Id=:accIds];
        for(Account acc : accList){
            for(Contact con : acc.contacts){
                con.firstname = acc.name;
                conUpdate.add(con);
            }
        }
        
        if(conUpdate.size()>0){
            update conUpdate;
        }
    }
}