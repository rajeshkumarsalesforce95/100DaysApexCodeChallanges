/*
 * A positive integer is called a spy number if the sum and product of its digits are equal. 
 * In other words, a number whose sum and product of all digits are equal is called a spy number.
 */ 
public class SpyNumberExample {
    public static void checkSpyNumber(integer num){
        X100Dayscodechallanges__c auto = new X100Dayscodechallanges__c();
        auto.Enter_Spy_Number__c = String.valueOf(num);
        auto.isSpyNumber__c = isSpyNumber(num)?true:false;  
        insert auto;
        if(auto.isSpyNumber__c){
           System.debug(num + ' is an Spy Number.');   
        }else{
           System.debug(num + ' is not Spy Number.');   
        }
    }
    public static boolean isSpyNumber(integer num){
        integer sum = 0;
        integer product = 1;
        while(num>0){
            sum = sum + Math.mod(num, 10);
            product = product * Math.mod(num, 10);
            num = num/10;
        }
        if(sum == product){
            return true;
        }
        return false;
    }
}