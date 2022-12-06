package main

import (
	"fmt"
	"net/http"
	"strings"

	"github.com/acarl005/stripansi"
	jsoniter "github.com/json-iterator/go"
)

func main() {
	var lines = strings.Split(stripansi.Strip(string([]byte{124})), "\n")
	fmt.Println(lines)

	_, _ = jsoniter.Marshal([]byte{123})
	http.HandleFunc("/hello", func(rw http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(rw, "hello world")
	})

	fmt.Printf("listen and server...\n")
	if err := http.ListenAndServe(":7777", nil); err != nil {
		panic(err)
	}

}
