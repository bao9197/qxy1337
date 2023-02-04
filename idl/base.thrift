namespace go base

struct Video {
  1: i64 id // 视频唯一标识
  2: User author // 视频作者信息
  3: string play_url // 视频播放地址
  4: string cover_url // 视频封面地址
  5: i64 favorite_count // 视频的点赞总数
  6: i64 comment_count // 视频的评论总数
  7: bool is_favorite // true-已点赞，false-未点赞
  8: string title // 视频标题
}

struct Comment {
  1: i64 id // 视频评论id
  2: User user // 评论用户信息
  3: string content // 评论内容
  4: string create_date // 评论发布日期，格式 mm-dd
}

struct User {
  1: i64 id // 用户id
  2: string name // 用户名称
  3: optional i64 follow_count // 关注总数
  4: optional i64 follower_count // 粉丝总数
  5: bool is_follow // true-已关注，false-未关注
  6: string avatar //头像url
}

struct BaseResp{
  //基本的状态定义，易于后续做状态码和状态信息校验
  1:i32 status_code // 状态码，0-成功，其他值-失败
  2:optional string status_message // 返回状态描述
}