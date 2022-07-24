@isTest
global class Create_Fake_Response implements HttpCalloutMock{
    global HttpResponse respond(Httprequest request){
        System.assertEquals(request.getEndpoint(),'https://www.capitalinfosol.com/create');
        System.assertEquals(request.getMethod(), 'GET');
        String jsonString = '{"lastName":"Kumar","firstName":"Rajesh","phone":"9358529110"}';
        HttpResponse res = new HttpResponse();
        res.setBody(jsonString);
        return res;
    }
}