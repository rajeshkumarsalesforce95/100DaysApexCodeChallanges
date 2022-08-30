public class AccountHome {
	public List<Account> accounts;
    public List<Account> getAccounts(){
        if(accounts==null){
            accounts = [select name, owner.name from Account limit 10];
        }
        return accounts;
    }
}