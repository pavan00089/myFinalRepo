import { LightningElement,track,api } from 'lwc';

export default class PublicMethodParent extends LightningElement {
@track value;
slectCheckboxHandler()
{
    const childComponent = this.template.querySelector('c-public-method-child');
    const returnMessageValue = childComponent.selectedCheckBox(this.value);
    console.log(returnMessageValue);
}
inputChangeHandler(event)
{
    this.value = event.target.value;
}
}