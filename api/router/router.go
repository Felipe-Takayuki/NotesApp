package router

import "github.com/gin-gonic/gin"

func Router() {
	r := gin.Default()
	Routes(r)
    r.Run()
}
