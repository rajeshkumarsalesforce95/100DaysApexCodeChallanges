/* To reverse a number, follow the steps given below:
   1. First, we find the remainder of the given number by using the Math.mod(x, y) .
   2. Multiply the variable reverse by 10 and add the remainder into it.
   3. Divide the number by 10.
*/

public class ReverseNumberExample {
    public static void printReverseNum(Integer revNumber){
        integer reverse = 0;
        for(integer i=0; i<=revNumber; i++){
            if(revNumber>0){
                integer remainder = Math.mod(revNumber, 10);// revNumber % 10;  
                reverse = reverse * 10 + remainder;  
                revNumber = revNumber/10;  
            }
        }
        System.debug('Reverse Number : ' + reverse);
    }
}