/*
 * Description: This method is used to return all accessible fields for an sObject
 */ 
public class GetFieldsOnObject {
    public static Set<String> getSObjectFields(String sObjectName){
        // * Initializing fieldNames set
        Set<String> fieldNames = new Set<String>();
    
        // * Getting metadata of all sObjects
        Map<String, Schema.SObjectType> sObjectMap = Schema.getGlobalDescribe();
    
        // * Getting the reference to current sObject
        Schema.SObjectType sObjectTypeInstance = sObjectMap.get(sObjectName);
    
        if(sObjectTypeInstance!=null) {
    
            // * Getting Fields for current sObject
            Map<String, Schema.SObjectField> fieldMap = sObjectTypeInstance.getDescribe().fields.getMap();
    
            // * Checking each field one by one, if it's accessible, adding it's name to fieldNames set
            for(Schema.SObjectField field: fieldMap.values()) {
                Schema.DescribeFieldResult fieldResult = field.getDescribe();
                if(fieldResult.isAccessible()) {
                    fieldNames.add(fieldResult.getName());
                }
            }
        }
    
        // * Returning the fieldNames set
        return fieldNames;
    }
    // Dev Console Code
    /*Set<String> fieldNames = getSObjectFields('Account');
    for(String fieldName : fieldNames) {
        System.debug(fieldName);
    }*/
}