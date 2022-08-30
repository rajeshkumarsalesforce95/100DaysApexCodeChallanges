/* Day-1
 * Prime number in Java: Prime number is a number that is greater than 1 and divided by 1 or itself only. In other words, 
 * prime numbers can't be divided by other numbers than itself or 1. For example 2, 3, 5, 7, 11, 13, 17.... are the prime numbers.
 * 
*/
public class CheckPrimeNumber {
    public static void checkPrime(Integer primeNumber){
        if(primeNumber!=null){
            X100Dayscodechallanges__c pm = new X100Dayscodechallanges__c();
            pm.Enter_Prime_Number__c = String.valueOf(primeNumber);
            pm.isPrime_Number__c = isPrime(primeNumber);
            insert pm;
        }
        if(isPrime(primeNumber)){
            System.debug(primeNumber + ' is a prime number');             
        }else{
            System.debug(primeNumber + ' is not a prime number');  
        }
    }
    public static boolean isPrime(Integer num){//4<=1
       if(num<=1){  
           return false;  
       }  
       for(integer i=2;i<=Math.sqrt(num); i++) { 
           if(Math.Mod(num,i)==0) { 
               return false;  
           }  
       }  
       return true;   
    }
}