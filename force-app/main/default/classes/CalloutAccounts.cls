/*Testing a single HTTP callout*/
public class CalloutAccounts {
    public static List<Account> getAccounts() {
        HttpRequest req = new HttpRequest();
        req.setEndpoint('http://api.example.com/accounts');
        req.setMethod('GET');
        Http h = new Http();
        HttpResponse res = h.send(req);
        String jsonData = res.getBody();
        List<Account> accounts =
            (List<Account>)JSON.deserialize(jsonData, List<Account>.class);
        return accounts;
    }
}