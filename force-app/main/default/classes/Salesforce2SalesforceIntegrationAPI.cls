//Salesforce to Salesforce Inetegration using REST API in VF Page
public class Salesforce2SalesforceIntegrationAPI {
    public static void getAccessToken(){
        HttpRequest req=new HttpRequest();
        req.setEndpoint('https://login.salesforce.com/services/oauth2/token?');
        req.setMethod('POST');
        String CLIENT_ID = '3MVG9fe4g9fhX0E6Y6DbjGJpiiFLJZMQ2qvpURA_DlLusQC9IsGNqQs0sGi4Wks.Ya_uBhmeBVNRCE4M.kvRf';
        String CLIENT_SECRET = '0DDDA3957CD7B8BE512A453512DFBAE989E774FFEAD522812AAFD752729716D9';
        String USERNAME = 'rajesh@recruitingapp.com';
        String PASSWORD = 'Admin@1095';
        
        req.setBody('grant_type=password' + '&client_id='+CLIENT_ID + 
                    '&client_secret='+CLIENT_SECRET + '&username='+USERNAME + '&password='+PASSWORD);
        Http http=new Http();
        HttpResponse res=new HttpResponse();
        res=http.send(req);
        System.debug('response-->: '+res.getBody());
        Oauth objAuthInfo=(Oauth)JSON.deserialize(res.getBody(), Oauth.class);
        System.debug(objAuthInfo);
        if(objAuthInfo.access_token!=null){
            try{ 
                HttpRequest req1=new HttpRequest();
                req1.setEndpoint('https://innovexsoftwaretechnologie8-dev-ed.my.salesforce.com/services/apexrest/innovexsoft/GetAccount/v1/0015g00000CIhfh');
                req1.setMethod('GET');
                req1.setHeader('Authorization','Bearer '+objAuthInfo.access_token);
                Http http1=new Http();
                HttpResponse res1=new HttpResponse();
                res1=http1.send(req1);
                System.debug('Status -->: '+res1.getStatusCode());
                System.debug('Account Info-->: '+res1.getBody());
               
                Account obj1=(Account)JSON.deserialize(res1.getBody(), Account.class);
                obj1.id=null;
                insert obj1;
                System.debug('Account---->insert: : '+obj1);
            }catch(Exception ex){
                System.debug('Exception :: ' +ex.getMessage() + ' Line Number :: ' + ex.getLineNumber());
            }
        }
    }
    
    public class Oauth{
      public String access_token {get;set;}
      public String instance_url {get;set;}
      public String id {get;set;}
      public String token_type {get;set;} 
      public String issued_at {get;set;}
      public String signature {get;set;}
    }  
}