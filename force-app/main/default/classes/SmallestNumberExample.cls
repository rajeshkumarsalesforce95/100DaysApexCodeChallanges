/*
 * Program to Find Smallest of Three Numbers using if-else condition
 */
public class SmallestNumberExample {
    public static void findNumber(Integer num1, integer num2, Integer num3){
        if(num1<num2 && num1<num3){
            System.debug('The smallest number is: ' + num1);
        }else if(num2<num1 && num2<num3){
            System.debug('The smallest number is: ' + num2);
        }else if(num3<num1 && num3<num2){
            System.debug('The smallest number is: ' + num3);
        }else{
            System.debug('The numbers are same.');
        }
        
    }
}