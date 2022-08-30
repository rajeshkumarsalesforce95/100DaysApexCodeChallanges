/*
 * A number N is said to be a mystery number if the number can be expressed by the sum of two numbers. 
 * Note that these two numbers must be reverse of each other.
 */ 
public class MysteryNumberExample {
    public static void checkMysteryNumber(integer inputNumber){
        if(isMysteryNumber(inputNumber)){
            System.debug(inputNumber + ' is an Mystery Number.');
        }else{
            System.debug(inputNumber + ' is Not Mystery Number.');
        }
    }
    public static boolean isMysteryNumber(integer inputNumber){
        for(integer i=1; i<=inputNumber/2; i++){
            integer j = reverse(i);
            if(i+j == inputNumber){
                return true;
            }
        }
	  return false;        
    }
    public static integer reverse(integer num){
        String str = String.valueOf(num);
        List<String> strList = str.split('');
        String str1 = '';
        for(integer i=strList.size()-1; i>=0; i--){
            str1 = str1 + strList.get(i);
        }
        integer rev = Integer.valueOf(str);
        return rev;
    }
}