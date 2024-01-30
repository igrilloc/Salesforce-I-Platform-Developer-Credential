public class DailyLeadProcessor implements Schedulable {
    
    Public void execute(SchedulableContext SC) {
     
        List<Lead> lead_Query = [
            SELECT Id 
            FROM Lead 
            WHERE LeadSource = null 
            LIMIT 200
        ]; 

        for (Lead l: lead_Query) {
            l.LeadSource = 'Dreamforce';
            update l;
        }
    }

}