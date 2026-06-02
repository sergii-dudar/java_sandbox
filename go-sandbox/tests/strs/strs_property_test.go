// Property-based tests using `pgregory.net/rapid`.
// Rapid generates random inputs and shrinks failures down to a minimal
// counter-example, printing a reproduction seed on failure.
package strs

import (
	"strings"
	"testing"

	"pgregory.net/rapid"
)

func TestReverseInvolution(t *testing.T) {
	rapid.Check(t, func(t *rapid.T) {
		s := rapid.String().Draw(t, "s")
		if Reverse(Reverse(s)) != s {
			t.Fatalf("reverse twice should be identity, got %q", Reverse(Reverse(s)))
		}
	})
}

func TestShoutIdempotent(t *testing.T) {
	rapid.Check(t, func(t *rapid.T) {
		s := rapid.String().Draw(t, "s")
		if Shout(Shout(s)) != Shout(s) {
			t.Fatal("shout should be idempotent")
		}
	})
}

func TestWordCountBounded(t *testing.T) {
	rapid.Check(t, func(t *rapid.T) {
		s := rapid.StringMatching(`[a-zA-Z ]{0,40}`).Draw(t, "s")
		got := WordCount(s)
		spaces := strings.Count(s, " ")
		if got > spaces+1 {
			t.Fatalf("word_count=%d but only %d spaces", got, spaces)
		}
	})
}
