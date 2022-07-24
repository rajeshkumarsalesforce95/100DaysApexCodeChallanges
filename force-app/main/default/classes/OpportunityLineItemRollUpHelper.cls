public class OpportunityLineItemRollUpHelper {
    public static Void UpdateParentAccount(set<id> oppID){
        list<AggregateResult> countLineItems=[Select OpportunityId oppId,
                   Product2.Family fam,
                   count(id)cnt 
                   from OpportunityLineItem 
                   Where  OpportunityId IN : oppID 
                   group by OpportunityId ,Product2.Family];
        
        system.debug(countLineItems);
        map<ID,Decimal> OpportunitymapFamilyALineItems=new map<ID,Decimal>();
        map<ID,Decimal> OpportunitymapFamilyBLineItems=new map<ID,Decimal>();
        for(AggregateResult agr : countLineItems){
             if((String)agr.get('fam')=='ProductFaimly_A'){
            	OpportunitymapFamilyALineItems.put((id)agr.get('oppId'),(Decimal)agr.get('cnt'));
        	}

      		if((String)agr.get('fam')=='ProductFaimly_B'){
       			 OpportunitymapFamilyBLineItems.put((id)agr.get('oppId'),(Decimal)agr.get('cnt'));
            }
        }
        
        Set<ID> idOfAllOpportunity = new Set<ID>();
        idOfAllOpportunity.addAll(OpportunitymapFamilyALineItems.keyset());
        idOfAllOpportunity.addAll(OpportunitymapFamilyBLineItems.keyset());
        
        system.debug(idOfAllOpportunity);
        
        list<Opportunity> OpportunityToUpdate=new List<Opportunity>();
        for(ID oppIDs:idOfAllOpportunity){
            OpportunityToUpdate.add(
                  New Opportunity(
                              ID=oppIDs,
                              Total_Number_Of_ProductFaimly_A__c = OpportunitymapFamilyALineItems.get(oppIDs),
                              Total_Number_Of_ProductFaimly_B__c = OpportunitymapFamilyBLineItems.get(oppIDs))
                              );
         } 
         update OpportunityToUpdate;
    }
}