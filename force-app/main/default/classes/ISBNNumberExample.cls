/*
 * ISBN is another special number in Java. ISBN stands for the International Standard Book Number 
 * that is carried by almost each every book. The digits are taken from right to left.
 * Take a ten-digit ISB number from the user.
 */ 
public class ISBNNumberExample {
    public static void checkISBNNumber(long num){
        X100Dayscodechallanges__c auto = new X100Dayscodechallanges__c();
        auto.Enter_ISBN_Number__c = String.valueOf(num);
        auto.isISBNNumber__c     = isISBNNumber(num);
        try{
          insert auto;
          if(auto.isISBNNumber__c){
              System.debug(num + ' is ISBN Number.');  
          }else{
              System.debug(num + ' is Not ISBN Number.');
          }
        }catch(Exception ex){
            System.debug('Exception : ' + ex.getMessage());
        }
    }
    public static boolean isISBNNumber(long num){
        integer count = 0;
        integer sum = 0;
        while(num>0){
            long rem = Math.mod(num, 10);
            num = num/10;
            count++;
            sum = sum + (integer)(count*rem);
        }
        system.debug('Sum :: ' + sum);
        if(Math.mod(sum, 11)==0){
            return true;
        }
        return false;
    }
}