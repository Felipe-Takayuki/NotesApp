package handler

import (
	"net/http"

	"github.com/Felipe-Takayuki/NotesApp/api/db"
	"github.com/Felipe-Takayuki/NotesApp/api/model"
	"github.com/gin-gonic/gin"
)

func GetNotesHandler(ctx * gin.Context) {
	var notes []model.NotesModel
	bd, err := db.ConnectDB()
	if err != nil {
	  ctx.JSON(http.StatusBadRequest, gin.H{
		"message" : "Erro ao conectar com o banco de dados",
	  })
	}
	rw, err := db.GetNotes(bd)
	if err != nil {
		ctx.JSON(http.StatusBadRequest, gin.H{
			"message" : "Erro ao obter as anotações",
		})
	}
	for rw.Next() {
		var note model.NotesModel
		err := rw.Scan(&note.Id, &note.Text)
		if err != nil {
			ctx.JSON(http.StatusBadRequest, gin.H{
				"message": "Erro! list",
			})
		}
		notes = append(notes, note)
	}
	if err == nil {
		ctx.JSON(http.StatusOK, gin.H{
			"users": notes,
		})
	}
}