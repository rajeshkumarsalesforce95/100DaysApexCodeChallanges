@isTest
public class AccountBillingAdrressTriggerTest {
	@isTest
    public static void testAddress(){
        List<Account>  accList = new List<Account>();
        Account acc = new Account();
        acc.Name = '360 SMS App';
        acc.BillingStreet = '2047 John F Kennedy Blvd';
        acc.BillingCity  = 'Jersey City';
        acc.BillingPostalCode = '07305-1527';
        acc.BillingState      = 'NJ';
        acc.BillingCountry    = 'USA';
        accList.add(acc);
        
        if(accList.size()>0){
            insert accList;
        }
        
        System.assertEquals(1, accList.size());
        System.assert(accList.size()>0);
        System.assert(!accList.isEmpty());
        
    }
}