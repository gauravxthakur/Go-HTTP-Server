package main

import(
	"github.com/gauravxthakur/go/internal/app"
)
func main(){
	app, err := app.NewApplication()

	if err != nil{
		panic(err)
	}
	app.Logger.Println("We are running our app")
}