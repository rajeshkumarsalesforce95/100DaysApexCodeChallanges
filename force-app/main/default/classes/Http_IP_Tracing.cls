/* Requirments    : Who is my service provider, Location of IP
 * Protocol       : Http
 * EndPoint       : http://xml.utrace.de/?query='+ipAddress
 * Method         : GET
 * Authentication : No auth required because it is open
 * Header         : No header
 * Data           : ipAddress
 */

public class Http_IP_Tracing {
    public String ipAddress    {set;get;}
    public String result       {set;get;}
    public List<String> headers  {set;get;}
    public Map<String,Object> resMap {set;get;}
    public Map<String,Object> xmlMap {set;get;}
    
    public void traceIPAddress(){
        Http hp = new Http();
        String endPoint = 'http://xml.utrace.de/?query='+ipAddress;
        HttpRequest request = new HttpRequest();
        request.setEndpoint(endpoint);
        request.setMethod('GET');
        HttpResponse res = hp.send(request);
        headers = res.getHeaderKeys();
        resMap = new Map<String,Object>();
        //Take one by one key from the response header and get thier value and put them in Map
        for(String key : headers){
            Object obj = res.getHeader(key);
            resMap.put(key,obj);
        } 
        result = res.getBody();
        xmlMap = new Map<String,Object>();
        Dom.Document doc = new Dom.Document();
        doc.load(result);
        Dom.XmlNode root = doc.getRootElement();
        List<Dom.XmlNode> childs = root.getChildElements();
        List<Dom.XmlNode> subChilds = childs[0].getChildElements();
        //take one by one child element from the result and get thier name and value.
        for(Dom.XmlNode sc : subChilds){
            if(sc.getText()!=''){
                xmlMap.put(sc.getName(), sc.getText());
            }
        }
    }
}