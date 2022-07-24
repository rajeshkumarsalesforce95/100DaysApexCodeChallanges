@isTest
public class Rest_Test_Service_Test {
    @isTest
    public static void testMe(){
        RestRequest request = new RestRequest();
        request.requestURI = '/services/apexrest/mycall';
        request.httpMethod = 'GET';
        RestContext.request = request;
        String result = Rest_Test_Service.call();
        System.assertEquals('Rajesh Kumar', result);
    }
    
    @isTest
    public static void call(){
        RestRequest request = new RestRequest();
        request.requestURI = '/services/apexrest/mycall';
        request.httpMethod = 'POST';
        RestContext.request = request;
        String result = Rest_Test_Service.create('Wipro', 'Energy');
        System.assertEquals('Success', result);
        String abc = Rest_Test_Service.create('', 'Banking');
        System.assertNotEquals('Failed', abc);
    }
}