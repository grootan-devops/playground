// Command server is the playground's test application: a tiny HTTP server whose
// version and marker identify exactly which candidate build a release promoted.
package main

import (
	"flag"
	"fmt"
	"log"
	"net/http"
	"os"
	"strconv"
	"time"
)

var (
	// Version is set at build time from the image tag.
	Version = "dev"
	// Marker names the pull request that built the image, so a promoted image
	// can be traced back to its candidate.
	Marker = "BASE"
)

func healthHandler(w http.ResponseWriter, _ *http.Request) {
	w.WriteHeader(http.StatusOK)
	_, _ = w.Write([]byte("OK\n"))
}

func rootHandler(w http.ResponseWriter, _ *http.Request) {
	w.WriteHeader(http.StatusOK)
	_, _ = fmt.Fprintf(w, "Hello, World! Marker: %s, Version: %s\n", Marker, Version)
}

func versionLine() string {
	return fmt.Sprintf("playground %s marker %s", Version, Marker)
}

func main() {
	showVersion := flag.Bool("version", false, "print the version and marker, then exit")
	flag.Parse()
	if *showVersion {
		fmt.Println(versionLine())
		return
	}

	port := 8080
	if p, err := strconv.Atoi(os.Getenv("PORT")); err == nil && p > 0 && p < 65536 {
		port = p
	}

	mux := http.NewServeMux()
	mux.HandleFunc("/healthz", healthHandler)
	mux.HandleFunc("/", rootHandler)

	srv := &http.Server{
		Addr:              fmt.Sprintf(":%d", port),
		Handler:           mux,
		ReadHeaderTimeout: 5 * time.Second,
		ReadTimeout:       10 * time.Second,
		WriteTimeout:      10 * time.Second,
	}

	log.Printf("Starting playground on %s (%s)", srv.Addr, versionLine())
	if err := srv.ListenAndServe(); err != nil && err != http.ErrServerClosed {
		log.Fatalf("server failed: %v", err)
	}
}
