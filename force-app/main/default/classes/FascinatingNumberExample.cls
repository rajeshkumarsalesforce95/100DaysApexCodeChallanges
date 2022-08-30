/*
 * Multiplying a number by two and three separately, the number obtained by writing the results obtained with the given number will be called a fascinating number. 
 * If the result obtained after concatenation contains all digits from 1 to 9, exactly once.
 */ 
public class FascinatingNumberExample {
    public static void checkFascinatingNumber(integer num){
        X100Dayscodechallanges__c auto = new X100Dayscodechallanges__c();
        auto.Enter_Fascinating_Number__c = String.valueOf(num);
        auto.isFascinatingNumber__c = isFascinatingNumber(num)?true:false;  
        insert auto;
        if(auto.isFascinatingNumber__c){
            System.debug(num + ' is an Fascinating Number.');  
        }else{
            System.debug(num + ' is not Fascinating Number.'); 
        }
    }
    public static boolean isFascinatingNumber(integer num){
        integer temp = num;
        integer digits = 0;
        String result = '';
        integer count = 0;
        while(num>0){
            num=num/10;
            digits++;
        }
        if(digits==3){
            integer num1 = temp * 2;
            integer num2 = temp * 3;
            result = String.valueOf(temp) + String.valueOf(num1) + String.valueOf(num2); 
        }
        System.debug(result);
        for(integer i=1; i<=result.length(); i++){
           if(result.contains(string.valueOf(i))){
               if(i>=1 && i<=9){
                   count++;
               }
           } 
        }
        if(count==9){
            return true;
        }
        return false;
    }
}