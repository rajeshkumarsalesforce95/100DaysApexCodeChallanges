public class InvoiceTriggerHandler {
    //Trigger Scenarios
    public static final String TRIGGER_BEFORE_INSERT = 'BEFORE_INSERT';
    public static final String TRIGGER_BEFORE_UPDATE = 'BEFORE_UPDATE';
    public static final String TRIGGER_BEFORE_DELETE = 'BEFORE_DELETE';
    public static final String TRIGGER_AFTER_INSERT  = 'AFTER_INSERT';
    public static final String TRIGGER_AFTER_UPDATE  = 'AFTER_UPDATE';
    public static final String TRIGGER_AFTER_DELETE  = 'AFTER_DELETE';
    public static Set<ID> invIds = new Set<ID>();
    public static List<Line_Item__c> lineItems = null;
    Public static Map<ID,String> invStatusMap = new Map<ID,String>();
    
    public InvoiceTriggerHandler(List<Invoice__c> newInvoices, List<Invoice__c> oldInvoices, Map<Id, Invoice__c> newMap, Map<ID, Invoice__c> oldMap, String triggerAction){
        if(triggerAction == TRIGGER_AFTER_INSERT){
            //insertLineItems(newItems, oldMap);
        }else if(triggerAction == TRIGGER_AFTER_DELETE){
            //deleteLineItems(oldItems, oldMap); 
            System.debug('After DELETE');
        }else if(triggerAction == TRIGGER_AFTER_UPDATE){
            updateInvoices(newInvoices, oldMap);
            System.debug('After UPDATE');
        }
    }
    public static void updateInvoices(List<Invoice__c> newInvoices, Map<ID, Invoice__c> oldMap){
        for(Invoice__c inv : newInvoices){
            if(inv.status__c!=oldMap.get(inv.id).status__c){
                invIds.add(inv.id);
                invStatusMap.put(inv.Id, inv.Status__c);
            }
        }
        if(!invIds.isEmpty()){
            lineItems = [select id,name,status__c,Invoice_Number__c from Line_Item__c WHERE Invoice_Number__c IN : invIds];
            if(lineItems.size()>0){
              for(Line_Item__c item : lineItems){
                 item.Status__c = invStatusMap.get(item.Invoice_Number__c);
              }
              update lineItems;
            }
        }
    }
}