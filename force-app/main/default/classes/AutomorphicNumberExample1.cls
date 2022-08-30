// Let's see another logic to check the number is automorphic or not.
// 
public class AutomorphicNumberExample1 {
    public static void checkAutomorphicNumber(integer num){
        integer lastDigit = 0;
        integer count =0;
        integer square = num * num;
        integer temp = num;
        while(temp>0){
            count++;
            temp=temp/10;  
        }
        lastDigit = (integer) (Math.mod(square,(integer)(Math.pow(10, count))));//determines the last digit of the variable square  
        if(num==lastDigit){
            X100Dayscodechallanges__c auto = new X100Dayscodechallanges__c();
            auto.Enter_Automorphic_Number__c = String.valueOf(num);
            auto.isAutomorphicNumber__c = true;
            insert auto; 
            System.debug(num+ ' is an automorphic number.');  
        }else{
            X100Dayscodechallanges__c auto = new X100Dayscodechallanges__c();
            auto.Enter_Automorphic_Number__c = String.valueOf(num);
            auto.isAutomorphicNumber__c = false;
            insert auto;
            System.debug(num+ ' is not an automorphic number.');  
        }
    }
}