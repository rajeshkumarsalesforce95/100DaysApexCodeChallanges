/* Requirments    : Who is my service provider, Location of IP
 * Protocol       : Http
 * EndPoint       : http://xml.utrace.de/?query='+ipAddress
 * Method         : GET
 * Authentication : No auth required because it is open
 * Header         : No header
 * Data           : ipAddress
 */
public class HttpIpAddressTrace {
    public String result {set;get;}
    public Map<String,Object> resMap {set;get;}
    public String ipAddress {set;get;}
    
    public void traceMe1(){ 
        resMap = new Map<String,Object>();
        Http hp = new Http();
        HttpRequest request = new HttpRequest();
        String endPoint = 'http://xml.utrace.de/?query='+ipAddress; //223.238.150.207';//+ipAddress; 
        request.setEndpoint(endpoint);
        request.setMethod('GET');
        HttpResponse response = hp.send(request);
        result = response.getBody();
        if(response.getStatusCode()==200){ 
            Dom.Document doc = new Dom.Document();
            doc.load(result);
            Dom.XmlNode root = doc.getRootElement();
            List<Dom.XmlNode> child = root.getChildElements();
            List<Dom.XmlNode> subChilds = child[0].getChildElements();
            
            for(Dom.XmlNode node : subChilds){
                if(node.getText()!='' && node.getText()!=null){
                    resMap.put(node.getName(), node.getText());
                    
                }
            }
        }
    }
}