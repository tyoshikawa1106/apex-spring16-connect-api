public with sharing class ConnectApiTopicsController {

    /**
     * コンストラクタ
     */
    public ConnectApiTopicsController() {
        
    }

    /**
     * トピックの作成
     */
    @RemoteAction
    public static ConnectApi.Topic createTopic(String prmTopicName) {
        // 引数に値セット
        String communityId = null;
        String topicName = prmTopicName;
        String description = 'ConnectApi.Topics createTopic!!';
        // トピックの作成
        ConnectApi.Topic result = ConnectApi.Topics.createTopic(communityId, topicName, description);
        return result;
    }
}