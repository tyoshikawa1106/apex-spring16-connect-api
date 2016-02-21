@isTest
private class ConnectApiPostFeedElementControllerTest {

    private static User testAdminUser = new User(Id = UserInfo.getUserId());
    
    /**
     * ConnectApiPostFeedElementControllerTest
     */
    static testMethod void ConnectApiPostFeedElementControllerTest() {
        
        System.runAs(testAdminUser) {
            Test.startTest();
            
            ConnectApiPostFeedElementController cls = new ConnectApiPostFeedElementController();
            
            Test.stopTest();
        }
    }

    /**
     * postFeedElementTest
     */
    static testMethod void postFeedElementTest() {
        
        System.runAs(testAdminUser) {
            Test.startTest();
            
            ConnectApi.FeedElement result = ConnectApiPostFeedElementController.postFeedElement();
            
            Test.stopTest();
        }
    }
}