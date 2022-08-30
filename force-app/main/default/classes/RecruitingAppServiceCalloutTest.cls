/*
*   Author           : Rajesh Kumar
*   Description      : @Test class for RecruitingAppServiceCallout
*   Created Date     : 30/08/2022
*   LastModifiedDate : 
*   Change Logs#     : 
*/
@isTest
public with sharing class RecruitingAppServiceCalloutTest {
    public Static Final Integer RESPONSE_CODE = 200;
    Public Static Final String RESPONSE_BODY = '{ ' +
            ' "access_token": "00D5g000004gBIK!ARgAQKbb47SnGBnsy3jdK6NU6hYx67rBzqkfTGq0rKOb0.DR3d6J3xf_ibFzITiHb79rpuW8qCyFrjWRDPyCh42DyEMSXN16",' +
            ' "instance_url": "https://innovexsoftwaretechnologie8-dev-ed.my.salesforce.com", ' +
            ' "id": "https://login.salesforce.com/id/00D5g000004gBIKEA2/0055g0000060zgzAAA",' +
            ' "token_type": "Bearer",' +
            ' "issued_at": "1661829552401",' +
            ' "signature": "BnSKI/I0aWQKWan5pqZA2MTZUGo4OsPzFwqKMsJuIk0=" }';

    @isTest
    public static void testService() {

        Test.startTest();

        HTTPCalloutServiceMock htppMock = new HTTPCalloutServiceMock(RESPONSE_CODE, RESPONSE_BODY);
        Test.setMock(HttpCalloutMock.class, htppMock);
        HttpResponse blogAPIResponse = RecruitingAppServiceCallout.callout();
        System.assertEquals(RESPONSE_CODE, blogAPIResponse.getStatusCode(), 'Response Code should be - ' + RESPONSE_CODE);
        System.assertEquals(RESPONSE_BODY, blogAPIResponse.getBody(), 'Response Code should be -' + RESPONSE_BODY);

        Test.stopTest();
    
    }
}