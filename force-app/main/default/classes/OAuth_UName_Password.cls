/* EndPoint  : https://login.salesforce.com/services/oauth2/token
 * Method    : POST
 * Parameters : grant_type=password&client_id&client_secret&username&password
 *        
 * 
 * 
 * 
 */
public class OAuth_UName_Password {
    public String clientId   {Set;Get;}
    public String clientSecret {set;get;}
    public String username   {set;get;}
    public String password    {set;get;}
    public String accessToken  {set;get;}
    public String result   {set;get;}
    public String endPoint  {set;get;}
    public String token {set;get;}
    public String instanceUrl {set;get;}
    public String industry {set;get;}
    public String result1   {set;get;}
    public List<String> names {set;get;}
   
    
    public OAuth_UName_Password(){
        endPoint = 'https://login.salesforce.com/services/oauth2/token';
    }
    
    public void sendRequest(){
        Http hp = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(endPoint);
        request.setMethod('POST');
        String body='grant_type=password'; 
        body = body+'&client_id='+clientId;
        body = body+'&client_secret='+clientSecret;
        body = body+'&username='+username;
        body = body+'&password='+password;
        request.setBody(body);
        HttpResponse response = hp.send(request);
        result = response.getBody();
        
        //deserilaztion data
        System.JSONParser jp = JSON.createParser(result);
        while(jp.nextToken()!=null){
            if(jp.getText()=='access_token'){
                jp.nextToken();
                accessToken=jp.getText();
            }
            if(jp.getText()=='instance_url'){
                jp.nextToken();
                instanceUrl=jp.getText();
            }
        }
        
        if(accessToken!=null && instanceUrl!=null){
            token = 'access_token : '+accessToken+', \n instance_url : '+instanceUrl;
        }
        
    }
    
    public void invoke(){
        String endPoint = 'https://projects2021com-dev-ed.my.salesforce.com/services/apexrest/createAccount?Industry='+industry;
        Http hp = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(endpoint);
        request.setMethod('GET');
        request.setHeader('Authorization', 'OAuth ' + accessToken);
        HttpResponse response = hp.send(request);
        result1 = response.getBody();
        System.JSONParser jp = JSON.createParser(result1);
        names = new List<String>();
        while(jp.nextToken()!=null){
            if(jp.getText()=='Accounts'){
                jp.nextToken();
                
                names =(List<String>)jp.readValueAs(List<String>.class);
            }
        }
        
        System.debug('Names :' +names);
    }
}