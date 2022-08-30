/* Print all the Armstrong number.
  Example - 
  1 : (1)^1
  2 : (2)^1
  3 : (3)^1
153 : (1)^3 + (5)^3 + (3)^3 = 1 + 125+ 27 = 153 (Armstrong Number)
125: (1)^3 + (2)^3 + (5)^3 = 1 + 8 + 125 = 134 (Not an Armstrong Number) */

public class ArmstrongExample1 {
    public static void printArmstrongNumber(Integer armstrongNumber){
        String printSeries = '';
        for(Integer i=0; i<=armstrongNumber; i++){
            if(isArmstrong(i)){
                printSeries = printSeries + i + ', '; 
            }
        }
        printSeries.removeEnd(',');
        System.debug(printSeries);
    }
    public static boolean isArmstrong(Integer num){
        integer temp, digits=0, last=0, sum=0;
        temp = num;
        while(temp>0){   
		temp = temp/10;    
		digits++;   
	  }   
	  temp = num;   
	  while(temp>0){    
	     last = Math.mod(temp, 10); //temp % 10;   
	     sum = sum + (Integer)(Math.pow(last, digits));     
	     temp = temp/10;
	  }
        
        if(num==sum){
            return true;
        }else{
            return false;
        }
    }
}