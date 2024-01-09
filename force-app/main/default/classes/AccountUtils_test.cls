@isTest
private class AccountUtils_test {

    @isTest
    static void testAccountsByState() {
        // Arrange
        // Crear una cuenta de prueba con el estado especificado
        Account testAccount = new Account(Name = 'Test Account', BillingState = 'CA');
        insert testAccount;

        // Act
        Test.startTest();
            List<Account> result = AccountUtils.accountsByState('CA');
        Test.stopTest();

        // Assert
        // Verificar que la lista de cuentas devuelta contiene la cuenta de prueba
        System.assertEquals(1, result.size(), 'La cantidad de cuentas no es la esperada');
        System.assertEquals(testAccount.Id, result[0].Id, 'La cuenta devuelta no es la esperada');
    }
}