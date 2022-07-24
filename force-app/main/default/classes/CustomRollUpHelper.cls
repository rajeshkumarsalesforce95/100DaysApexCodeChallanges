public class CustomRollUpHelper {
	
public static Void UpdateParentAccount(set<id> accntID){

    list<AggregateResult> countDraftContacts=[
            Select AccountId acId,
                   Status__c stats,
                   count(id)cnt 
                   from Contact 
                   Where  AccountId in :accntID  
                   group by AccountId ,Status__c];

    system.debug(countDraftContacts);
    map<ID,Decimal> AccountmapDraftContacts=new map<ID,Decimal>();
    map<ID,Decimal> AccountmapInProgressContacts=new map<ID,Decimal>();
    map<ID,Decimal> AccountmapCompletedContacts=new map<ID,Decimal>();

    for(AggregateResult agr:countDraftContacts){
      if((String)agr.get('stats')=='Draft'){
            AccountmapDraftContacts.put((id)agr.get('acID'),(Decimal)agr.get('cnt'));
        }

      if((String)agr.get('stats')=='InProgress'){
        AccountmapInProgressContacts.put((id)agr.get('acID'),(Decimal)agr.get('cnt'));
        }

      if((String)agr.get('stats')=='Completed'){
        AccountmapCompletedContacts.put((id)agr.get('acID'),(Decimal)agr.get('cnt'));
        }
    }

    Set<ID> idOfAllAccount=new Set<ID>();
    idOfAllAccount.addAll(AccountmapDraftContacts.keyset());
    idOfAllAccount.addAll(AccountmapInProgressContacts.keyset());
    idOfAllAccount.addAll(AccountmapCompletedContacts.keyset());

    system.debug(idOfAllAccount);
    list<Account> accountsToUpdate=new List<Account>();
    for(ID accID:idOfAllAccount){
        accountsToUpdate.add(
              New Account(
                          ID=accID,
                          Draft_Count__c=AccountmapDraftContacts.get(accID),
                          In_Progress_Count__c=AccountmapInProgressContacts.get(accID),
                          Completed_Count__c=AccountmapCompletedContacts.get(accId))
                          );
     }
     update accountsToUpdate;
 }
}