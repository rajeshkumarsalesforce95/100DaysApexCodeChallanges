// How to Print ASCII Value in Apex

public class PrintAsciiValueExample {
    public static void main(String str){
        for(integer i=0; i<str.length(); i++){
            System.debug('Char Value : ' + str.charAt(i)); 
        }
    }
}