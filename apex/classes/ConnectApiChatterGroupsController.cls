public with sharing class ConnectApiChatterGroupsController {

    private static final String CHATTER_GROUP_NAME = 'T.Yoshikawa Labs';

    /**
     * コンストラクタ
     */
    public ConnectApiChatterGroupsController() {
    
    }

    /**
     * グループのバナー写真の取得
     */
    @RemoteAction
    public static ConnectApi.BannerPhoto getBannerPhoto() {
        // Chatterグループ情報取得
        CollaborationGroup chatterGroup = getChatterGroup(CHATTER_GROUP_NAME);
        if (String.isEmpty(chatterGroup.Id)) return new ConnectApi.BannerPhoto();
        // 引数に値セット
        String communityId = null;
        String groupId = chatterGroup.Id;
        // グループのバナー写真の取得
        ConnectApi.BannerPhoto result = ConnectApi.ChatterGroups.getBannerPhoto(communityId, groupId);
        return result;
    }

    /**
     * グループのバナー写真のセット
     */
    @RemoteAction
    public static ConnectApi.BannerPhoto setBannerPhoto() {
        // Chatterグループ情報取得
        CollaborationGroup chatterGroup = getChatterGroup(CHATTER_GROUP_NAME);
        if (String.isEmpty(chatterGroup.Id)) return new ConnectApi.BannerPhoto();
        // Chatterファイルの情報取得1
        ContentVersion contentVersion = getContentVersion();
        if (String.isEmpty(contentVersion.Id)) return new ConnectApi.BannerPhoto();
        // Chatterファイルの情報取得2
        ContentDocument contentDocument = getContentDocument(contentVersion.Id);
        if (String.isEmpty(contentDocument.Id)) return new ConnectApi.BannerPhoto();
        // 引数に値セット
        String communityId = null;
        String groupId = chatterGroup.Id;
        String fileId = contentDocument.Id;
        Integer versionNumber = Integer.valueOf(contentVersion.VersionNumber);
        // グループのバナー写真の取得
        // TODO: ERROR - ConnectApi.BannerPhoto cannot be constructed directly outside of a test
        ConnectApi.BannerPhoto result = ConnectApi.ChatterGroups.setBannerPhoto(communityId, groupId, fileId, versionNumber);
        return result;
    }

    /**
     * グループのバナー写真の取得
     */
    @RemoteAction
    public static void deleteBannerPhoto() {
        // Chatterグループ情報取得
        CollaborationGroup chatterGroup = getChatterGroup(CHATTER_GROUP_NAME);
        if (String.isEmpty(chatterGroup.Id)) return;
        // 引数に値セット
        String communityId = null;
        String groupId = chatterGroup.Id;
        // グループのバナー写真の取得
        ConnectApi.ChatterGroups.deleteBannerPhoto(communityId, groupId);
    }

    /**
     * Chatterグループ情報取得
     */
    private static CollaborationGroup getChatterGroup(String groupName) {
        List<CollaborationGroup> results = [SELECT Id FROM CollaborationGroup WHERE Name = 'T.Yoshikawa Labs' LIMIT 1];
        return results.isEmpty() ? new CollaborationGroup() : results[0];
    }

    /**
     * Chatterファイルの情報取得
     */
    private static ContentVersion getContentVersion() {
        List<ContentVersion> results = [SELECT Id,Title,VersionNumber FROM ContentVersion WHERE Title = 'BannerPhotoSample1' ORDER BY VersionNumber DESC LIMIT 1];
        return results.isEmpty() ? new ContentVersion() : results[0];
    }

    /**
     * Chatterファイルの情報取得
     */
    private static ContentDocument getContentDocument(Id parentId) {
        List<ContentDocument> results = [SELECT Id FROM ContentDocument WHERE ParentId =: parentId LIMIT 1];
        return results.isEmpty() ? new ContentDocument() : results[0];
    }
}