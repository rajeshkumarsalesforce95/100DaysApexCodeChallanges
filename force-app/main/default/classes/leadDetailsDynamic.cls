public class leadDetailsDynamic {
	Lead ld;
    public leadDetailsDynamic(ApexPages.StandardController controller) {
        ld = (Lead)controller.getRecord();
        ld = [SELECT firstName,lastName,Company,Email FROM lead WHERE id =: ld.id];
    }
    
    public Component.Apex.PageBlockSection getLeadSection(){
        Component.Apex.PageBlockSection outSection = new Component.Apex.PageBlockSection();
        if(ld.firstName != null){
            Component.Apex.OutputText firstName = new Component.Apex.OutputText();
            firstName.value = ld.firstName;
            firstName.label = 'First Name';
            outSection.childComponents.add(firstName);
        }
        
        if(ld.lastName != null){
            Component.Apex.OutputText lastName = new Component.Apex.OutputText();
            lastName.value = ld.lastName ;
            lastName.label = 'Last Name ';
            outSection.childComponents.add(lastName);
        }
        
        if(ld.Company != null){
            Component.Apex.OutputText company = new Component.Apex.OutputText();
            company.value = ld.Company;
            company.label = 'Company';
            outSection.childComponents.add(company);
        }
        
        if(ld.email != null){
            Component.Apex.OutputText email = new Component.Apex.OutputText();
            email.value = ld.email;
            email.label = 'Email';
            outSection.childComponents.add(email);
        }
        
        return outSection;
    }
}