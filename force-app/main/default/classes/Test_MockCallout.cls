@isTest
public class Test_MockCallout {
	@isTest
    public static void testMe(){
        Dummy_Response_Test dummy = new Dummy_Response_Test();
        Test.setMock(HttpCalloutMock.class, dummy);
        HttpCalloutMock_Example hp = new HttpCalloutMock_Example();
        hp.call();
        Integer size = [select count() from Account WHERE name='Wipro'];
        System.assertEquals(size, 1);
    }
}