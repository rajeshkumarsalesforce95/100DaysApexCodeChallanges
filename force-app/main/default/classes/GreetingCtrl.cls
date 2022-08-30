public class GreetingCtrl{
    public string greetingMsg;
    public string firstName{set;get;}
    public string lastName{set;get;}
    
    public string getGreetingMsg(){
    	return 'Welcome '+firstName+' '+lastName;
    }
}