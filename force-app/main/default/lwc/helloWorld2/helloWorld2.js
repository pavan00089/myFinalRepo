import { LightningElement,track } from 'lwc';

export default class HelloWorld2 extends LightningElement {
  @track  dynamicGreeting = 'World';
  greetingHandler(event)
  {
    this.dynamicGreeting = event.target.value;
  }
}