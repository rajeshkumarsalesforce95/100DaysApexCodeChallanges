public class XML_Example3 {
    public String xmlString {set;get;}
    public String result {set;get;}
    
    public void convert(){
        Dom.Document doc = new Dom.Document();
        doc.load(xmlString);
        Dom.XmlNode root = doc.getRootElement();
        result = result+'Root Node : '+root.getName();
        List<Dom.XmlNode> childs = root.getChildElements();
        if(childs.size()>0){
            for(Dom.XmlNode c : childs){
                result = result+'\n'+c.getName()+' : '+c.getText();
            }
        }
    }

}