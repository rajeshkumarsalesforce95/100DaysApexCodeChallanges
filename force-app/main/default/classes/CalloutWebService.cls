public class CalloutWebService {
    public static void callout(){
        // Get Data from a Service
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        if(response.getStatusCode() == 200) {
            // Deserialize the JSON string into collections of primitive data types.
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            // Cast the values in the 'animals' key as a list
            List<Object> animals = (List<Object>) results.get('animals');
            System.debug('Received the following animals:');
            for(Object animal: animals) {
                System.debug(animal);
            }
        }
        
        // Send Data to a Service
        Http http1 = new Http();
        HttpRequest request1 = new HttpRequest();
        request1.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        request1.setMethod('POST');
        request1.setHeader('Content-Type', 'application/json;charset=UTF-8');
        // Set the body as a JSON object
        request.setBody('{"name":"mighty moose"}');
        HttpResponse response1 = http1.send(request1);
        // Parse the JSON response
        if(response1.getStatusCode() != 201) {
            System.debug('The status code returned was not expected: ' + response1.getStatusCode() + ' ' + response1.getStatus());
        } else {
            System.debug(response.getBody());
        }
    }

}