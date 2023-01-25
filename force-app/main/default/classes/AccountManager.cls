@RestResource(urlMapping='/Accounts/*/contacts')
global with sharing class AccountManager {

@HttpGet
global static Account getAccount() {
        
 		RestRequest request = RestContext.request;
        //  grab the caseId from the end of the URL
        String accountId = request.requestURI.subStringBetween('Accounts/','/contacts');
      Account result =   [SELECT ID,Name,(SELECT Id,FirstName,LastName FROM contacts) from Account where Id=:accountId];
        return result;
    }
}