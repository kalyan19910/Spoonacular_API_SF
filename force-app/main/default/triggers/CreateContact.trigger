trigger CreateContact on Account (after insert, after update, before insert, before update, before Delete) {
    if(trigger.isAfter){
        if(trigger.isInsert){
//            AccountTriggerHandler.createcontacts(trigger.new);
            AccountTriggerHelper.notifyAccountOwneronInsert(trigger.new);
            
        }
        else if(trigger.isupdate){
            AccountTriggerHelper.notifyOwneronUpdate(trigger.new, trigger.oldMap);
        }
    }

    //AccountLastClosesWonUpdate.updateClosedWonDate(Trigger.new);
    //AccountTriggerHandler.createcontacts(trigger.new);

//Class - AccountRatingTriggerHelper    
	if (Trigger.isAfter) {
        if (Trigger.isInsert) {
            AccountRatingTriggerHelper.notifyAccountOwnerOnInsert(Trigger.new);
        }
        if (Trigger.isUpdate) {
            AccountRatingTriggerHelper.notifyOwnerOnUpdate(Trigger.new, Trigger.oldMap);
            AccountRatingTriggerHelper.notifyRatingChange(Trigger.new, Trigger.oldMap);
        }
    }
//Class - AccountBeforeTriggerHandler    
    if(Trigger.isBefore){
        if (Trigger.isInsert) {
            AccountBeforeTriggerHandler.handleBeforeInsert(Trigger.new);
        }
        else if(Trigger.isUpdate){
            AccountBeforeTriggerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        }
    }
    
// Class - handleBeforDelete
    if(Trigger.isDelete){
        AccountBeforeTriggerHandler.handleBeforDelete(Trigger.old);
    }    
}