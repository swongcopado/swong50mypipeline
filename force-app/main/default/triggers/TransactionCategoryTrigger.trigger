trigger TransactionCategoryTrigger on Transaction__c (before insert, before update) {
    for (Transaction__c txn : Trigger.new) {
        if (txn.Amount__c < 100) {
            txn.Category__c = 'Small';
        } else if (txn.Amount__c >= 100 && txn.Amount__c <= 500) {
            txn.Category__c = 'Medium';
        } else if (txn.Amount__c > 500) {
            txn.Category__c = 'Large';
        }
    }
}