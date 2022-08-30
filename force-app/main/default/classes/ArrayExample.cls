/*
 * Program to copy all elements of one array into another array
 */ 
public class ArrayExample {
    public static void copyArrays(){
        
        integer [] arr1 = new Integer [] {5,8,10,12,96,95,38};
        integer [] arr2 = new Integer [arr1.size()];
        
        for(Integer i=0; i<arr1.size(); i++){
            arr2[i] = arr1[i];
        }
        
        System.debug(arr2);
    }
}