@isTest
public class CalloutContactsTest {
    @isTest
    public static void testMe(){
        Create_Fake_Response fk = new Create_Fake_Response();
        Test.setMock(HttpCalloutMock.class, fk);
        CalloutContacts con = new CalloutContacts();
        con.createContact();
        Contact cont = [select id,name,lastName,firstName,phone from Contact WHERE CreatedDate=Today];
        System.assertEquals('Rajesh', cont.firstName);
        System.assertEquals('Kumar', cont.lastName);
        System.assertEquals('9358529110', cont.phone);
    }
}