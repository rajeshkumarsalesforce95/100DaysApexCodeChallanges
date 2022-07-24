/* Using the Math.random() Method
 We can also use the following formula if we want to a generate random number between a specified range.
 formula -> Math.random() * (max - min + 1) + min
*/  

public class GenerateRandomNumberExample {
    public static void printRandomNum(integer min, integer max){
        integer randomNum = (integer)(Math.random() * (max - min + 1) + min);
        System.debug('Random Number : ' + randomNum);
    }
}