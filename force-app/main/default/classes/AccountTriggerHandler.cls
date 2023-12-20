public class AccountTriggerHandler {
    
    public static void CreateAccounts(List<Account> listAccounts) {
        for (Account account : listAccounts) {
            if (account.ShippingState != account.BillingState) {
                account.ShippingState = account.BillingState;
            }
        }
    }

}