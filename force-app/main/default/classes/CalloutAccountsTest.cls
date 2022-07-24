@isTest
public class CalloutAccountsTest{
	public static testmethod void testAccountCallout() {
        SingleRequestMock fakeResponse = new SingleRequestMock(200,
                                                 'Complete',
                                                 '[{"Name": "sForceTest1"}]',
                                                 null);
		Test.setMock(HttpCalloutMock.class, fakeResponse);
        List<Account> accList = CalloutAccounts.getAccounts();
        //List<Account> accList = [select id,name from Account];
        //System.assertEquals(accList.size()>0);
        System.assert(accList.size()>0);
    }
}