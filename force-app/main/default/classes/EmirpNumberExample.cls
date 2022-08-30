/*
 * A number is called an emirp number if we get another prime number on reversing the number itself. 
 * In other words, an emirp number is a number that is prime forwards or backward. 
 * It is also known as twisted prime numbers.
 * 
 */ 
public class EmirpNumberExample {
    public static void checkEmirpNumber(integer num){
        X100Dayscodechallanges__c auto = new X100Dayscodechallanges__c();
        auto.Enter_Emirp_Number__c = String.valueOf(num);
        auto.isEmirpNumber__c = isEmirpNumber(num);  
        insert auto;
        if(auto.isEmirpNumber__c){
            system.debug(Num + ' is an Emirp Number.');
        }else{
           system.debug(Num + ' is not Emirp Number.'); 
        }
    }
    public static boolean isEmirpNumber(integer num){
        boolean isEmirpNum = false;
        if(num<=1){
            isEmirpNum = false;
        }
        for(integer i=2;i<=Math.sqrt(num); i++){
            if(Math.Mod(num,i)==0) { 
               isEmirpNum = false;
            } 
        }
        isEmirpNum = true;
        if(isEmirpNum){
            integer temp = num;
            String reverse = '';
            while(temp>0){
                reverse = reverse + Math.mod(temp, 10);
                temp = temp/10;
            }
            if(Integer.valueOf(reverse)<=1){
                return false;
            }
            for(integer i=2;i<=Math.sqrt(Integer.valueOf(reverse)); i++){
                if(Math.Mod(Integer.valueOf(reverse),i)==0) { 
               	  return false;
                } 
            }
            isEmirpNum = true;
        }
        return isEmirpNum;
    }
}