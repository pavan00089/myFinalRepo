import { LightningElement,track } from 'lwc';

export default class ConditionalDisplayComponent extends LightningElement {
@track displayDiv = false;
@track cityList = ['Hyderabad','Chennai','Bengaluru','Delhi'];

displayDivHandler(event)
{
    this.displayDiv = event.target.checked;
}
}