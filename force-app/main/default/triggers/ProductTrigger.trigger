//Class - ProductTriggerProdStatusHelper
trigger ProductTrigger on Product__c (before insert, before update, after insert, after update) {
	if (Trigger.isBefore) {
        if (Trigger.isInsert) {
           ProductTriggerProdStatusHelper.setDefaultProductCategory(Trigger.new);
        } else if (Trigger.isUpdate) {
           ProductTriggerProdStatusHelper.preventNameChangeForDiscontinuedProducts(Trigger.new, Trigger.oldMap);
        }
    } else if (Trigger.isAfter) {
        if (Trigger.isInsert) {
            ProductTriggerProdStatusHelper.sendCreationEmail(Trigger.new);
        } else if (Trigger.isUpdate) {
            ProductTriggerProdStatusHelper.sendUpdateEmail(Trigger.new, Trigger.oldMap);
        }
    }
    
//Class - ProductTriggerHelper
	    if (Trigger.isBefore) {
        	if (Trigger.isInsert) {
           ProductTriggerHelper.assignCategoryBasedonPrice(Trigger.new);
            } else if (Trigger.isUpdate) {
            ProductTriggerHelper.preventPriceChange(Trigger.new, Trigger.oldMap);
        }
	}
}