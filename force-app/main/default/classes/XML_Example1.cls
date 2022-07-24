public class XML_Example1 {
    public String result {set;get;}
    public XML_Example1(){
        Dom.Document doc = new Dom.Document();
        result = doc.toXmlString();
    }

}