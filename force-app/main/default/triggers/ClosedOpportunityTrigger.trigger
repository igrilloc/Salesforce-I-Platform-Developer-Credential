trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {

    List<Task> listTask = new List<Task>();

    for (Opportunity opp: Trigger.new) {
        if (opp.StageName == 'Closed Won') {
            listTask.add(new Task(Subject = 'Follow Up Test Task', WhatId = opp.Id));
        }
    }

    if (listTask.size() > 0) {
        insert listTask;
    }

}