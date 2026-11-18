package main

import (
	"net/http"
	"net/http/httptest"
	"strings"
	"testing"
)

func TestHealthHandler(t *testing.T) {
	rr := httptest.NewRecorder()
	healthHandler(rr, httptest.NewRequest(http.MethodGet, "/healthz", nil))
	if rr.Code != http.StatusOK || rr.Body.String() != "OK\n" {
		t.Fatalf("healthHandler = %d %q, want 200 \"OK\\n\"", rr.Code, rr.Body.String())
	}
}

func TestRootHandler(t *testing.T) {
	rr := httptest.NewRecorder()
	rootHandler(rr, httptest.NewRequest(http.MethodGet, "/", nil))
	if rr.Code != http.StatusOK || !strings.Contains(rr.Body.String(), "Marker: "+Marker) {
		t.Fatalf("rootHandler = %d %q, want 200 with the marker", rr.Code, rr.Body.String())
	}
}

func TestVersionLine(t *testing.T) {
	if got, want := versionLine(), "playground "+Version+" marker "+Marker; got != want {
		t.Fatalf("versionLine() = %q, want %q", got, want)
	}
}
