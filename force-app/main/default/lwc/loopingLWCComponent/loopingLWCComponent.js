import { LightningElement,track,wire } from 'lwc';
import getAccountList from '@salesforce/apex/AccountApex2.getAccountList';
export default class LoopingLWCComponent extends LightningElement {
@track contactList = [{Id:1 ,Name:'Pavan',title:'SFDC'},
                      {Id:2 ,Name:'Raghu',title:'HR Department'},
                      {Id:3 ,Name:'Munni',title:'Home Department'} ];
@wire(getAccountList) accounts;
}