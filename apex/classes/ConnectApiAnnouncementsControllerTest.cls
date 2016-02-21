@isTest
private class ConnectApiAnnouncementsControllerTest {

    private static User testAdminUser = new User(Id = UserInfo.getUserId());
    
    /**
     * ConnectApiAnnouncementsControllerTest
     */
    static testMethod void ConnectApiAnnouncementsControllerTest() {

        System.runAs(testAdminUser) {
            Test.startTest();
            
            ConnectApiAnnouncementsController cls = new ConnectApiAnnouncementsController();
            
            Test.stopTest();
        }
    }

    /**
     * getAnnouncementsTest
     */
    static testMethod void getAnnouncementsTest() {
        System.runAs(testAdminUser) {
            Test.startTest();
            
            ConnectApi.AnnouncementPage result = ConnectApiAnnouncementsController.getAnnouncements();
            
            Test.stopTest();
        }
    }

    /**
     * postAnnouncementTest
     */
    static testMethod void postAnnouncementTest() {
        System.runAs(testAdminUser) {
            Test.startTest();
            
            ConnectApiAnnouncementsController.postAnnouncement();
            
            Test.stopTest();
        }
    }
}