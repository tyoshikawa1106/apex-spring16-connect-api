@isTest
private class ConnectApiTopicsControllerTest {

    private static User testAdminUser = new User(Id = UserInfo.getUserId());
    
    /**
     * ConnectApiTopicsControllerTest
     */
    static testMethod void ConnectApiTopicsControllerTest() {
        
        System.runAs(testAdminUser) {
            Test.startTest();
            
            ConnectApiTopicsController cls = new ConnectApiTopicsController();
            
            Test.stopTest();
        }
    }

    /**
     * postFeedElementTest
     */
    @isTest(SeeAllData=true)
    static void createTopicTest() {
        
        System.runAs(testAdminUser) {

            String prmTopicName = 'Sample Topic';

            Test.startTest();
            
            ConnectApi.Topic result = ConnectApiTopicsController.createTopic(prmTopicName);
            
            Test.stopTest();
        }
    }
}