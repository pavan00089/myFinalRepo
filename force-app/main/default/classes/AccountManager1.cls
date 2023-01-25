public with sharing class AccountManager1 {
    @AuraEnabled
    public static List<Account> accountList(){
        try {
            return [Select id,name,AccountSource from Account limit 20 ]; 
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}