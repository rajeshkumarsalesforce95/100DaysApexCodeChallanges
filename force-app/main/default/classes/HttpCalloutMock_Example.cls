public class HttpCalloutMock_Example {
    public void call(){
        String endPoint = 'https://www.rajeshkumar.in/page';
        Http hp = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(endpoint);
        request.setMethod('GET');
        HttpResponse response = hp.send(request);
        String result = response.getBody();
        Account acc = new Account();
        acc.name = result;
        acc.Industry = 'Banking';
        insert acc;
    }
}