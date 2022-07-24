/* Whenever Amount field updated on contact object then the
 * Total Amount of contact field autometically updated on parant object(Account).
 * What i am trying say is whenever child object updated autometically account will be updated.
 * 
 * Sol - both write trigger or any othor sol - formula,Rollup Summary 
 */
trigger UpdateTotalAmount on Contact (After Update, After Insert) {
    Set<Id> accIds = new Set<Id>();
    Set<Id> conIds = new Set<Id>();
    List<Account> accListUpdate = new List<Account>();
    Decimal amount = 0.00;
    Trigger_Prevent__c myCS = Trigger_Prevent__c.getValues('IsActiveTrigger');
    if(!myCS.Disable_Trigger__c){
        for(Contact con : Trigger.new){
            accIds.add(con.AccountId);
            //conIds.add(con.id);
        }
        //SELECT SUM(Amount__c) FROM Contact where AccountId='0015g00000RjUsL' group by AccountId
        for(Account acc : [select id,name,Total_Amount_of_Contacts__c,(Select id,name,Amount__c from Contacts WHERE AccountId=:accIds) from Account WHERE Id=:accIds]){
            for(Contact con : acc.Contacts){
                amount=amount+con.Amount__c; 
            }
            
            acc.Total_Amount_of_Contacts__c = amount; 
            accListUpdate.add(acc);
        }
        if(accListUpdate.size()>0){
            Update accListUpdate;
        }
    }

}