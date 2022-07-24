// A palindrome String is a String that is same after reverse. 
// Example- It can also be a string like LOL, MADAM etc.
// 
public class PalindromeExample2 {
    public static void checkPalindrome(String str){
        String tempString = str.reverse(); 
        if(tempString == str){
           if(str!=null){
               X100Dayscodechallanges__c pm = new X100Dayscodechallanges__c();
               pm.Enter_Palindrome_Number__c = str;
               pm.isPalindrome__c = true;
               insert pm; 
       	  }
        }else{
            X100Dayscodechallanges__c pm = new X100Dayscodechallanges__c();
            pm.Enter_Palindrome_Number__c = str;
            pm.isPalindrome__c = false;
            insert pm; 
        }
    }
}