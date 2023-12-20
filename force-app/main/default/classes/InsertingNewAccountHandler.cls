public class InsertingNewAccountHandler {

    public static Account insertNewAccount(String AccountName) {
        try {
            
            Account acct = new Account(Name = AccountName);
            insert acct;
            return acct;
        
        } catch (DMLException error) {
            
            System.debug('A DML exception has occurred: ' + error.getMessage());
            return null;
            
        }
    }

}