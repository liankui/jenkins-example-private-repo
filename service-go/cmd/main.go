package main

import (
	"fmt"
	"net/http"
)

func main() {
	http.HandleFunc("/hello", func(rw http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(rw, "hello world")
	})

	fmt.Printf("listen and server...\n")
	if err := http.ListenAndServe(":7777", nil); err != nil {
		panic(err)
	}
}
