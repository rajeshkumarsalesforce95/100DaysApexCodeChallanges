//program that determines all the automorphic numbers within a specified range.
//
public class AutomorphicNumberExample2 {
    public static void checkAutomorphicNumber(integer start, integer endNum){
        String numberStr = '';
        for(integer i=start; i<=endNum; i++){
            if(isAutomorphicNumber(i)){
                numberStr = numberStr + i + ' '; 
            }
        }
        System.debug(numberStr); 
    }
    
    public static boolean isAutomorphicNumber(integer num){
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
            return true;
        }else{
            return false;
        }
    }
}