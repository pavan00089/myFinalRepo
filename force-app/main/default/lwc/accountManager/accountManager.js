import { LightningElement,wire } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
import  accountList  from '@salesforce/apex/AccountManager1.accountList';
export default class AccountManager extends NavigationMixin (LightningElement) {

    AccountDetails;
    AccountId;
    errorDetails;
    @wire(accountList)
    accountList({error,data})
    {
        if (data)
        {
            console.log('isnside loop');
            this.AccountDetails= data;
        }
       
        else if(error){
            this.errorDetails= error;
        }
    }
    navigateDetails(event){
        this.AccountId = event.target.value;
        this[NavigationMixin.Navigate]({
            type:'standard__recordPage',
            attributes:{
                recordId:this.AccountId,
                objectApiName:'Account',
                actionName:'view'
            }
        });
    }
}