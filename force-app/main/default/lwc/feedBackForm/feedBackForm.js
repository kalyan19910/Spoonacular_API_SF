import { LightningElement } from 'lwc';
export default class FeedBackForm extends LightningElement {
    name ='';
    feedback = '';
    phone = '';
    handleNameChange(event) {
        this.name = event.target.value;
    }
    handleFeedbackChange(event) {
        this.feedback = event.target.value;
    }
    handlePhoneChange(event) {
        this.phone = event.target.value;
    }
}