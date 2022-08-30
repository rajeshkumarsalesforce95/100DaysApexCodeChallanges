/*
 *  Checking Object Permissions For The Logged In User
 *     Invoice__c obj = new Invoice__c();
       sObject obj1 = obj;
 */ 
public class ObjectPermissions {
    /*   Calling Method using dev Console
     * ----------------------------------
     *   Invoice__c obj = new Invoice__c();
     *   ObjectPermissions.checkObjectPermission(obj);
     */ 
    public static void checkObjectPermission(sObject obj){
        Schema.SObjectType currentObjectType = obj.getSObjectType();
        Schema.DescribeSObjectResult currentSObjectResult = currentObjectType.getDescribe();
        System.debug('API Name = ' + currentSObjectResult.getName());
        System.debug('Is Custom Object = ' + currentSObjectResult.isCustom());
        System.debug('Is Accessible = ' + currentSObjectResult.isAccessible());
        System.debug('Is Creatable = ' + currentSObjectResult.isCreateable());
        System.debug('Is Updateable = ' + currentSObjectResult.isUpdateable());
        System.debug('Is Deletable = ' + currentSObjectResult.isDeletable());
    }
}