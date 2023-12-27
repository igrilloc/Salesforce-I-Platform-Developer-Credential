@isTest
private class DailyLeadProcessorTest {
	
    static testMethod void testDailyLeadProcessor() {
		
        String CRON_EXP = '0 0 1 * * ?';
		List<Lead> list_Lead = new List<Lead>();
	    
        for (Integer i = 0; i < 200; i++) {
			list_Lead.add(new Lead(LastName = 'Dreamforce' + i, Company = 'test_DailyLeadProcessor', Status = 'Open - Not Contacted'));
		}

		insert list_Lead;
		  
		Test.startTest();
		String jobId = System.schedule('DailyLeadProcessor', CRON_EXP, new DailyLeadProcessor()); 
	}
}