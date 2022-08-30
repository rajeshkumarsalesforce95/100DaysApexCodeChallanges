/*
 * checks if the given number is an Armstrong number or not.
 *  abcd... = an + bn + cn + dn + ...
 */ 
public class ArmstrongExample2 {
    public static void checkArmstrongNumber(long armstrongNumber){
        if(isArmstrong(armstrongNumber)){
            X100Dayscodechallanges__c pm = new X100Dayscodechallanges__c();
            pm.Enter_Armstrong_Number__c = String.valueOf(armstrongNumber);
            pm.isArmstrongNumber__c = true; //isArmstrong(armstrongNumber);
            insert pm; 
            System.debug(armstrongNumber + ', Armstrong Number');
        }else{
            X100Dayscodechallanges__c pm = new X100Dayscodechallanges__c();
            pm.Enter_Armstrong_Number__c = String.valueOf(armstrongNumber);
            pm.isArmstrongNumber__c = true; //isArmstrong(armstrongNumber);
            insert pm; 
            System.debug(armstrongNumber + ', Not Armstrong Number'); 
        }
    }
    public static boolean isArmstrong(long num){
        long temp=0, digits=0, last=0, sum=0;
        temp = num;
        while(temp>0){   
        temp = temp/10;    
        digits++;   
      }   
      temp = num;   
      while(temp>0){    
         last = Math.mod(temp, 10); //temp % 10;   
         sum = sum + (long)(Math.pow(last, digits));     
         temp = temp/10;
      }
        
        if(num==sum){
            return true;
        }else{
            return false;
        }
    }
}