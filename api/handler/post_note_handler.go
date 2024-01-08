package handler

import (
	"net/http"

	"github.com/Felipe-Takayuki/NotesApp/api/db"
	"github.com/Felipe-Takayuki/NotesApp/api/model"
	"github.com/gin-gonic/gin"
)

func CreateNote(ctx *gin.Context) {
	var note model.NotesModel
	err := ctx.ShouldBindJSON(&note)

	if err != nil {
		return
	}
	bd, err := db.ConnectDB()
	if err != nil {
		ctx.JSON(http.StatusBadRequest, gin.H{
			"nota" : false,
		})
	}
	err = db.CreateNotes(bd, note.Text)
	if err == nil {
	  ctx.JSON(http.StatusOK, gin.H{
		"nota" : true,
	  })
	}
}
