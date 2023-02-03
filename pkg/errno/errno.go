package errno

import (
	"errors"
	"fmt"
)

const (
	SuccessCode                = 0
	ServiceErrCode             = 10001  //服务器错误
	ParamErrCode               = 10002  //请求参数错误
	UserAlreadyExistErrCode    = 11001  //用户名已存在
	AuthorizationFailedErrCode = 11002  //用户验证失败 如输入的密码有误 等
	UserNotExistErrCode        = 11003  //用户名不存在
	UnLogInErrCode             = 110004 //点赞和评论操作需要用户登录
	VideoNotExistErrCode       = 12001  //视频不存在
)

type ErrNo struct {
	ErrCode int64
	ErrMsg  string
}

func (e ErrNo) Error() string {
	return fmt.Sprintf("err_code=%d, err_msg=%s", e.ErrCode, e.ErrMsg)
}

func NewErrNo(code int64, msg string) ErrNo {
	return ErrNo{code, msg}
}

func (e ErrNo) WithMessage(msg string) ErrNo {
	e.ErrMsg = msg
	return e
}

var (
	Success             = NewErrNo(SuccessCode, "Success")
	ServiceErr          = NewErrNo(ServiceErrCode, "Service is unable to start successfully")
	ParamErr            = NewErrNo(ParamErrCode, "Wrong Parameter has been given")
	LoginErr            = NewErrNo(AuthorizationFailedErrCode, "Wrong username or password")
	UserNotExistErr     = NewErrNo(UserNotExistErrCode, "User does not exists")
	UserAlreadyExistErr = NewErrNo(UserAlreadyExistErrCode, "User already exists")
	UnLogInErr          = NewErrNo(UnLogInErrCode, "Please log in first")
	VideoNotExistErr    = NewErrNo(VideoNotExistErrCode, "Video does not exists")
)

// ConvertErr convert error to Errno
func ConvertErr(err error) ErrNo {
	Err := ErrNo{}
	if errors.As(err, &Err) {
		return Err
	}

	s := ServiceErr
	s.ErrMsg = err.Error()
	return s
}
