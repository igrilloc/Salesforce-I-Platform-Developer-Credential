public class ContactSearch {
    
    public static List<Contact> searchForContacts(String lastName, String postalCode) {
        
        List<Contact> listContacts = [
            SELECT Id, Name
            FROM Contact
            WHERE LastName =:lastName and MailingPostalCode =:postalCode
        ];

        return listContacts;

    }
    
}