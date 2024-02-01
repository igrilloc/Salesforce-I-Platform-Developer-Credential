public class RandomContactFactory {
    
    public static List<Contact> generateRandomContacts(Integer numContactsToGenerate, string First_Name) {
        
        List<Contact> contactList = new List<Contact>();
        
        for (Integer i = 0;  i < numContactsToGenerate; i++) {
            Contact newContact = new Contact(FirstName = First_Name + ' ' + i, LastName = 'Contact ' + i);
            contactList.add(newContact);
            System.debug(newContact);
        }
        
        System.debug(contactList.size());
        return contactList;
    }
}