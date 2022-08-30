public class Facebook_Example {
	public String clientId         {set;get;}
    public String clientSecret     {set;get;}
    public String redirectURL      {set;get;}
    public String code             {set;get;}
    public Static String accessToken     {set;get;}
    public String result          {set;get;}
    public static Facebook_Credentials__c fbSettings = Facebook_Credentials__c.getInstance(); 
    
    public void Facebook_Example(){
        redirectURL = 'https://projects2021com-dev-ed.my.salesforce.com/apex/Facebook_Response_Page';
    }
    
    public Static void getAccessToken(){
        
        String endPoint ='https://graph.facebook.com/oauth/access_token';
        endPoint = endPoint+'?client_id='+fbSettings.App_ID_Client_Id__c;
        endPoint = endPoint +'&client_secret='+fbSettings.App_Secret_Client_Secret__c;
        endPoint = endPoint+'&grant_type=client_credentials';
            
        
        Http hp = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(endpoint);
        request.setMethod('GET');
        HttpResponse response = hp.send(request);
        String result = response.getBody();
        System.debug('Result : ' +result);
        System.JSONParser jp = JSON.createParser(result);
        while(jp.nextToken()!=null){
            if(jp.getText()=='access_token'){
                jp.nextToken();
                accessToken = jp.getText();
            }
        }
        System.debug('Access Toke : ' +accessToken);
        getFacebookData();
    }
    
    public static void getFacebookData(){
        String endPoint = 'https://graph.facebook.com/'+fbSettings.Facebook_Id__c;
        endPoint = endPoint+'?fields=id,name,website,posts';
        endPoint = endPoint+'&access_token='+accessToken;
		
        Http hp = new Http();
        HttpRequest request = new Httprequest();
        request.setEndpoint(endpoint);
        request.setMethod('GET');
        HttpResponse response = hp.send(request);
        String resultRes=response.getBody();
        System.debug('resultRes=' +resultRes);
    }
    
   
    
}