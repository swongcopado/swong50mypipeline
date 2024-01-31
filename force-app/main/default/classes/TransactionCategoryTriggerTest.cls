@isTest
private class TransactionCategoryTriggerTest {
    
    @isTest static void testSmallCategory() {
        // Create a transaction with an amount less than 100
        Transaction__c txn = new Transaction__c(Amount__c = 99);
        Test.startTest();
        insert txn;
        Test.stopTest();
        
        // Retrieve the inserted transaction
        txn = [SELECT Category__c FROM Transaction__c WHERE Id = :txn.Id];
        // Assert that the Category is set to 'Small'
        System.assertEquals('Small', txn.Category__c);
    }
    
    @isTest static void testMediumCategory() {
        // Create a transaction with an amount between 100 and 500
        Transaction__c txn = new Transaction__c(Amount__c = 250);
        Test.startTest();
        insert txn;
        Test.stopTest();
        
        // Retrieve the inserted transaction
        txn = [SELECT Category__c FROM Transaction__c WHERE Id = :txn.Id];
        // Assert that the Category is set to 'Medium'
        System.assertEquals('Medium', txn.Category__c);
    }
    
    @isTest static void testLargeCategory() {
        // Create a transaction with an amount greater than 500
        Transaction__c txn = new Transaction__c(Amount__c = 501);
        Test.startTest();
        insert txn;
        Test.stopTest();
        
        // Retrieve the inserted transaction
        txn = [SELECT Category__c FROM Transaction__c WHERE Id = :txn.Id];
        // Assert that the Category is set to 'Large'
        System.assertEquals('Large', txn.Category__c);
    }
}