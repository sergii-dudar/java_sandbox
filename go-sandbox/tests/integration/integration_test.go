// Integration tests gated by the `integration` build tag.
// Run with:  go test -tags=integration ./integration
// Without the tag, this file is excluded from compilation, so the suite
// is fast and offline by default.
//
//go:build integration

package integration

import (
	"net/http"
	"net/http/httptest"
	"testing"

	"sandbox-tests/httpapi"
)

func TestIntegration_FullStack(t *testing.T) {
	srv := httptest.NewServer(httpapi.NewMux())
	t.Cleanup(srv.Close)

	resp, err := http.Get(srv.URL + "/echo?msg=integration")
	if err != nil {
		t.Fatal(err)
	}
	defer resp.Body.Close()

	if resp.StatusCode != http.StatusOK {
		t.Fatalf("status = %d", resp.StatusCode)
	}
}
