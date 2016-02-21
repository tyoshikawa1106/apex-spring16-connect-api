@isTest
private class ConnectApiChatterGroupsControllerTest {

    private static User testAdminUser = new User(Id = UserInfo.getUserId());
    
    /**
     * ConnectApiChatterGroupsControllerTest
     */
    static testMethod void ConnectApiChatterGroupsControllerTest() {
        
        System.runAs(testAdminUser) {
            Test.startTest();
            
            ConnectApiChatterGroupsController cls = new ConnectApiChatterGroupsController();
            
            Test.stopTest();
        }
    }

    /**
     * getBannerPhotoTest
     */
    static testMethod void getBannerPhotoTest() {
        
        System.runAs(testAdminUser) {
            Test.startTest();
            
            ConnectApi.BannerPhoto result = ConnectApiChatterGroupsController.getBannerPhoto();
            
            Test.stopTest();
        }
    }

    /**
     * setBannerPhotoTest
     */
    static testMethod void setBannerPhotoTest() {
        
        System.runAs(testAdminUser) {
            Test.startTest();
            
            ConnectApi.BannerPhoto result = ConnectApiChatterGroupsController.setBannerPhoto();
            
            Test.stopTest();
        }
    }

    /**
     * deleteBannerPhotoTest
     */
    static testMethod void deleteBannerPhotoTest() {
        
        System.runAs(testAdminUser) {
            Test.startTest();
            
            ConnectApiChatterGroupsController.deleteBannerPhoto();
            
            Test.stopTest();
        }
    }
}