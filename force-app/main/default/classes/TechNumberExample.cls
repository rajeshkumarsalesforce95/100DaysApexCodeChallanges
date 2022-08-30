/* A number is called a tech number if the given number has an even number of digits and the number can be divided exactly into two parts from the middle. 
 * After equally dividing the number, sum up the numbers and find the square of the sum. If we get the number itself as square, the given number is a tech number, 
 * else, not a tech number. For example, 3025 is a tech number. 
 */
public class TechNumberExample {
    public static void checkTechNumber(integer num){
        X100Dayscodechallanges__c auto = new X100Dayscodechallanges__c();
        auto.Enter_Tech_Number__c = String.valueOf(num);
        auto.isTechNumber__c = isTechNumber(num)?true:false;  
        insert auto;
        if(auto.isTechNumber__c){
            system.debug(num + ' is an Tech Number.');  
        }else{
            system.debug(num + ' is not Tech Number.'); 
        }
    }
    public static boolean isTechNumber(integer num){
        integer temp = num;
        integer evenDigit = 0;
        integer firstHalf = 0;
        integer secondHalf = 0;
        integer squareOfSum  = 0;
        while(num>0){
            num=num/10;
            evenDigit++;
        }
        if(Math.mod(evenDigit, 2)==0){
           firstHalf = Math.mod(temp, (integer) Math.pow(10, evenDigit/2));
           secondHalf = temp/(integer)Math.pow(10, evenDigit/2);
           squareOfSum  = (firstHalf + secondHalf) * (firstHalf + secondHalf); 
        }
        if(temp==squareOfSum){
            return true;
        }
        return false;
    }
}