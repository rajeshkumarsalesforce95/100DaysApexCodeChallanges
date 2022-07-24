/* Create 'Sales Rep' field with datatype(Text) on Account object.
 * When we create account record, the account owner will be autometically added to 
 * Sales Rep field. When we update the account owner of the record,
 * then also the Sales Rep will be autometically updated.
 */
trigger CreateSalesRep on Account (before insert, before update) {
    Trigger_Prevent__c myCS = Trigger_Prevent__c.getValues('IsActiveTrigger');
    if(!myCS.Disable_Trigger__c){
        Map<String,String> csMap = new Map<String,String>();
        Set<String> csSet = new Set<String>();
        for(Account acc : Trigger.new){
            csSet.add(acc.ownerId);
        }
        
        List<User> csList = [Select id,name from User Where Id=:csSet];
        for(User us : csList){
            csMap.put(us.id, us.name);
        }
        
        
        for(String rep : csMap.keySet()){
            Trigger.new[0].Sales_Rep__c = csMap.get(rep);
        }
    }
}