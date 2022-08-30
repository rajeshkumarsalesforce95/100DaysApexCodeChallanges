public class OAuth_Code_Format_Example {
    public String clientId {set;get;}
    public String clientSecret {set;get;}
    public String code {set;get;}
    public String redirectURL {set;get;}
    public String accessToken {set;get;}
    public String result {set;get;}
    public String endPoint {set;get;}
    
    public OAuth_Code_Format_Example(){
        redirectURL = 'https://projects2021com-dev-ed.my.salesforce.com/apex/RestResponse';
    }
    
    public PageReference requestCode(){
        String url = 'https://login.salesforce.com/services/oauth2/authorize';
        url =url+'?response_type=code';
        url = url+'&client_id='+clientId;
        url = url+'&redirect_uri='+redirectUrl;
        PageReference page = new PageReference(url);
        return page;
    }
    
    public void readCode(){
        code = Apexpages.currentPage().getParameters().get('code');
    }
    
    public void requestToken(){
        endPoint = 'https://login.salesforce.com/services/oauth2/token';
        Http hp =new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(endpoint);
        request.setMethod('POST');
        String body = 'grant_type=authorization_code'; 
        body = body+'&client_id='+clientId;
        body = body+'&client_secret='+clientSecret;
        body = body+'&redirect_uri='+redirectUrl;
        body = body+'&code='+code;
        request.setBody(body);
        HttpResponse response = hp.send(request);
        String result = response.getBody();
        System.JSONParser jp = JSON.createParser(result);
        while(jp.nextToken()!=null){
            if(jp.getText()=='access_token'){
                jp.nextToken();
                accessToken=jp.getText();
            }
        }
    }
  
}