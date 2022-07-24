public class TriggerHelper {
	
    public static void insertAndDeleteLogic(List<Contact> listInOrDelContacts){
        set<ID> accounID=new Set<ID>();
        for(Contact Conid:listInOrDelContacts){
           accounID.add(Conid.AccountId);   
        }
      	CustomRollUpHelper.UpdateParentAccount(accounID);
    }

    Public Static void updateLogic(Map<id,Contact> mapOldContacts,List<Contact> listUpContacts){
        set<ID> accounID=new set<ID>();
        For(Contact Con:listUpContacts){
            if(mapOldContacts.get(Con.id).Status__c!=Con.Status__c){
                accounID.add(Con.AccountID);
            }
            if(mapOldContacts.get(Con.id).AccountId!=Con.AccountId){
                accounID.add(mapOldContacts.get(Con.id).AccountId);
                accounID.add(Con.AccountID);
            }
        }
        if(accounID.size()>0){
            CustomRollUpHelper.UpdateParentAccount(accounID); 
        }
    }
}