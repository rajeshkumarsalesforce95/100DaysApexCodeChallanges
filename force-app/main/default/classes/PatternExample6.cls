/*
                 * 
               *  * 
             *  *  * 
           *  *  *  * 
         *  *  *  *  *
       * *  *  *  *  * *
    *  *  *  *  *  *  *  *  
   
 */ 
public class PatternExample6 {
    public static void printPattern(){
       for(integer i=0;i<=6;i++){
            string ptn = '  ';
            for(integer j=0;j<=16;j++){
                if(j>=6-i && j<=6+i ){
                    ptn = ptn + '  *  ';
                }else{
                     ptn = ptn + '_';
                }
            }
            system.debug(ptn);
        
      }
   }
}