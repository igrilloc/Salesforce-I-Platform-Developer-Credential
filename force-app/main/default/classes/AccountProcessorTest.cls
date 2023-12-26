@isTest
public class AccountProcessorTest {

    @isTest
    public static void test_NumOfContacts() {

        Account newAccount = new Account();
        newAccount.Name = 'Test Account';
        insert newAccount;

        Contact newContact = new Contact();
        newContact.FirstName = 'Ignacio';
        newContact.LastName = 'Caimary';
        newContact.AccountId = newAccount.Id;

        Contact newContact2 = new Contact();
        newContact2.FirstName = 'Ivan';
        newContact2.LastName = 'Schmitt';
        newContact2.AccountId = newAccount.Id;

        List<Id> listAccountsId = new List<Id>();
        listAccountsId.add(newAccount.Id);
        
        Test.startTest();
            AccountProcessor.countContacts(listAccountsId);
        Test.stopTest();

    }

}