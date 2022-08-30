/*
 * Program to print the duplicate elements of an array
 */ 
public class DuplicateElementArray {
    public static void findDuplicateElement(){
        integer [] arr = new integer[]{1,2,3,4,2,7,8,8,3};
        System.debug('Duplicate elements in given array: ');
        String printDuplicateElements = '';
        for(integer i=0; i<arr.size(); i++){
            for(integer j=i+1; j<arr.size(); j++){
                if(arr[i]==arr[j]){
                    printDuplicateElements = printDuplicateElements + arr[j] + ',';
                }
            }    
       }
        
       // Print Duplicate Elements
       printDuplicateElements.removeEnd(',');
       System.debug(printDuplicateElements);
    }
}