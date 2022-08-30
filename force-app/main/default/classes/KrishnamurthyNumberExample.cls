/*
 * Krishnamurthy number is another special number in Java. 
 * A number is said to be Krishnamurthy if the factorial sum of all its digits is equal to that number. 
 * Krishnamurthy number is also referred to as a Strong number.
 * 
 */ 
public class KrishnamurthyNumberExample {
    public static void checkKrishnamurthyNumber(integer num){
        if(isKrishnamurthyNumber(num)){
            System.debug(num + ' is Krishnamurthy Number.');
        }else{
            System.debug(num + ' is Not Krishnamurthy Number.');
        }
    }
    public static boolean isKrishnamurthyNumber(integer num){
        integer fact =1;
        integer sum = 0;
        integer temp = num;
        while(num>0){
            integer rem = Math.mod(num, 10);
            for(integer i=1; i<=rem; i++){
                fact = fact * i;
            }
            sum = sum + fact;
            num = num/10;
            fact = 1;
        }
        if(sum==temp){
            return true;
        }
        return false;
    }
}