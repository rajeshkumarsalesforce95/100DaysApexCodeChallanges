/*
 *    1
	2 2
	3 3 3
	4 4 4 4
	5 5 5 5 5
	6 6 6 6 6 6
 */ 
public class PatternExample2 {
	public static void printPattern(){
        for(integer i=1;i<=6;i++){
            string ptn='';
            for(integer j=1;j<=i;j++){
                ptn=ptn+i;
            }
        system.debug(ptn);
        }
    }
}