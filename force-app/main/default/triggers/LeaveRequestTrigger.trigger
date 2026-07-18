trigger LeaveRequestTrigger on Leave_Request__c (after insert, after update) {
    LeaveRequestService.updateLeaveBalance(Trigger.new);
}