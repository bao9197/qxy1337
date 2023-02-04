CREATE TABLE `user`
(
    `id`         bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
    `username`   varchar(128) NOT NULL DEFAULT '' COMMENT '用户名',
    `password`   varchar(128) NOT NULL DEFAULT '' COMMENT '密码',
    `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '用户创建时间',
    `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '用户最近一次更新信息的时间',
    `follow_count` INT unsigned NOT NULL DEFAULT 0 COMMENT '关注人数',
    `follower_count` INT unsigned NOT NULL DEFAULT 0 COMMENT '粉丝人数',
    `avatar` varchar(128) NOT NULL DEFAULT '' COMMENT '用户头像的url',
    PRIMARY KEY (`id`),
    KEY          `idx_username` (`username`) COMMENT '用户名索引'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户表';

CREATE TABLE `video`
(
    `id`         bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
    `user_id`    int(64) NOT NULL DEFAULT 0 COMMENT '视频的作者id',
    `title`      varchar(128) NOT NULL DEFAULT '' COMMENT '视频标题',
    `play_url` varchar(128) NOT NULL DEFAULT '' COMMENT '视频播放地址',
    `cover_url` varchar(128) NOT NULL DEFAULT '' COMMENT '视频封面地址',
    `favorite_count` int unsigned NOT NULL DEFAULT 0 COMMENT '喜欢该视频的人数',
    `comment_count` int unsigned NOT NULL DEFAULT 0 COMMENT '评论数',
    `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '视频创建时间',
    `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最近一次视频信息修改时间',
    PRIMARY KEY (`id`),
    KEY  `idx_user_id` (`user_id`) COMMENT '作者id索引'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='视频表';

CREATE TABLE `1_comment`
(
    `id`         bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
    `user_id`    int(64) NOT NULL DEFAULT 0 COMMENT '评论者id',
    `video_id`   int(64) NOT NULL DEFAULT 0 COMMENT '视频id',
    `content`    varchar(256) NULL COMMENT '评论内容',
    `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '视频创建时间',
    `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最近一次视频信息修改时间',
    `parent_id`  int(64) unsigned COMMENT '上级评论',
    PRIMARY KEY (`id`),
    KEY  `idx_video_id` (`video_id`) COMMENT '视频id索引'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='评论表';

CREATE TABLE `1_favorite`
(
    `user_id` int(64) NOT NULL DEFAULT 0 COMMENT '用户id',
    `video_id` int(64) NOT NULL DEFAULT 0 COMMENT '视频id',
    `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '视频创建时间',
    KEY `idx_user_video_id` (`user_id`,`video_id`) COMMENT '用户-视频 索引'
)