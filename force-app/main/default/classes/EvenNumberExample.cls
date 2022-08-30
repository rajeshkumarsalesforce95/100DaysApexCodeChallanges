/*
 *  Program to Display Even Numbers From 1 to 100
 */ 
public class EvenNumberExample {
    public static void displayEvenNum(integer num){
        for(integer i=0; i<=num; i++){
            if(Math.mod(i, 2)==0){
                //Display Even Number
                System.debug(i);
            }else{
                //Display Odd Number
            }
        }
    }
}