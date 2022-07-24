/*
 * checks if the given number is an Armstrong number or not.
 *  abcd... = an + bn + cn + dn + ...
 */ 
public class ArmstrongExample3 {
    
    public static void checkArmstrongNumber(long armstrongNumber){
        if(isArmstrongNumber(armstrongNumber)){
            //inserting Record
            X100Dayscodechallanges__c pm = new X100Dayscodechallanges__c();
            pm.Enter_Armstrong_Number__c = String.valueOf(armstrongNumber);
            pm.isArmstrongNumber__c = isArmstrongNumber(armstrongNumber);
            insert pm; 
            System.debug(armstrongNumber + ', Armstrong Number');
            
        }else{
            X100Dayscodechallanges__c pm = new X100Dayscodechallanges__c();
            pm.Enter_Armstrong_Number__c = String.valueOf(armstrongNumber);
            pm.isArmstrongNumber__c = isArmstrongNumber(armstrongNumber);
            insert pm; 
            System.debug(armstrongNumber + ', Not Armstrong Number');
        }
    }
    public static long countNoOfDigits(long num){
        long digit = 0;
        while(num>0){
            digit++;
            num = num/10;
        }
        return num;
    }
    public static boolean isArmstrongNumber(long num){
        long n = countNoOfDigits(num);
        long temp = num, sum = 0;
        while(temp>0){
            long result = Math.mod(temp, 10);
            sum = sum + (long)(Math.pow(result, n));
            temp = temp/10;
        }
        if(sum == num){
            return true;
        }else{
            return false;
        }
    }
}