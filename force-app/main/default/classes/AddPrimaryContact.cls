public class AddPrimaryContact implements Queueable {
    
    private Contact newContact;
    private String state;
    
    public AddPrimaryContact(Contact newContact, String state) {
        this.newContact = newContact;
        this.state = state;
    }
    
    public void execute(QueueableContext context) {
         
        List<Account> list_Accounts = [
            SELECT ID, Name, (SELECT id, FirstName, LastName FROM contacts)
            FROM ACCOUNT 
            WHERE BillingState =:state 
            LIMIT 200
        ];

        List<Contact> list_Contacts = new List<Contact>();
         
        for (Account acc: list_Accounts) {
            Contact contactCloned = newContact.clone(false, false, false, false);
            contactCloned.AccountId = acc.id;
            list_Contacts.add(contactCloned);
        }
         
        if (list_Contacts.size() > 0) {
            insert list_Contacts;
        }
             
    }

}