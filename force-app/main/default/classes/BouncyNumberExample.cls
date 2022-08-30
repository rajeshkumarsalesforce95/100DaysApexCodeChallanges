/*   Bouncy Number ******
 * A positive integer that is neither in increasing nor decreasing number is called a bouncy number. 
 * It means they bounce between increasing and decreasing.
 */ 
public class BouncyNumberExample {
    public static void checkBouncyNumber(integer num){
        X100Dayscodechallanges__c auto = new X100Dayscodechallanges__c();
        auto.Enter_Bouncy_Number__c = String.valueOf(num);
        auto.isBouncyNumber__c     = isBouncyNumber(num);
        try{
            insert auto;
            if(auto.isBouncyNumber__c){
            	System.debug(num + ' is an Bouncy Number.');
            }else{
               	System.debug(num + ' is Not Bouncy Number.');
            }  
        }catch(Exception Ex){
            System.debug('Exception :: ' + ex.getMessage());
        }
              
    }
    public static boolean isBouncyNumber(integer inputNumber){
        if(isIncreasing(inputNumber) || isDecreasing(inputNumber) || inputNumber < 101){
            return false;
        }
        return true;
    }
    public static boolean isIncreasing(integer num){
        boolean flag = true;  
        String str = String.valueOf(num);
        List<String> lstStr = str.split('');
        for(integer i=0; i<lstStr.size()-1; i++){ 
            String digit = lstStr.get(i);
            if(digit > lstStr.get(i+1)){
                flag = false;
                break;
            }
        }
        return flag;
    }
    public static boolean isDecreasing(integer num){
        boolean flag = true;  
        String str = String.valueOf(num);
        List<String> lstStr = str.split('');
        for(integer i=0; i<lstStr.size()-1; i++){ 
            String digit = lstStr.get(i);
            if(digit < lstStr.get(i+1)){
                flag = false;
                break;
            }
        }
        return flag;
    }
}