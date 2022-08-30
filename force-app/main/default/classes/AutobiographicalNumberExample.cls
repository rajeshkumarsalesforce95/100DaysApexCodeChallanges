/*
 * A digit count numerically précises the frequency of digits 0 through 9 in the order in which they occur in a number. 
 * In other words, a number that is a pompous and self-centered figure whose only purpose in life is to describe itself.
 * 
 */ 
public class AutobiographicalNumberExample {
    public static void checkAutobiographicalNumber(long num){
        X100Dayscodechallanges__c auto = new X100Dayscodechallanges__c();
        auto.Enter_Autobiographical_Number__c = String.valueOf(num);
        auto.isAutobiographicalNumber__c = isAutobiographicalNumber(num);  
        insert auto;
        if(auto.isAutobiographicalNumber__c){
            System.debug(num + ' is an Autobiographical Number.');  
        }else{
            System.debug(num + ' is not Autobiographical Number.'); 
        }
    }
    public static boolean isAutobiographicalNumber(long num){ 
        long temp = num;
        integer count = 0;
        integer sum = 0;
        while(temp>0){
            sum = sum + (integer)Math.mod(temp, 10);
            temp = temp/10;
            count++;
        }
        if(sum==count && count<=10){
            return true;
        }
        return false;
    }
}