@isTest
global class BulkAPIMock implements HttpCalloutMock {
    // Implement this interface method
    global HTTPResponse respond(HTTPRequest request) {
        // Create a fake response
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        response.setBody('{ "id" : "750B0000009aLc9"}');
        response.setStatusCode(200);
        return response; 
    }
}