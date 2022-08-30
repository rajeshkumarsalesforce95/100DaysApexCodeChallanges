/*
*  Author           : Rajesh Kumar @infosys.com
*  Description      : Program to add two matrices
*  Created Date     : 29/08/2022
*  LastModifiedDate : 29/08/2022
*  Change Logs#     : 
*/
public with sharing class MatrixAdditionExample {
    public MatrixAdditionExample() {
        /*
           TODOs : 1st Matrix
        */
        List<Integer> arrayList1 = new List<Integer>{1,3,4};
        List<Integer> arrayList2 = new List<Integer>{2,4,3};
        List<Integer> arrayList3 = new List<Integer>{3,4,5};
        List<List<Integer>> matrix1 = new List<List<Integer>>{arrayList1, arrayList2, arrayList3};
        /*
           TODOs : 2nd Matrix
        */
        List<Integer> arrayList11 = new List<Integer>{1,3,4};
        List<Integer> arrayList22 = new List<Integer>{2,4,3};
        List<Integer> arrayList33 = new List<Integer>{3,4,5};
        List<List<Integer>> matrix2 = new List<List<Integer>>{arrayList11, arrayList22, arrayList33};
        /*
           TODOs : 3rd Matrix
        */
        List<List<Integer>> matrix3 = new List<List<Integer>>();
        List<Integer> addArrayList = new List<Integer>();
        for(Integer i=0; i<3; i++){
            for(Integer j=0; j<3; j++){
                addArrayList.add(matrix1[i][j] + matrix2[i][j]);
            }
            matrix3.add(addArrayList);
            System.debug(matrix3);
            addArrayList.clear();
        }
        
    }
}