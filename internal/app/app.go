package app

import (
	"log"
	"os"
	"fmt"
	"net/http"
	"github.com/gauravxthakur/go/internal/api"
	"github.com/gauravxthakur/go/internal/store"
	"database/sql"
)

type Application struct{
	Logger *log.Logger
	WorkoutHandler *api.WorkoutHandler
	DB *sql.DB
}

func NewApplication() (*Application, error){
	pgDB, err := store.Open()
	if err != nil{
		return nil, err
	}

	err = store.MigrateFS(pgDB, migrations.FS, ".")
	if err != nil{
		panic(err)
	}

	logger := log.New(os.Stdout, "", log.Ldate|log.Ltime)

	// our stores will go here

	// our handlers will go here
	workoutHandler := api.NewWorkoutHandler()

	app := &Application{
		Logger : logger,
		WorkoutHandler: workoutHandler,
		DB: pgDB,
	}
	return app, nil
}

func (a* Application) HealthCheck(w http.ResponseWriter, r *http.Request){
	fmt.Fprint(w, "Status is available\n")
}