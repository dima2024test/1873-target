public class AccountBatch implements Database.Batchable<SObject> {
    
    
    public Database.QueryLocator start(Database.BatchableContext BC) {
        return Database.getQueryLocator([SELECT Id, Name FROM Account]);
    }

   
    public void execute(Database.BatchableContext BC, List<SObject> scope) {
       
        for (SObject record : scope) {
            Account acc = (Account)record;
            acc.Name += ' -  Processed Test'; 
        }
        
        update scope;
    }

    public void finish(Database.BatchableContext BC) {
       
        System.debug(1/0);
    }
}