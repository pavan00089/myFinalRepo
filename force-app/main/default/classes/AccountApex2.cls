/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 02-18-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class AccountApex2 {
    public AccountApex2() {

    }
    /**
    * @description 
    * @author ChangeMeIn@UserSettingsUnder.SFDoc | 02-18-2022 
    * @return List<Account> 
    **/
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountList(){
        
        //hello this is pavan
        return [Select id,name from Account limit 10];
        // hi this is pavan
        // thixs is kumar
    }
}