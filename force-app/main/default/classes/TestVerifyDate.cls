@isTest
public class TestVerifyDate {
    static testMethod void test_Method() {
        Date d1 = VerifyDate.CheckDates(System.today(), System.today() + 1);
        Date d2 = VerifyDate.CheckDates(System.today(), System.today() + 60);
    }
}