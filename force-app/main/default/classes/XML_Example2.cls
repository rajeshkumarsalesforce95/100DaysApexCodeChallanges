/*<?xml version="1.0" encoding="UTF-8"?>
<Student>
	<Name>
		<FirstName>Rajesh</FirstName>
		<LastName>Kumar</LastName>
	</Name>
	<Age>30</Age>
	<Address City="Hyd" State="TG" Pin="123-4444" />
</Student>*/
public class XML_Example2 {
	public String result {set;get;}
    public XML_Example2(){
        Dom.Document doc = new Dom.Document();
        Dom.XmlNode root = doc.createRootElement('Student',null,null);
        Dom.XmlNode name = root.addChildElement('Name',null,null);
        Dom.XmlNode fname = name.addChildElement('FirstName',null,null);
        fname.addTextNode('Rajesh');
        Dom.XmlNode lname = name.addChildElement('LastName',null,null);
        lname.addTextNode('Kumar');
        Dom.XmlNode age = root.addChildElement('Age',null,null);
		age.addTextNode('30');   
        Dom.XmlNode city = root.addChildElement('Address',null,null);
        city.setAttribute('City', 'Hyd');
        city.setAttribute('State', 'TG');
        city.setAttribute('Pin', '123-4444');
        
        
        result = doc.toXmlString();
    }
}