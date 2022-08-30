public class GenerateAccessTokenController {
    public String clientId     {set;get;}
    public String clientSecret     {set;get;}
    public String redirectURL     {set;get;}
    public String code     {set;get;}
    public String accessToken     {set;get;}
    public String refreshToken     {set;get;}
    public String result     {set;get;}
    
    public GenerateAccessTokenController(){
        redirectURL='https://projects2021com-dev-ed.my.salesforce.com/apex/GenerateCode_Response_Page';
    }
    
    public PageReference requestCode(){
        String url ='https://projects2021com-dev-ed.my.salesforce.com/services/oauth2/authorize';
        url = url+'?response_type=code';
        url = url+'&client_id='+clientId;
        url = url+'&redirect_uri='+redirectURL;
        PageReference page = new PageReference(url); 
        System.debug('Url=' +url);
        return page;
    }
    
    public void readCode(){
        code = Apexpages.currentPage().getParameters().get('code');
    }
    
    public void requestToken(){
        String endPoint = 'https://projects2021com-dev-ed.my.salesforce.com/services/oauth2/token';
        Http hp = new Http();
        HttpRequest request= new HttpRequest();
        request.setEndpoint(endpoint);
        request.setMethod('POST');
        String body = 'grant_type=authorization_code';
        body = body+'&client_id='+clientId;
        body = body+'&client_secret='+clientSecret;
        body = body+'&code='+code;
        body = body+'&redirect_uri='+redirectURL;
        request.setBody(body);
        HttpResponse response = hp.send(request);
        String jsonString = response.getBody(); 
        
        System.JSONParser jp = JSON.createParser(jsonString);
        while(jp.nextToken()!=null){
            if(jp.getText()=='access_token'){
                jp.nextToken();
                accessToken = jp.getText();
            }
            if(jp.getText()=='refresh_token'){
                jp.nextToken();
                refreshToken = jp.getText();
            }
        }
    }
}