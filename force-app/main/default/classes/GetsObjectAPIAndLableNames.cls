/*
 * Get All Object API Names With Their Labels
 */ 
public class GetsObjectAPIAndLableNames {
    public static void getLableAndAPIs(){
        // * Initializing Map
        Map<String, String> objectAPINameToLabelMap = new Map<String, String>();
        
        // * Getting all objects metadata
        Map<String, Schema.SObjectType> globalDescribeMap = Schema.getGlobalDescribe();
        
        // * Processing each sObject one by one
        for(String globalDescribeKey : globalDescribeMap.keySet()) {
        
            // * Getting the current sObject type
            Schema.SObjectType currentSObjectType = globalDescribeMap.get(globalDescribeKey);
        
            // * Getting the current sObject description result from sObject Type
            Schema.DescribeSObjectResult currentSObjectResult = currentSObjectType.getDescribe();
        
            // * Getting the API name and value of current sObject and adding it to the map
            objectAPINameToLabelMap.put(currentSObjectResult.getName(), currentSObjectResult.getLabel());
        }
        
        // * Processing each entry of the map one by one and displaying sObject API Name and Label
        for(String objectAPIName : objectAPINameToLabelMap.keySet()) {
            System.debug(objectAPINameToLabelMap.get(objectAPIName) + ' --> ' + objectAPIName);
        }

    }
}