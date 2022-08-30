/* A number is called a sunny number if the number next to the given number is a perfect square. 
 * In other words, a number N will be a sunny number if N+1 is a perfect square.
 */ 
public class SunnyNumberExample {
    public static void checkSunnyNumber(integer num){
        if(isSunnyNumber(num)){
            X100Dayscodechallanges__c auto = new X100Dayscodechallanges__c();
            auto.Enter_Sunny_Number__c = String.valueOf(num);
            auto.isSunnyNumber__c = true; 
            insert auto; 
            System.debug(num +' is an Sunny Number.');
        }else{
            X100Dayscodechallanges__c auto = new X100Dayscodechallanges__c();
            auto.Enter_Sunny_Number__c = String.valueOf(num);
            auto.isSunnyNumber__c = false; 
            insert auto; 
            System.debug(num +' is not Sunny Number!');
        }
    }
    public static boolean isSunnyNumber(integer num){
        
        integer num1 = num + 1;
        Double exactSqrt = Math.sqrt(num1);
        String str = String.valueOf(exactSqrt);
        Double afterDecimalVal = Double.valueOf(str.substringAfter('.'));
        
        if(afterDecimalVal==0.0){
           return true; 
        }else{
           return false;
        }
        
    }
}