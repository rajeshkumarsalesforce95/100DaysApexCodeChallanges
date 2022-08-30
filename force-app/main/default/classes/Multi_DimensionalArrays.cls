/*
 * Multi-dimensional arrays are arrays of arrays with each element of the array holding the reference of other arrays. 
 * A multi-dimensional array is created by appending one set of square brackets ([]) per dimension.
 */ 
public class Multi_DimensionalArrays {
    public static void printMultiDCArrays(){
        integer [] arr = new integer[10];//single Dimensional Array
        //Here, the row size is 7, and the column size is 2
        //The 0th index stores the Max temperature and 1st index stores the Min temperature
        //integer[][] dayWiseTemperature = new integer[2][2];    
        //dayWiseTemperature[0][0]=29; // Initialization 
        //dayWiseTemperature[0][1]=21;
        //and so on
        //Another way of creating and initializing 2D array 
        //integer [][] dayWiseTemperature1 = new integer[][] {{29,21},{24,23},{26,22},{28,23},{29,24},{23,20},{29,21}};
        
        //Updating an element of a 2D array 
        //dayWiseTemperature[2][0]=33;
        //Displaying value of an element of a 2D array 
        //System.out.println(dayWiseTemperature[2][0]); 
    }
}