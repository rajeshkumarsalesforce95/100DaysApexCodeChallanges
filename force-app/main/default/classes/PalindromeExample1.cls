/*
 * A palindrome number is a number that is same after reverse. For example 545, 151, 34543, 343, 171, 48984 are the palindrome numbers. 
 * It can also be a string like LOL, MADAM etc.
 */
public class PalindromeExample1 {
    Public static Integer result;
    Public static Integer sum=0;
    Public static Integer temp;
    public static void checkPalindrome(Integer num){
        if(num!=null){
           X100Dayscodechallanges__c pm = new X100Dayscodechallanges__c();
           pm.Enter_Palindrome_Number__c = String.valueOf(num);
           pm.isPalindrome__c = isPalindromeExample(num);
           insert pm; 
        }
        
    }
    public static boolean isPalindromeExample(Integer num){
        temp = num;
        System.debug('Temp=>' + temp);
        while(num>0){    
            result = Math.mod(num, 10);//getting remainder
            System.debug('result =>' + result);  
            sum = (sum*10) + result;    
            System.debug('sum =>' + sum);
            num = num / 10;
            System.debug('num =>' + num); 
        }
        if(temp==sum){
            System.debug(num + ' is an Palindrome Number');
            return true;
        }else{     
            System.debug(num + ' is not Palindrome Number'); 
            return false;
        }  
    }
}