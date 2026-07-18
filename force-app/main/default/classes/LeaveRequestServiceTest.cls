@isTest
public class LeaveRequestServiceTest {

    @isTest
    static void testUpdateLeaveBalance() {

        Employee__c emp = new Employee__c(
            Name = 'Test Employee',
            Total_Leaves__c = 20,
            Used_Leaves__c = 0
        );
        insert emp;

        Leave_Request__c leaveRequest = new Leave_Request__c(
            Employee__c = emp.Id,
            Start_Date__c = Date.today(),
            End_Date__c = Date.today().addDays(2),
            Status__c = 'Approved'
        );

        insert leaveRequest;

        Employee__c updatedEmp = [
            SELECT Used_Leaves__c
            FROM Employee__c
            WHERE Id = :emp.Id
        ];

        System.assertEquals(3, updatedEmp.Used_Leaves__c);
    }
}