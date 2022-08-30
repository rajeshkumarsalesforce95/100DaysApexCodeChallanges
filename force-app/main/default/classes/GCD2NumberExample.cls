/*
 * It is the highest number that completely divides two or more numbers. It is abbreviated for GCD.
 */ 
public class GCD2NumberExample {
    public static void findGCDNumber(integer num1, integer num2){
        integer gcd = 1;
        for(integer i = 1; i <= num1 && i <= num2; i++){
            if(math.mod(num1,i)==0 && Math.mod(num2,i)==0){
                gcd = i;
            }
        }
        
        System.debug('GCD Number is : ' +gcd);
    }
}