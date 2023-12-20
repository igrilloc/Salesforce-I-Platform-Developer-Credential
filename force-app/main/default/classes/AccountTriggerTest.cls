@isTest
public class AccountTriggerTest {

    @isTest static void TestInsertRecords() {
        List<Account> listAccounts = new List<Account>();
        
        for (Integer i = 0; i < 200; i++) {
            Account accounts = new Account(Name = 'Test' + i, BillingState = 'CA');

            listAccounts.add(accounts);
        }
        
        Test.startTest();
            insert listAccounts;
        Test.stopTest();

        List<Account> TestAccount = [SELECT ShippingState FROM Account];

        for (Account account : TestAccount) {
            System.assertNotEquals('CA', account.ShippingState, 'Incorrect Shipping State');
        }

    }

}