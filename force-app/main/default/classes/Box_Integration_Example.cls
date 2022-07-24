public class Box_Integration_Example {
	public String clientId          {set;get;}
    public String clientSecret      {set;get;}
    public String redirectURL       {set;get;}
    public String code              {set;get;}
    public String accessToken       {set;get;}
    public String state             {set;get;}
    //public String scope             {set;get;}
    public String result            {set;get;}
    public String resultRes            {set;get;} 
    
    public Box_Integration_Example(){
        redirectURL = 'https://projects2021com-dev-ed.my.salesforce.com/apex/Box_Response_Page';
    }
    
    public PageReference requestCode(){
        String url ='https://account.box.com/api/oauth2/authorize';
        url = url+'?response_type=code';
        url = url+'&client_id='+clientId;
        url = url+'&redirect_uri='+redirectURL;
        url = url+'&state='+state;
        PageReference page = new PageReference(url);
        System.debug('Url=' +url);
        return page;
    }
    public void readCode(){
        code = Apexpages.currentPage().getParameters().get('code');
    }
    
    public void requestToken(){
        String endPoint = 'https://api.box.com/oauth2/token';
        Http hp = new Http();
        HttpRequest request= new HttpRequest();
        request.setEndpoint(endpoint);
        request.setMethod('POST');
        String body = 'grant_type=authorization_code';
        body = body+'&client_id='+clientId;
        body = body+'&client_secret='+clientSecret;
        body = body+'&code='+code;
        request.setBody(body);
        HttpResponse response = hp.send(request);
        String jsonString = response.getBody(); 
        result = 'Box.com Response : '+jsonString;
        System.JSONParser jp = JSON.createParser(jsonString);
        while(jp.nextToken()!=null){
            if(jp.getText()=='access_token'){
                jp.nextToken();
                accessToken = jp.getText(); 
            }
        }
        
        createFolderOnBox();
    }
    
    public void createFolderOnBox(){
        String endPoint ='https://api.box.com/2.0/folders';
        String body ='{"name": "BoxApp1","parent": {"id": "147144918249"}}';
        
        Http hp = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(endPoint);
        request.setMethod('POST');
        request.setHeader('Authorization','Bearer '+accessToken);
        request.setBody(body);
        HttpResponse response = hp.send(request);
        resultRes = response.getBody();
        System.debug('resultRes==' +resultRes);
            
    }
    
    
}