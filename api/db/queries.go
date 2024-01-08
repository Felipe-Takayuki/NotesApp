package db

import (
	"database/sql"
	"fmt"
)

func GetNotes(db *sql.DB) (*sql.Rows, error) {
	rows, err := db.Query("SELECT id, text FROM Notes")
	if err != nil {
		return nil, err
	}
	return rows, nil
}

func CreateNotes(db *sql.DB, text string) error {
	result, err := db.Exec("INSERT INTO notes(text) VALUES (?)", text)

	if err != nil {
		return err
	}
	rowsAffected, err := result.RowsAffected()
	if err != nil {
		return err
	}
	fmt.Printf("Registro inserido com sucesso. rows affected: %d\n", rowsAffected)
	return err

}
