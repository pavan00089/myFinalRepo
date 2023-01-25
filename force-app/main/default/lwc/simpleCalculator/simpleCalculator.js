import { LightningElement,track } from 'lwc';

export default class SimpleCalculator extends LightningElement {

    @track currentResult;
    firstNumber;
    secodNumber;
    @track previousResult = [];
    @track showPreviousResult = false;
    numberChageHandler(event)
    {
        const inputBoxName = event.target.name;
        if(inputBoxName === 'firstNumber')
        {
            this.firstNumber = parseInt(event.target.value);
        }
        else if(inputBoxName === 'secondNumber')
        {
            this.secodNumber = parseInt(event.target.value);
        }
    }
    displayResult(event)
    {
        const buttonName = event.target.name;
        if(buttonName === 'add')
        {
            this.currentResult = `Result of ${this.firstNumber} + ${this.secodNumber} is ${this.firstNumber+this.secodNumber}`;
            this.previousResult.push(this.currentResult);
        }
        else if(buttonName === 'Subtract')
        {
            this.currentResult = `Result of ${this.firstNumber} - ${this.secodNumber} is ${this.firstNumber-this.secodNumber}`;
            this.previousResult.push(this.currentResult);
        }
        else if(buttonName === 'Multiply')
        {
            this.currentResult = `Result of ${this.firstNumber} * ${this.secodNumber} is ${this.firstNumber*this.secodNumber}`;
            this.previousResult.push(this.currentResult);
        }
        else if(buttonName === 'Divide')
        {
            this.currentResult = `Result of ${this.firstNumber} / ${this.secodNumber} is ${this.firstNumber/this.secodNumber}`;
            this.previousResult.push(this.currentResult);
        }
    }
    showPreviousResultHandler(event)
    {
        this.showPreviousResult = event.target.checked;
    }
}