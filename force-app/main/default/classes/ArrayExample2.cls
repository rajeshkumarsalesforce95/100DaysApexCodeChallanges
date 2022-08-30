/*
 *  Program to left rotate the elements of an array
 */ 
public class ArrayExample2 {
    public static void rotateArray(){
        integer [] arr = new integer [] {1, 2, 3, 4, 5};
        integer num = 3;
        String printRotateArray='';
        for(integer i=0; i<num; i++){
             integer j, first;
             first = arr[0]; 
            for(j=0; j<arr.Size()-1; j++){
                arr[j] = arr[j+1];
            }
            arr[j] = first;
        }
        
        System.debug('Array after left rotation: ');
        for(integer i=0; i<arr.size(); i++){
            printRotateArray = printRotateArray + arr[i] + ' ';
        }
        System.debug(printRotateArray);
    }
}