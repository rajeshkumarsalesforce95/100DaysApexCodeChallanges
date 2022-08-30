/*
*  Author           : Rajesh Kumar @infosys.com
*  Description      : Program to right rotate the elements of an array. An array is said to be right rotated, 
*                     if all elements of the array are moved to its right by 3rd position.
*  Created Date     : 27-Aug-22
*  LastModifiedDate : 27-Aug-22
*  Change Logs#     : 
*/
public with sharing class PrintRightRotateArray {
    public PrintRightRotateArray() {
        integer [] rotateArray = new integer [] {1,2,3,4,5,6,7};
        integer num = 3;
        String printOriginalArray = '';
        String printRoateArray = '';
        System.debug('==== ORIGINAL ARRAY ======');
        for(integer i=0; i<rotateArray.size(); i++){
            printOriginalArray = printOriginalArray + rotateArray[i] + ' ';
        }
        System.debug(printOriginalArray);
        
        for(integer i=0; i<num; i++){
            integer lastElement;
            lastElement = rotateArray[rotateArray.size()-1];
            for(integer j=rotateArray.size()-1; j>0; j--){
                rotateArray[j] = rotateArray[j-1];
            }

            rotateArray[0] = lastElement;   
        }

        System.debug('==== ROTATED ARRAY ====');
        for (integer i=0; i<rotateArray.size(); i++) {
            printRoateArray = printRoateArray + rotateArray[i] + ' ';
        }

        System.debug(printRoateArray);
    }
}