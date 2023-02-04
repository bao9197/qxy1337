package main

import (
	"context"
	demouser "douyin/kitex_gen/demouser"
)

// UserServiceImpl implements the last service interface defined in the IDL.
type UserServiceImpl struct{}

// UserRegister implements the UserServiceImpl interface.
func (s *UserServiceImpl) UserRegister(ctx context.Context, req *demouser.DouyinUserRegisterRequest) (resp *demouser.DouyinUserRegisterResponse, err error) {
	// TODO: Your code here...
	return
}

// UserLogin implements the UserServiceImpl interface.
func (s *UserServiceImpl) UserLogin(ctx context.Context, req *demouser.DouyinUserLoginRequest) (resp *demouser.DouyinUserLoginResponse, err error) {
	// TODO: Your code here...
	return
}

// CheckUserToken implements the UserServiceImpl interface.
func (s *UserServiceImpl) CheckUserToken(ctx context.Context, req *demouser.DouyinUserCheckRequest) (resp *demouser.DouyinUserCheckResponse, err error) {
	// TODO: Your code here...
	return
}

// GetUserInfo implements the UserServiceImpl interface.
func (s *UserServiceImpl) GetUserInfo(ctx context.Context, req *demouser.DouyinUserRequest) (resp *demouser.DouyinUserResponse, err error) {
	// TODO: Your code here...
	return
}

// PublishAction implements the UserServiceImpl interface.
func (s *UserServiceImpl) PublishAction(ctx context.Context, req *demouser.DouyinPublishActionRequest) (resp *demouser.DouyinPublishActionResponse, err error) {
	// TODO: Your code here...
	return
}

// GetPublishList implements the UserServiceImpl interface.
func (s *UserServiceImpl) GetPublishList(ctx context.Context, req *demouser.DouyinPublishListRequest) (resp *demouser.DouyinPublishListResponse, err error) {
	// TODO: Your code here...
	return
}

// GetFavoriteList implements the UserServiceImpl interface.
func (s *UserServiceImpl) GetFavoriteList(ctx context.Context, req *demouser.DouyinFavoriteListRequest) (resp *demouser.DouyinFavoriteListResponse, err error) {
	// TODO: Your code here...
	return
}
