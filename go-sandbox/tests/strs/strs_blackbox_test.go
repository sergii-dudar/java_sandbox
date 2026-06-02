// Black-box tests: file lives in the same directory but uses a separate
// `_test` package, so it can only see the exported API of `strs`.
package strs_test

import (
	"testing"

	"sandbox-tests/strs"
)

func TestReverseBlackBox(t *testing.T) {
	if got := strs.Reverse("hello"); got != "olleh" {
		t.Errorf("Reverse(hello) = %q", got)
	}
}

func TestWordCountBlackBox(t *testing.T) {
	if got := strs.WordCount("the quick brown fox"); got != 4 {
		t.Errorf("WordCount = %d; want 4", got)
	}
}

func TestShoutBlackBox(t *testing.T) {
	if got := strs.Shout("rust"); got != "RUST" {
		t.Errorf("Shout = %q", got)
	}
}
