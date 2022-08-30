/* Pending Task ????
 * A positive n digit number X is called a Keith number (or repfigit number) if it is arranged in a special number sequence generated using its digits. 
 * The special sequence has first n terms as digits of x and other terms are recursively evaluated as the sum of previous n terms. 
 * For example, 197, 19, 742, 1537, etc.
 * 
 */
public class KeithNumberExample {
    public static void checkKeithNumber(integer num){
        boolean value = isKeithNumber(num)?true:false;
        if(value){
            System.debug(num + ' is an Keith Number.');  
        }else{
           System.debug(num + ' is not Keith Number.');   
        }
    }
    public static boolean isKeithNumber(integer num){
        List<Integer> terms = new List<Integer>();
        integer temp = num;
        String str = String.valueOf(num);
	  integer digit = str.length();
        integer i, sum;
        for(i=digit-1; i>=0; i--){
           //terms.add(Math.mod(temp, 10));
           terms[i]=Math.mod(temp, 10);
           temp=temp/10;
           //digit++; 
        }
        
        i=digit; sum=0;
        while(sum<num){
            sum = 0;
            for(integer j=1; j<=digit; j++){
                sum=sum+terms[i-j];
            }
            terms[i]=sum;
            System.debug(terms.get(i));
            i++;
        }
        if(sum==num){
            return true;
        }
        return false;
    }
}