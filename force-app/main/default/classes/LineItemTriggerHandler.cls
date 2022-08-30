/*
 *  Whenever line items is inserted, updated and deleted then invoice amount will be populated accoredingly
 */ 
public class LineItemTriggerHandler {
    //Trigger Scenarios
    public static final String TRIGGER_BEFORE_INSERT = 'BEFORE_INSERT';
    public static final String TRIGGER_BEFORE_UPDATE = 'BEFORE_UPDATE';
    public static final String TRIGGER_BEFORE_DELETE = 'BEFORE_DELETE';
    public static final String TRIGGER_AFTER_INSERT  = 'AFTER_INSERT';
    public static final String TRIGGER_AFTER_UPDATE  = 'AFTER_UPDATE';
    public static final String TRIGGER_AFTER_DELETE  = 'AFTER_DELETE';
    
    public static Set<ID> invIdst = new Set<ID>();
    public static List<Invoice__c> invList;
    public static List<Invoice__c> invListUpdate = new List<Invoice__c>();
    public static Decimal totalAmount = 0;
    
    public LineItemTriggerHandler(List<Line_Item__c> newItems, List<Line_Item__c> oldItems, Map<Id, Line_Item__c> newMap, Map<ID, Line_Item__c> oldMap, String triggerAction){
        if(triggerAction == TRIGGER_AFTER_INSERT){
            insertLineItems(newItems, oldMap);
        }else if(triggerAction == TRIGGER_AFTER_DELETE){
            deleteLineItems(oldItems, oldMap); 
            System.debug('After DELETE');
        }else if(triggerAction == TRIGGER_AFTER_UPDATE){
		 updateLineItems(newItems, oldMap);
            System.debug('After UPDATE');
        }
    }
    //When inserting a line items
    public static void insertLineItems(List<Line_Item__c> newItems, Map<ID, Line_Item__c> oldMap){
        for(Line_Item__c item : newItems){
            invIdst.add(item.Invoice_Number__c);
        }
        if(!invIdst.isEmpty()){
            invList = [select id,name,Amount__c,(select id,name,Price__c,Quantity__c from Line_Items__r) from Invoice__c WHERE ID IN : invIdst];
            for(Invoice__c inv : invList){
                if(inv.Line_Items__r.size()>0){
                    for(Line_Item__c item : inv.Line_Items__r){
                        totalAmount = (totalAmount + (item.Price__c*item.Quantity__c));
                    }
                    inv.Amount__c = totalAmount;
                    
                }
                invListUpdate.add(inv);
            }
            if(invListUpdate.size()>0){
                update invListUpdate;
            }
        }
    }
    // When update Line Items
    public static void updateLineItems(List<Line_Item__c> newItems, Map<ID, Line_Item__c> oldMap){
        for(Line_Item__c item : newItems){
            Line_Item__c oldItem = oldMap.get(item.id);
            if((item.Quantity__c != oldItem.Quantity__c || item.Price__c != oldItem.Price__c) && item.Invoice_Number__c!=null){
                invIdst.add(item.Invoice_Number__c);
             }
        }
        if(!invIdst.isEmpty()){
            invList = [select id,name,Amount__c,(select id,name,Price__c,Quantity__c from Line_Items__r) from Invoice__c WHERE ID IN : invIdst];
            for(Invoice__c inv : invList){
                if(inv.Line_Items__r.size()>0){
                    for(Line_Item__c item : inv.Line_Items__r){
                        totalAmount = (totalAmount + (item.Price__c*item.Quantity__c));
                    }
                    inv.Amount__c = totalAmount;
                    
                }
                invListUpdate.add(inv);
            }
            if(invListUpdate.size()>0){
                update invListUpdate;
            }
        }
    }
    
    public static void deleteLineItems(List<Line_Item__c> oldItems, Map<ID, Line_Item__c> oldMap){
        for(Line_Item__c item : oldItems){
            invIdst.add(item.Invoice_Number__c);
        }
        if(!invIdst.isEmpty()){
            invList = [select id,name,Amount__c,(select id,name,Price__c,Quantity__c from Line_Items__r) from Invoice__c WHERE ID IN : invIdst];
            for(Invoice__c inv : invList){
                if(inv.Line_Items__r.size()>0){
                    for(Line_Item__c item : inv.Line_Items__r){
                        totalAmount = (totalAmount + (item.Price__c*item.Quantity__c));
                    }
                    inv.Amount__c = totalAmount;
                }
                invListUpdate.add(inv);
            }
            if(invListUpdate.size()>0){
                update invListUpdate;
            }
        }
    }

}