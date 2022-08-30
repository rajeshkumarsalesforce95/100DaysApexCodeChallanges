/*
 * The Evil number is another special positive whole number in Java that has an even number of 1's in its binary equivalent. 
 * Unlike Prime and Armstrong numbers, Evil number is not so popular and asked by the interviewers.
 */ 
public class EvilNumberExample {
    public static void checkEvilNumber(integer num){
        X100Dayscodechallanges__c auto = new X100Dayscodechallanges__c();
        auto.Enter_Evil_Number__c = String.valueOf(num);
        auto.isEvilNumber__c     = isEvilNumber(num);
        try{
          insert auto; 
        }catch(Exception ex){
            System.debug('Exception : ' + ex.getMessage());
        }
        if(auto.isEvilNumber__c){
		system.debug(num + ' is an Evil Number.');            
        }else{
            system.debug(num + ' is Not Evil Number.'); 
        }        
    }
    public static boolean isEvilNumber(integer num){
        long binaryNumber = convertToBinary(num);
        integer count = 0;
        while(binaryNumber!=0){
            if(Math.mod(binaryNumber, 10) == 1) {
                count++;
            }
            binaryNumber = binaryNumber / 10;  
        }
        if(Math.mod(count, 2) == 0){
            return true;
        }
        return false;
    }
    private static long convertToBinary(integer num){
        long binaryNumber = 0;  
        integer rem = 0;  
        integer j = 1;  
        while(num != 0) {  
            rem = Math.mod(num, 2);
            binaryNumber += rem * j;  
            num = num / 2;  
            j = j * 10;  
        }  
          
        return binaryNumber; 
    }
}