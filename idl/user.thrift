namespace go demouser

include "base.thrift"

typedef base.BaseResp BaseResp
typedef base.Video Video
typedef base.User User

struct douyin_user_register_request {
  1: string username (vt.min_size = "1")// 注册用户名，最长32个字符
  2: string password (vt.min_size = "1")// 密码，最长32个字符
}

struct douyin_user_register_response {
  1:BaseResp base_resp
  3: i64 user_id // 用户id
  4: string token // 用户鉴权token
}

struct douyin_user_login_request {
  1: string username (vt.min_size = "1")// 登录用户名
  2: string password (vt.min_size = "1")// 登录密码
}
struct douyin_user_login_response {
  1:BaseResp base_resp
  3: i64 user_id // 用户id
  4: string token // 用户鉴权token
}

struct douyin_user_request {
  1: i64 user_id // 用户id
  2: string token // 用户鉴权token
}
struct douyin_user_response {
  1:BaseResp base_resp
  3: User user // 用户信息
}

struct douyin_publish_action_request {
  1: string token // 用户鉴权token
  2: binary data // 视频数据
  3: string title (vt.min_size = "1")// 视频标题
}
struct douyin_publish_action_response {
  1:BaseResp base_resp
}
struct douyin_publish_list_request {
  1: i64 user_id // 用户id
  2: string token // 用户鉴权token
}
struct douyin_publish_list_response {
  1:BaseResp base_resp
  3: list<Video> video_list // 用户发布的视频列表
}
struct douyin_favorite_list_request {
  1: i64 user_id // 用户id
  2: string token // 用户鉴权token
}
struct douyin_favorite_list_response {
  1:BaseResp base_resp
  3: list<Video> video_list // 用户点赞视频列表
}
struct douyin_user_check_request {
  1:i64 user_id
  2:string token
}
struct douyin_user_check_response{
  1:BaseResp base_resp
}

service UserService{
  douyin_user_register_response UserRegister(1:douyin_user_register_request req)
  douyin_user_login_response UserLogin(1:douyin_user_login_request req)
  douyin_user_check_response CheckUserToken(1:douyin_user_check_request req)
  douyin_user_response GetUserInfo(1:douyin_user_request req)
  douyin_publish_action_response PublishAction(1:douyin_publish_action_request req)
  douyin_publish_list_response GetPublishList(1:douyin_publish_list_request req)
  douyin_favorite_list_response GetFavoriteList(1: douyin_favorite_list_request req)
}