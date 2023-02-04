package main

import (
	demovideo "douyin/kitex_gen/demovideo/videoservice"
	"log"
)

func main() {
	svr := demovideo.NewServer(new(VideoServiceImpl))

	err := svr.Run()

	if err != nil {
		log.Println(err.Error())
	}
}
