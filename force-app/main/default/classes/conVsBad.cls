public class conVsBad {
    public Contact con;
    public Contact getContactMethod1(){
        if(con==null){
            con = [select id,name from Contact limit 1];
        }
        return con;
    }
    public Contact getContactMethod2(){
        return con;
    }
}