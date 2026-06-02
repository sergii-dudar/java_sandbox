// Package httpapi exposes a tiny HTTP handler exercised with httptest.
package httpapi

import (
	"encoding/json"
	"net/http"
	"strconv"
)

func NewMux() *http.ServeMux {
	mux := http.NewServeMux()
	mux.HandleFunc("/echo", func(w http.ResponseWriter, r *http.Request) {
		_, _ = w.Write([]byte(r.URL.Query().Get("msg")))
	})
	mux.HandleFunc("/sum", func(w http.ResponseWriter, r *http.Request) {
		a, _ := strconv.Atoi(r.URL.Query().Get("a"))
		b, _ := strconv.Atoi(r.URL.Query().Get("b"))
		w.Header().Set("Content-Type", "application/json")
		_ = json.NewEncoder(w).Encode(map[string]int{"sum": a + b})
	})
	mux.HandleFunc("/forbidden", func(w http.ResponseWriter, r *http.Request) {
		http.Error(w, "nope", http.StatusForbidden)
	})
	return mux
}
