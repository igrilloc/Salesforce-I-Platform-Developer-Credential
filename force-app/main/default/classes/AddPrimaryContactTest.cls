@isTest
public class AddPrimaryContactTest {
    
    @isTest 
    static void TestList() {
        
        List<Account> list_Account = new List <Account>();
         
        for (Integer i = 0; i < 50; i++) {
            list_Account.add(new Account(BillingState = 'CA', name = 'Test ' + i));
        }
         
        for (Integer j = 0; j < 50; j++) {
            list_Account.add(new Account(BillingState = 'NY', name = 'Test ' + j));
        }
         
        insert list_Account;

        Contact newContact = new Contact();
        newContact.FirstName='Ignacio';
        newContact.LastName ='Caimary';

        insert newContact;
         
        String state = 'CA';
      
        AddPrimaryContact primaryContact = new AddPrimaryContact(newContact, state);
          
        Test.startTest();
            System.enqueueJob(primaryContact);
        Test.stopTest();
    }

}