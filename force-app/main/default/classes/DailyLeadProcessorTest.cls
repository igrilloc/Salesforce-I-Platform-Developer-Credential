@isTest
private class DailyLeadProcessorTest {
	
    @isTest
    static void testDailyLeadProcessor() {
        String CRON_EXP = '0 0 1 * * ?';

        // Asegurarse de que no haya registros existentes con el mismo LastName
        List<Lead> existingLeads = [SELECT Id FROM Lead WHERE LastName LIKE 'Dreamforce%'];
        delete existingLeads;

        // Crear nuevos registros de prueba
        List<Lead> testLeads = new List<Lead>();
        for (Integer i = 0; i < 200; i++) {
            testLeads.add(new Lead(LastName = 'Dreamforce' + i, Company = 'test_DailyLeadProcessor', Status = 'Open - Not Contacted'));
        }

        insert testLeads;
		  
        Test.startTest();

        // Ejecutar el trabajo programado
        String jobId = System.schedule('DailyLeadProcessor', CRON_EXP, new DailyLeadProcessor()); 
        Test.stopTest();

        // Verificar que los registros de Lead se han actualizado correctamente
        List<Lead> updatedLeads = [SELECT Id, LeadSource FROM Lead WHERE LastName LIKE 'Dreamforce%'];
        for (Lead lead : updatedLeads) {
            System.assertEquals('Dreamforce', lead.LeadSource, 'El LeadSource no se actualizó correctamente.');
        }
    }
}
