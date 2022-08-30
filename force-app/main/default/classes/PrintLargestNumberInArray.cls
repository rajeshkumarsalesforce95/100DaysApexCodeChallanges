/*
*  Author           : Rajesh Kumar @infosys.com
*  Description      : Program to find Largest Number in an Array
*  Created Date     : 27/08/2022 11:12 am
*  LastModifiedDate : 27/08/2022 11:12 am
*  Change Logs#     : 
*/
public with sharing class PrintLargestNumberInArray {
    public PrintLargestNumberInArray() {
        List<Integer> arrList = new List<Integer>{44,66,99,77,33,22,55};
        arrList.sort();
        system.debug('Largest Number :: ' + arrList.get(arrList.size()-1));

    }
}