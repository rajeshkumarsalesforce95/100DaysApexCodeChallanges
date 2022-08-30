/* The following program reverses both numbers, positive and negative.
    -> To reverse a number, follow the steps given below:
          1. First, we find the remainder of the given number by using the Math.mod(x, y) .
         2. Multiply the variable reverse by 10 and add the remainder into it.
         3. Divide the number by 10.
*/ 
public class ReverseNumberExample1 {
    public static void printReverseNum(Integer revNumber){
        integer reverse =0;
        integer lastDigit = 0;
        boolean isNoNegative = revNumber < 0 ? true : false; 
        if(isNoNegative){
            revNumber = revNumber * -1; 
        }
        for(integer i=0; i<=revNumber; i++){
            if(revNumber >= 1){
                lastDigit = Math.mod(revNumber, 10);  
                reverse = reverse * 10 + lastDigit;   
                revNumber = revNumber / 10;  
            }
        }
        if(isNoNegative){
            reverse = reverse * -1;
            System.debug('Reverse Number : ' + reverse);
        }else{
		System.debug('Reverse Number : ' + reverse);            
        }
        
    }
}