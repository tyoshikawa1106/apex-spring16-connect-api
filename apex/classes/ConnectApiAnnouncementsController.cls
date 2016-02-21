public with sharing class ConnectApiAnnouncementsController {
    
    private static final String CHATTER_GROUP_NAME = 'T.Yoshikawa Labs';
    private static final String POST_MESSAGE = 'ConnectAPIからお知らせ投稿!!';
    
    /**
     * コンストラクタ
     */
    public ConnectApiAnnouncementsController() {
        
    }
    
    /**
     * お知らせ情報の取得
     */
    @RemoteAction
    public static ConnectApi.AnnouncementPage getAnnouncements() {
        // Chatterグループ情報取得
        CollaborationGroup chatterGroup = getChatterGroup(CHATTER_GROUP_NAME);
        if (String.isEmpty(chatterGroup.Id)) return new ConnectApi.AnnouncementPage();
        // 引数に値セット
        Id communityId = null;
        Id parentId = chatterGroup.Id;
        // お知らせ取得処理実行
        ConnectApi.AnnouncementPage result = ConnectApi.Announcements.getAnnouncements(communityId, parentId);
        return result;
    }

    /**
     * お知らせ情報の投稿
     */
    @RemoteAction
    public static ConnectApi.Announcement postAnnouncement() {
        // Chatterグループ情報取得
        CollaborationGroup chatterGroup = getChatterGroup(CHATTER_GROUP_NAME);
        if (String.isEmpty(chatterGroup.Id)) return new ConnectApi.Announcement();
        // 引数の準備
        String communityId = null;
        
        // 引数の準備 (feedItemIdをセットしない場合はセット)
        ConnectApi.TextSegmentInput textSegmentInput = new ConnectApi.TextSegmentInput();
        textSegmentInput.text = POST_MESSAGE;
        // 引数の準備 (feedItemIdをセットしない場合はセット)
        ConnectApi.MessageBodyInput messageBodyInput = new ConnectApi.MessageBodyInput();
        messageBodyInput.messageSegments = new List<ConnectApi.MessageSegmentInput>();
        messageBodyInput.messageSegments.add(textSegmentInput);

        // Chatterフィードに投稿(bodyを用意しない場合はセット)
        //ConnectApi.FeedElement feedElement = ConnectApi.ChatterFeeds.postFeedElement(
        //                                         Network.getNetworkId()
        //                                        ,chatterGroup.Id
        //                                        ,ConnectApi.FeedElementType.FeedItem
        //                                        ,POST_MESSAGE
        //                                    );
        
        // 引数の準備
        ConnectApi.AnnouncementInput announcement = new ConnectApi.AnnouncementInput();
        announcement.body = messageBodyInput;
        announcement.parentId = chatterGroup.Id;
        announcement.expirationDate = Datetime.now().addYears(1);
        announcement.isArchived = false;
        
        //announcement.sendEmails = false;           // 設定不要
        //announcement.feedItemId = feedElement.Id; // bodyを用意しない場合はセット
        
        // お知らせ投稿処理実行
        ConnectApi.Announcement result = ConnectApi.Announcements.postAnnouncement(communityId, announcement);
        return result;
    }

    /**
     * Chatterグループ情報取得
     */
    private static CollaborationGroup getChatterGroup(String groupName) {
        List<CollaborationGroup> results = [SELECT Id FROM CollaborationGroup WHERE Name = 'T.Yoshikawa Labs' LIMIT 1];
        return results.isEmpty() ? new CollaborationGroup() : results[0];
    }
}