/*
 * Buzz number is another special number in Java that ends with digit 7 or divisible by 7.
 */ 
public class BuzzNumberExample {
    public static void checkBuzzNumber(integer num){
        X100Dayscodechallanges__c auto = new X100Dayscodechallanges__c();
        auto.Enter_Buzz_Number__c = String.valueOf(num);
        auto.isBuzzNumber__c = isBuzzNumber(num); 
        insert auto;
        if(auto.isBuzzNumber__c){
            system.debug(Num + ' is an Buzz Number.');
        }else{
            system.debug(Num + ' is not Buzz Number.');
        }
    }
    public static boolean isBuzzNumber(integer num){
        if(Math.mod(num, 7)==0 || Math.mod(num, 10)==7){
            return true;
        }else{
            return false;
        }
    }
}