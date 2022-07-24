/*
      *                           *
      *  *                      * *
      *  * *                  * * *
      *  * * *              * * * *
      *  * * * *          * * * * * 
      *  * * * * *      * * * * * *
      *  * * * * * *  * * * * * * *
      
 */ 
public class PatternExample5 {
    public static void printPattern(){
        for(integer i=1 ; i<=7; i++){
            string ptn='';
            string ptn1=' ';
            for(integer j=1; j<=7; j++){
                if(j<=i){
                    ptn = ptn + ' * ';
                }else{
                    
                }
                if(j>=8-i){
                    ptn1 = ptn1 + ' * ';
                }else{
                    ptn1 = ptn1 + '  -  ';
                }
            }
            system.debug(ptn +' '+ ptn1);
        }
    }
}