// Command demo exercises each library package as a sanity check.
//
// Run with:
//   go run ./cmd/demo
//   go build -o bin/demo ./cmd/demo && ./bin/demo
//   make demo
package main

import (
	"encoding/json"
	"fmt"
	"io"
	"net/http"
	"net/http/httptest"
	"os"
	"strings"

	"sandbox-tests/httpapi"
	"sandbox-tests/math"
	"sandbox-tests/services"
	"sandbox-tests/strs"
)

func main() {
	section("math")
	fmt.Printf("  Add(2, 3)       = %d\n", math.Add(2, 3))
	fmt.Printf("  Factorial(10)   = %d\n", math.Factorial(10))
	fmt.Printf("  Fibonacci(15)   = %d\n", math.Fibonacci(15))
	fmt.Printf("  IsPrime(7919)   = %v\n", math.IsPrime(7919))
	fmt.Printf("  GCD(54, 24)     = %d\n", math.GCD(54, 24))
	if q, err := math.Div(20, 4); err == nil {
		fmt.Printf("  Div(20, 4)      = %d\n", q)
	}

	section("strs")
	fmt.Printf("  Reverse(hello)              = %q\n", strs.Reverse("hello"))
	fmt.Printf("  IsPalindrome(racecar)       = %v\n", strs.IsPalindrome("racecar"))
	fmt.Printf("  WordCount(\"the quick fox\") = %d\n", strs.WordCount("the quick fox"))
	fmt.Printf("  Shout(rust)                 = %q\n", strs.Shout("rust"))
	fmt.Printf("  Capitalize(hello)           = %q\n", strs.Capitalize("hello"))

	section("services (Portfolio with in-memory provider + notifier)")
	prices := stubPrices{"AAPL": 180, "MSFT": 420, "GOOG": 140}
	notes := &recordingNotifier{}
	p := &services.Portfolio{Provider: prices, Notifier: notes}
	if total, err := p.Total([]string{"AAPL", "MSFT", "GOOG"}); err == nil {
		fmt.Printf("  Total = %d\n", total)
		fmt.Printf("  Notifications = %v\n", notes.messages)
	}

	section("httpapi (in-process httptest server)")
	srv := httptest.NewServer(httpapi.NewMux())
	defer srv.Close()

	echo := must(httpGet(srv.URL + "/echo?msg=hello"))
	fmt.Printf("  GET /echo?msg=hello -> %q\n", echo)

	sum := must(httpGet(srv.URL + "/sum?a=2&b=40"))
	fmt.Printf("  GET /sum?a=2&b=40   -> %s\n", strings.TrimSpace(sum))

	var parsed map[string]int
	_ = json.Unmarshal([]byte(sum), &parsed)
	if parsed["sum"] != 42 {
		fmt.Fprintln(os.Stderr, "demo: sum endpoint returned unexpected value")
		os.Exit(1)
	}

	section("done")
	fmt.Println("  all package demos completed successfully")
}

// -----------------------------------------------------------------------------
// helpers (kept inline to keep the demo single-file)
// -----------------------------------------------------------------------------

func section(name string) {
	fmt.Printf("\n=== %s ===\n", name)
}

type stubPrices map[string]int

func (s stubPrices) PriceOf(sym string) (int, bool) {
	v, ok := s[sym]
	return v, ok
}

type recordingNotifier struct{ messages []string }

func (r *recordingNotifier) Notify(message string) error {
	r.messages = append(r.messages, message)
	return nil
}

func httpGet(url string) (string, error) {
	resp, err := http.Get(url)
	if err != nil {
		return "", err
	}
	defer resp.Body.Close()
	body, err := io.ReadAll(resp.Body)
	return string(body), err
}

func must(s string, err error) string {
	if err != nil {
		fmt.Fprintln(os.Stderr, "demo:", err)
		os.Exit(1)
	}
	return s
}
