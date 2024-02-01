@isTest
private class TestRestrictContactByName {
    static testMethod void restrictContact() {
    
        List<Contact> listContact= new List<Contact>();

        Contact c1 = new Contact(FirstName = 'Ignacio', LastName = 'Grillo', email = 'igrilloc@gmail.com');
        Contact c2 = new Contact(FirstName = 'Ignacio', LastName = 'Grillo Caimary', email = 'ignaciogrillocaimary@gmail.com');
        
        listContact.add(c1);
        listContact.add(c2);
        
        Test.startTest();
            try {
                insert listContact;
            } catch (Exception error) {
                System.debug('Exception error: -' + error.getMessage());
            }
        Test.stopTest();       
    }  
}