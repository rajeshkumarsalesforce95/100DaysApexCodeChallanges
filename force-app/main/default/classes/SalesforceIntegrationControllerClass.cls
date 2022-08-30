// Salesforce to Salesforce Inetegration using REST API in VF Page
// 
public class SalesforceIntegrationControllerClass {
    public String clientId     {set;get;}
    public String clientSecret     {set;get;}
    public String redirectURL     {set;get;}
    public String username     {set;get;}
    public String password     {set;get;}
    public String code     {set;get;}
    public String accessToken     {set;get;}
    public String state     {set;get;}
    public String scope     {set;get;}
    public String result     {set;get;}
    
    public SalesforceIntegrationControllerClass(){
        redirectURL='https://projects2021com-dev-ed.my.salesforce.com/apex/Salesforce_Response_Page';
    }
    
    public void requestToken(){
        String endPoint = 'https://login.salesforce.com/services/oauth2/token?';
        Http hp = new Http();
        HttpRequest request= new HttpRequest();
        request.setEndpoint(endpoint);
        request.setMethod('POST');
        String body = 'grant_type=password';
        body = body+'&client_id='+clientId;
        body = body+'&client_secret='+clientSecret;
        body = body+'&code='+code;
        body = body+'&username=+'+username;
        body = body+'&password='+password;
        request.setBody(body);
        HttpResponse response = hp.send(request);
        String jsonString = response.getBody(); 
        
        System.JSONParser jp = JSON.createParser(jsonString);
        while(jp.nextToken()!=null){
            if(jp.getText()=='access_token'){
                jp.nextToken();
                accessToken = jp.getText();
                System.debug('Token : ' +accessToken);
            }
        }
        if(accessToken!=null){
            try{ 
                HttpRequest req1=new HttpRequest();
                req1.setEndpoint('https://innovexsoftwaretechnologie8-dev-ed.my.salesforce.com/services/apexrest/innovexsoft/GetAccount/v1/0015g00000CIhfh');
                req1.setMethod('GET');
                req1.setHeader('Authorization','Bearer '+accessToken);
                Http http1=new Http();
                HttpResponse res1=new HttpResponse();
                res1=http1.send(req1);
                System.debug('Status -->: '+res1.getStatusCode());
                System.debug('Account Info-->: '+res1.getBody());
                result = res1.getBody();
            }catch(Exception ex){
                System.debug('Exception :: ' +ex.getMessage() + ' Line Number :: ' + ex.getLineNumber());
            }
        }
    }
    
}