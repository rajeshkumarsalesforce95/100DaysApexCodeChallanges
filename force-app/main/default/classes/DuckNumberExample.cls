/*
 * Duck number is another special positive non-zero number that contains zero in it. 
 * The digit zero should not be presented at the starting of the number. 
 * Zero can be present at any of the positions except the beginning of the number.
 * 
 */ 
public class DuckNumberExample {
    public static void checkDuckNumber(integer num){
        X100Dayscodechallanges__c auto = new X100Dayscodechallanges__c();
        auto.Enter_Duck_Number__c = String.valueOf(num);
        auto.isDuckNumber__c     = isDuckNumber(num); 
        insert auto; 
        
        if(auto.isDuckNumber__c){
            System.debug(num + ' is an Duck Number.');
        }else{
           System.debug(num + ' is Not Duck Number.'); 
        }
    }
    public static boolean isDuckNumber(integer num){
        while(num!=0){
            if(Math.mod(num, 10)==0){
                return true;    //return true if the number is Duck  
            }
            num = num / 10;  
        }
        return false; //return false if the number is not Duck  
    }
}