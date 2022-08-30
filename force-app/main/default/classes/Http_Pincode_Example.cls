/* EndPoint : https://api.postalpincode.in/postoffice/Jalore Coll
 * Method   : GET
 * Response : Json
 */ 
public class Http_Pincode_Example {
    public String cityName    {set;get;}
    public Map<String,Object> resMap   {set;get;}
    public String result    {set;get;}
    public fromJSON resSet   {set;get;}
    public String pincode  {set;get;}
    
    public void getInvoke(){
        resMap = new Map<String,Object>(); 
        String endPoint = 'https://api.postalpincode.in/postoffice/'+cityName;
        Http hp = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(endpoint);
        request.setMethod('GET');
        HttpResponse response = hp.send(request);
        result = response.getBody();
        List<String> keys = response.getHeaderKeys();
        for(String s : keys){
            Object obj = response.getHeader(s);
            resMap.put(s,obj);
        }
        
        //resSet = (fromJSON)JSON.deserialize(result,fromJSON.class);
        System.JSONParser jp = JSON.createParser(result);
        while(jp.nextToken()!=null){
            if(jp.getText()=='PINCode'){
                jp.nextToken();
                pincode = jp.getText();
            }
        }
    }
    
    
    public class fromJSON{
            public String Message;	//Number of Post office(s) found:2
            public String Status;	//Success
            public cls_PostOffice[] PostOffice;
    }
    public class cls_PostOffice {
        public String Name;	//Bhinmal
        public cls_Description Description;
        public String BranchType;	//Sub Post Office
        public String DeliveryStatus;	//Delivery
        public String Circle;	//Rajasthan
        public String District;	//Jalor
        public String Division;	//Sirohi
        public String Region;	//Jodhpur
        public String State;	//Rajasthan
        public String Country;	//India
        public String Pincode;	//343029
    }
    public class cls_Description {
    }
    public static fromJSON parse(String json){
        return (fromJSON) System.JSON.deserialize(json, fromJSON.class); 
    }
	
}