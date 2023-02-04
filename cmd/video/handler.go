package main

import (
	"context"
	demovideo "douyin/kitex_gen/demovideo"
)

// VideoServiceImpl implements the last service interface defined in the IDL.
type VideoServiceImpl struct{}

// GetFeedList implements the VideoServiceImpl interface.
func (s *VideoServiceImpl) GetFeedList(ctx context.Context, req *demovideo.DouyinFeedRequest) (resp *demovideo.DouyinFeedResponse, err error) {
	// TODO: Your code here...
	return
}

// FavoriteAction implements the VideoServiceImpl interface.
func (s *VideoServiceImpl) FavoriteAction(ctx context.Context, req *demovideo.DouyinFavoriteActionRequest) (resp *demovideo.DouyinFavoriteActionResponse, err error) {
	// TODO: Your code here...
	return
}

// CommentAction implements the VideoServiceImpl interface.
func (s *VideoServiceImpl) CommentAction(ctx context.Context, req *demovideo.DouyinCommentActionRequest) (resp *demovideo.DouyinCommentActionResponse, err error) {
	// TODO: Your code here...
	return
}

// GetCommentList implements the VideoServiceImpl interface.
func (s *VideoServiceImpl) GetCommentList(ctx context.Context, req *demovideo.DouyinCommentListRequest) (resp *demovideo.DouyinCommentListResponse, err error) {
	// TODO: Your code here...
	return
}

// CreateVideo implements the VideoServiceImpl interface.
func (s *VideoServiceImpl) CreateVideo(ctx context.Context, req *demovideo.DouyinCreateVideoRequest) (resp *demovideo.DouyinCreateVideoResponse, err error) {
	// TODO: Your code here...
	return
}

// MutilGetVideo implements the VideoServiceImpl interface.
func (s *VideoServiceImpl) MutilGetVideo(ctx context.Context, req *demovideo.DouyinQueryVideoResponse) (resp *demovideo.DouyinQueryVideoResponse, err error) {
	// TODO: Your code here...
	return
}
