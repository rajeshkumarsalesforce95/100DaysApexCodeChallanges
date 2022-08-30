/*
 *   A number is called an automorphic number if and only if the square of the given number ends with the same number itself. 
 *   For example, 25, 76 are automorphic numbers because their square is 625 and 5776, respectively
 */ 
public class AutomorphicNumberExample {
    public static void printAutomorphicNumber(integer num){
        if(isAutomorphicNumber(num)){
            X100Dayscodechallanges__c auto = new X100Dayscodechallanges__c();
            auto.Enter_Automorphic_Number__c = String.valueOf(num);
            auto.isAutomorphicNumber__c = true; //isAutomorphicNumber(num);
            insert auto; 
            System.debug(num +' is automorphic number.');
        }else{
            X100Dayscodechallanges__c auto = new X100Dayscodechallanges__c();
            auto.Enter_Automorphic_Number__c = String.valueOf(num);
            auto.isAutomorphicNumber__c = false; //isAutomorphicNumber(num);
            insert auto; 
            System.debug(num +' is not automorphic number.');
        }
    }
    public static boolean isAutomorphicNumber(integer num){
        integer sequreNumber = num * num;//1296
        while(num>0){
            if(Math.mod(num, 10)!=Math.mod(sequreNumber, 10)){ 
                return false; 
            }
            num = num/10;
            sequreNumber = sequreNumber/10; 
        }
        return true;
    }
}