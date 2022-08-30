// A number is said to be Peterson if the sum of factorials of each digit is equal to the sum of the number itself.
// 
public class PetersonNumberExample {
    public static void checkPetersonNumber(integer num){
        if(isPetersonNumber(num)){
            X100Dayscodechallanges__c auto = new X100Dayscodechallanges__c();
            auto.Enter_Peterson_Number__c = String.valueOf(num);
            auto.isPetersonNumber__c = true;
            //insert auto;
            System.debug(num + ' is an Peterson number.');
        }else{
            X100Dayscodechallanges__c auto = new X100Dayscodechallanges__c();
            auto.Enter_Peterson_Number__c = String.valueOf(num);
            auto.isPetersonNumber__c = false;
            //insert auto;
            System.debug(num + ' is not Peterson number.');
        }
    }
    public static boolean isPetersonNumber(integer num){
        integer temp = num;
        integer sum = 0;
        integer fact = 1;
        while(num!=0){
            fact = 1;
            integer lastDigit = Math.mod(num, 10);
            for(integer i=1; i<=lastDigit; i++){
                fact = fact * i;
            }
            System.debug('Fact :' + fact);
            sum = sum + fact;
            num = num/10;
        }
        if(sum == temp){
            return true;  
        }else{
            return false;
        }
        
    }
}