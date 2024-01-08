package router

import (
	"github.com/Felipe-Takayuki/NotesApp/api/handler"
	"github.com/gin-gonic/gin"
)

func Routes(route *gin.Engine) {
      app := route.Group("/api")
	  {
		app.GET("/get_notes",handler.GetNotesHandler)
		app.POST("/post_note", handler.CreateNote)
	  }
	}