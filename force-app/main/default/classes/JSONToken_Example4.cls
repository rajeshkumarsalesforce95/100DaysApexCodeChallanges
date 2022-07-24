public class JSONToken_Example4 {
    public String jsonString {set;get;}
    public Map<String, Object> resultMap {set;get;}
    public Integer value {set;get;}
    public Account acc {set;get;}
    
    public JSONToken_Example4(){
        jsonString = '{"FirstName":"Rajesh","LastName":"Kumar","Age":10,"Account":{"Name":"Salesforce.com","Rating":"Hot","Phone":"123-45657"}}';
        System.JSONParser parser = JSON.createParser(jsonString);
        resultMap = new Map<String, Object>(); 
        while(parser.nextToken()!=null){
            String key = parser.getText();
            resultMap.put(key,parser.getCurrentToken());
        }
    }

}