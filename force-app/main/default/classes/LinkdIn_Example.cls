public class LinkdIn_Example {
    public String clientId     {set;get;}
    public String clientSecret     {set;get;}
    public String redirectURL     {set;get;}
    public String code     {set;get;}
    public String accessToken     {set;get;}
    public String state     {set;get;}
    public String scope     {set;get;}
    public String result     {set;get;}
    public String result1     {set;get;}
    public String firstName     {set;get;}
    public String lastName     {set;get;}
    public String fullName     {set;get;}
    
    public LinkdIn_Example(){
        redirectURL='https://projects2021com-dev-ed.my.salesforce.com/apex/LinkdIn_Response_Page';
    }
    
    public PageReference requestCode(){
        String url ='https://www.linkedin.com/oauth/v2/authorization';
        url = url+'?response_type=code';
        url = url+'&client_id='+clientId;
        url = url+'&redirect_uri='+redirectURL;
        url = url+'&state='+state;
        url = url+'&scope='+scope;
        PageReference page = new PageReference(url);
        System.debug('Url=' +url);
        return page;
    }
    
    public void readCode(){
        code = Apexpages.currentPage().getParameters().get('code');
    }
    
    public void requestToken(){
        String endPoint = 'https://www.linkedin.com/oauth/v2/accessToken';
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
        }
        
        getdata();
    }
    
    public void getdata(){
        String endpoint ='https://api.linkedin.com/v2/me';
        Http hp = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(endpoint);
        request.setMethod('GET');
        request.setHeader('Authorization','Bearer '+accessToken);
        HttpResponse response = hp.send(request);
        result = response.getBody();
        result1 = 'LinkdIn Response : '+result; 
        System.JSONParser jp = JSON.createParser(result);
        while(jp.nextToken()!=null){
            if(jp.getText()=='Rajesh'){
                firstName = jp.getText();
                jp.nextToken();
            }
            if(jp.getText()=='Kumar'){
                lastName = jp.getText();
                jp.nextToken();
            }
            
        }
        fullName ='Profile Name : '+firstName +' '+ lastName;
        
    }

}