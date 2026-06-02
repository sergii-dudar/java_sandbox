// HTTP tests using `net/http/httptest`. Two styles:
//   * `httptest.NewRecorder` — invoke the handler directly, inspect response.
//   * `httptest.NewServer`   — spin up a real local server, hit it with a client.
package httpapi

import (
	"encoding/json"
	"io"
	"net/http"
	"net/http/httptest"
	"strings"
	"testing"
)

func TfstEchoWithRecorder(t *testing.T) {
	req := httptest.NewRequest(http.MethodGet, "/echo?msg=hello", nil)
	rec := httptest.NewRecorder()
	NewMux().ServeHTTP(rec, req)

	if rec.Code != http.StatusOK {
		t.Fatalf("status = %d", rec.Code)
	}
	if got := rec.Body.String(); got != "hello" {
		t.Fatalf("body = %q", got)
	}
}

func TestSumWithServer(t *testing.T) {
	srv := httptest.NewServer(NewMux())
	t.Cleanup(srv.Close)

	resp, err := http.Get(srv.URL + "/sum?a=2&b=40")
	if err != nil {
		t.Fatal(err)
	}
	defer resp.Body.Close()

	var body map[string]int
	if err := json.NewDecoder(resp.Body).Decode(&body); err != nil {
		t.Fatal(err)
	}
	if body["sum"] != 42 {
		t.Fatalf("sum = %d", body["sum"])
	}
}

func TestForbidden(t *testing.T) {
	req := httptest.NewRequest(http.MethodGet, "/forbidden", nil)
	rec := httptest.NewRecorder()
	NewMux().ServeHTTP(rec, req)

	if rec.Code != http.StatusForbidden {
		t.Fatalf("status = %d", rec.Code)
	}
	body, _ := io.ReadAll(rec.Body)
	if !strings.Contains(string(body), "nope") {
		t.Fatalf("unexpected body: %q", body)
	}
}

// Parametrized handler test using subtests + recorders.
func TestSumTable(t *testing.T) {
	cases := []struct {
		a, b, want int
	}{
		{1, 2, 3}, {0, 0, 0}, {-5, 5, 0}, {100, 200, 300},
	}
	for _, tc := range cases {
		tc := tc
		t.Run("", func(t *testing.T) {
			t.Parallel()
			url := "/sum?a=" + itoa(tc.a) + "&b=" + itoa(tc.b)
			req := httptest.NewRequest(http.MethodGet, url, nil)
			rec := httptest.NewRecorder()
			NewMux().ServeHTTP(rec, req)

			var body map[string]int
			_ = json.NewDecoder(rec.Body).Decode(&body)
			if body["sum"] != tc.want {
				t.Fatalf("sum(%d,%d)=%d; want %d", tc.a, tc.b, body["sum"], tc.want)
			}
		})
	}
}

func itoa(n int) string {
	if n == 0 {
		return "0"
	}
	neg := n < 0
	if neg {
		n = -n
	}
	var out []byte
	for n > 0 {
		out = append([]byte{byte('0' + n%10)}, out...)
		n /= 10
	}
	if neg {
		out = append([]byte{'-'}, out...)
	}
	return string(out)
}
