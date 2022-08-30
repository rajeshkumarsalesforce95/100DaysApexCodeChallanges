/*
 * A positive integer whose sum of digits of its square is equal to the number itself is called a neon number.
 */ 
public class NeonNumberExample {
    public static void checkNeonNumber(integer num){
        X100Dayscodechallanges__c auto = new X100Dayscodechallanges__c();
        auto.Enter_Neon_Number__c = String.valueOf(num);
        auto.isNeonNumber__c = isNeonNumber(num)?true:false;  
        insert auto;
        if(auto.isNeonNumber__c){
            System.debug(num + ' is an Neon Number.');  
        }else{
            System.debug(num + ' is not Neon Number.'); 
        }
    }
    public static boolean isNeonNumber(integer num){
        integer temp = num * num;
        integer sumDigit = 0;
        system.debug(temp);
        while(temp>0){
            integer digit = Math.mod(temp, 10);
            sumDigit = sumDigit + digit;
            temp = temp/10;
        }       
        if(num==sumDigit){
            return true;
        }
        return false;
    }
}