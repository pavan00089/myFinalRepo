import { LightningElement,track,api } from 'lwc';

export default class PublicMethodChild extends LightningElement {
    @track value = ['red'];
    options =  
            [
            { label: 'Red Marker', value: 'red' },
            { label: 'Blue Marker', value: 'blue' },
            { label: 'Green Marker', value: 'green' },
            { label: 'Black Marker', value: 'black' }
         ];
  @api
  selectedCheckBox(checkBoxValue)
  {
  const selectedCheckbox=  this.options.find(checkbox => {
        return checkBoxValue===checkbox.value;
    })
    if(selectedCheckbox)
    {
        this.value = selectedCheckbox.value;
        return 'Successfully found'
    }
    return 'Value is not found';
  }  
}