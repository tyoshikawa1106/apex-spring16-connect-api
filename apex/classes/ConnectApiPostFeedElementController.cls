public with sharing class ConnectApiPostFeedElementController {

    /**
     * コンストラクタ
     */
    public ConnectApiPostFeedElementController() {
    
    }

    /**
     * Chatterフィードにファイル添付
     */
    @RemoteAction
    public static ConnectApi.FeedElement postFeedElement() {

        // Chatterファイル情報取得
        List<ContentDocument> contentDocuments = getContentDocuments();
        if (contentDocuments.isEmpty()) return null;

        // 引数準備
        List<ConnectApi.FileIdInput> fileIdInputs = new List<ConnectApi.FileIdInput>();
        for (ContentDocument c : contentDocuments) {
            ConnectApi.FileIdInput fileIdInput = new ConnectApi.FileIdInput();
            fileIdInput.Id = c.Id;
            fileIdInputs.add(fileIdInput);
        }
        // 引数準備
        ConnectApi.FilesCapabilityInput capability = new ConnectApi.FilesCapabilityInput();
        capability.items = fileIdInputs;
        // 引数準備
        ConnectApi.FeedElementCapabilitiesInput feedElementCapabilitiesInput = new ConnectApi.FeedElementCapabilitiesInput();
        feedElementCapabilitiesInput.files = capability;
        // 引数準備
        String communityId = null;
        // 引数準備
        ConnectApi.FeedElementInput feedElementInput = new ConnectApi.FeedItemInput();
        feedElementInput.subjectId = UserInfo.getUserId();
        feedElementInput.feedElementType = ConnectApi.FeedElementType.FeedItem;
        feedElementInput.capabilities = feedElementCapabilitiesInput;

        // Chatterフィードにファイル添付
        ConnectApi.FeedElement result = ConnectApi.ChatterFeeds.postFeedElement(communityId, feedElementInput);
        return result;
    }

    /**
     * Chatterファイル情報取得
     */
    private static List<ContentDocument> getContentDocuments() {
        return [SELECT Id,Title,FileType FROM ContentDocument WHERE FileType = 'PDF' LIMIT 5];
    }
}