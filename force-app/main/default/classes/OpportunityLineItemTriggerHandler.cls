public class OpportunityLineItemTriggerHandler {
    public static void insertAndDeleteLogic(List<OpportunityLineItem> listInOrDelLineItems){
        set<ID> oppIds=new Set<ID>();
        for(OpportunityLineItem oppItemid:listInOrDelLineItems){
           oppIds.add(oppItemid.OpportunityId);   
        }
        if(!oppIds.isEmpty() && oppIds.size()>0){
            OpportunityLineItemRollUpHelper.UpdateParentAccount(oppIds);
        }
        
    }
    
    Public Static void updateLogic(Map<id,OpportunityLineItem> mapOldLineItems, List<OpportunityLineItem> listUpLineItems){
        set<ID> oppID=new set<ID>();
        Map<Id,String> prodtFamilyMaps = new map<Id,String>();
        if(mapOldLineItems.size()>0){
            for(OpportunityLineItem items : [Select id,name,Product2Id,Product2.Family from OpportunityLineItem WHERE ID IN : mapOldLineItems.keySet()]){
                prodtFamilyMaps.put(items.id, items.Product2.Family);
            }    
        }
        For(OpportunityLineItem items : listUpLineItems){
            if(prodtFamilyMaps.get(items.id)!=items.Product2.Family){
                oppID.add(items.OpportunityId);
            }
            
            if(mapOldLineItems.get(items.id).OpportunityId!=items.OpportunityId){
                oppID.add(items.OpportunityId);
                oppID.add(mapOldLineItems.get(items.id).OpportunityId);
            }
        }
        
        if(!oppID.isEmpty() && oppID.size()>0){
            OpportunityLineItemRollUpHelper.UpdateParentAccount(oppID);
        }
    }
}