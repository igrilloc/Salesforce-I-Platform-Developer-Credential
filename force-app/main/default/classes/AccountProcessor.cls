public class AccountProcessor {
    
    @future
    public static void countContacts(List<Id> listAccountsId) {

        List<Account> listAccounts = [
            SELECT Id, Name
            FROM Account
            WHERE Id IN :listAccountsId
        ];

        List<Account> updatedListAccounts = new List<Account>();

        for (Account acc : listAccounts) {
            
            acc.Number_Of_Contacts__c = [
                SELECT count()
                FROM Contact
                WHERE AccountId =: acc.Id
            ];

            System.debug('Num Of Contacts: ' + acc.Number_Of_Contacts__c);
            updatedListAccounts.add(acc);
        }

        update updatedListAccounts;
    }

}