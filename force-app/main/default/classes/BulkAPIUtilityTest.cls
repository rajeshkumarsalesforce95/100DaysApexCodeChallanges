/**
 * An apex page controller that exposes the site forgot password functionality
 */
@IsTest public with sharing class BulkAPIUtilityTest {

    static testMethod void testBulkAPI() {
        String csv = 'FirstName,LastName\nnewstechnologyystuff,demo';
        ContentVersion cv = new ContentVersion();
        cv.title = 'Data csv.csv';      
        cv.PathOnClient ='Data csv.csv';           
        cv.VersionData =Blob.valueOf(csv);          
        insert cv;         

        ContentVersion dataContent = [SELECT id, ContentDocumentId FROM ContentVersion where Id = :cv.Id];

        BulkAPIUtility.BulkDataWrapper wrap = new BulkAPIUtility.BulkDataWrapper();
        wrap.fileIdList = new List<Id>{dataContent.ContentDocumentId};
        wrap.objectName = 'Contact';
        wrap.operation = 'Upsert';
        List<BulkAPIUtility.BulkDataWrapper> wrapList = new List<BulkAPIUtility.BulkDataWrapper>{wrap};
        Test.setMock(HttpCalloutMock.class, new BulkAPIMock()); 

        Test.startTest();
            BulkAPIUtility.importBulkdata(wrapList);
        Test.stopTest();


    }
}