public class JSONToken_Example5 {
	public String jsonString {set;get;}
    public Map<String, Object> resultMap {set;get;}
    public Integer value {set;get;}
    public Account acc {set;get;}
    
    public JSONToken_Example5(){
        jsonString = '{"FirstName":"Rajesh","LastName":"Kumar","Age":10,"Account":{"Name":"Salesforce.com","Rating":"Hot","Phone":"123-45657"}}';
        System.JSONParser parser = JSON.createParser(jsonString);
        resultMap = new Map<String, Object>(); 
        while(parser.nextToken()!=null){
            String key = parser.getText();
            //resultMap.put(key,parser.getCurrentToken());
            if(Key =='Age'){
                parser.nextToken();
                value = (Integer)parser.getIntegerValue();
            }
            
            if(Key=='Account'){
                parser.nextToken();
                acc = (Account)parser.readValueAs(Account.class);
            }
        }
    }
}