@isTest
global class Dummy_Response_Test implements HttpCalloutMock{
    global Httpresponse respond(HttpRequest request){
        System.assertEquals(request.getEndpoint(), 'https://www.rajeshkumar.in/page');
        System.assertEquals(request.getMethod(), 'GET');
        HttpResponse res = new Httpresponse();
        res.setStatus('OK');
        res.setBody('Wipro');
        return res;
    }
}