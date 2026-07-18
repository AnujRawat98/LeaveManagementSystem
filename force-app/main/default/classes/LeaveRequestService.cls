public with sharing class LeaveRequestService {

    public static void updateLeaveBalance(List<Leave_Request__c> leaveRequests) {

        for (Leave_Request__c leaveRequest : leaveRequests) {

            if (leaveRequest.Status__c == 'Approved') {

                Employee__c employee = [
                    SELECT Id, Used_Leaves__c
                    FROM Employee__c
                    WHERE Id = :leaveRequest.Employee__c
                ];

                employee.Used_Leaves__c =
                    employee.Used_Leaves__c + leaveRequest.Total_Leave_Days__c;

                update employee;
            }
        }
    }
}