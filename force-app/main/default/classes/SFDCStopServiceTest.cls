/*
*  Author           : Rajesh Kumar @infosys.com
*  Description      : Test class for SFDCStopService Class
*  Created Date     : 
*  LastModifiedDate : 
*  Change Logs#     : 
*/
@isTest
public with sharing class SFDCStopServiceTest {
    public Static Final Integer RESPONSE_CODE = 200;
    Public Static Final String RESPONSE_BODY = '{"author":"Rahul Malhotra","blogs":[{"id":"1","title":"Salesforce Integration Tutorial Part 1 - Introduction and Setting up Workbench","url":"https://www.sfdcstop.com/2019/11/salesforce-integration-tutorial-part-1.html"}]}';
    
    /*
    *  Author           : Rajesh Kumar @infosys.com
    *  Description      : This Method is used to getSFDCStopBlogs from this SFDCStopBlogService Class
    */
    
    @isTest
    public static void getSFDCStopBlogsTest() {
        Test.startTest();
        HTTPCalloutServiceMock htppMock = new HTTPCalloutServiceMock(RESPONSE_CODE, RESPONSE_BODY);
        Test.setMock(HttpCalloutMock.class, htppMock);
        HttpResponse blogAPIResponse = SFDCStopService.getSFDCStopBlogs();
        System.assertEquals(RESPONSE_CODE, blogAPIResponse.getStatusCode(), 'Response Code should be - ' + RESPONSE_CODE);
        System.assertEquals(RESPONSE_BODY, blogAPIResponse.getBody(), 'Response Code should be -' + RESPONSE_BODY);
        Test.stopTest();
    }
}