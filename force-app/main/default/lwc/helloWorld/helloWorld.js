import { LightningElement } from 'lwc';
export default class HelloWorld extends LightningElement {
    message = 'Hello World...!';
    changemessage(){
        this.message = 'Welcome to Ligntning Web Component...!';
    }
}