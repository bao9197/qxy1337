namespace go demovideo

include "base.thrift"

typedef base.BaseResp BaseResp
typedef base.User User
typedef base.Video Video
typedef base.Comment Comment


struct douyin_feed_request {
  1: optional i64 latest_time // 可选参数，限制返回视频的最新投稿时间戳，精确到秒，不填表示当前时间
  2: optional string token // 可选参数，登录用户设置
}

struct douyin_feed_response {
  1:BaseResp base_resp
  3: list<Video> video_list // 视频列表
  4: optional i64 next_time // 本次返回的视频中，发布最早的时间，作为下次请求时的latest_time
}
struct douyin_favorite_action_request {
  1: i64 user_id // 用户id
  2: i64 video_id // 视频id
  3: i32 action_type // 1-点赞，2-取消点赞
}
struct douyin_favorite_action_response {
  1:BaseResp base_resp
}

struct douyin_comment_action_request {
  1: i64 user_id
  2: i64 video_id // 视频id
  3: i32 action_type // 1-发布评论，2-删除评论
  4: optional string comment_text (vt.min_size = "1")// 用户填写的评论内容，在action_type=1的时候使用
  5: optional i64 comment_id // 要删除的评论id，在action_type=2的时候使用
}
struct douyin_comment_action_response {
  1:BaseResp base_resp
  3: optional Comment comment // 评论成功返回评论内容，不需要重新拉取整个列表
}

struct douyin_comment_list_request {
  1: i64 video_id // 视频id
}
struct douyin_comment_list_response {
  1:BaseResp base_resp
  3: list<Comment> comment_list // 评论列表
}
struct douyin_create_video_request{
  1: i64 user_id
  2: binary data // 视频数据
  3: string title (vt.min_size = "1")// 视频标题
}
struct douyin_create_video_response{
  1: BaseResp base_resp
}
struct douyin_query_video_request{
  1: list<i64> video_ids
}
struct douyin_query_video_response{
  1:BaseResp base_resp
  3: list<Video> video_list // 用户发布的视频列表
}
service FeedService{
  douyin_feed_response GetFeedList(1:douyin_feed_request req) //获取视频流列表
  douyin_favorite_action_response FavoriteAction(1:douyin_favorite_action_request req) //用户点赞和取消点赞
  douyin_comment_action_response CommentAction(1:douyin_comment_action_request req) //用户评论
  douyin_comment_list_response GetCommentList(1:douyin_comment_list_request req) //获取某个视频的评论列表
  douyin_create_video_response CreateVideo(1:douyin_create_video_request req) //创建新视频
  douyin_query_video_response MutilGetVideo(1:douyin_query_video_response req) //根据id列表获取多个视频
}