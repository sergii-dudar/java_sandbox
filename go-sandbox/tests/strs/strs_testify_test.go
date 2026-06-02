// Tests using the `testify` library: assert, require, and suite styles.
// Note: `assert.X` records a failure and continues; `require.X` aborts the test.
package strs

import (
	"testing"

	"github.com/stretchr/testify/assert"
	"github.com/stretchr/testify/require"
	"github.com/stretchr/testify/suite"
)

// -----------------------------------------------------------------------------
// assert / require
// -----------------------------------------------------------------------------

func TestTestifyAssert(t *testing.T) {
	a := assert.New(t)
	a.Equal("olleh", Reverse("hello"))
	a.True(IsPalindrome("racecar"))
	a.False(IsPalindrome("hello"))
	a.Len("abc", 3)
}

func TestTestifyRequire(t *testing.T) {
	r := require.New(t)
	r.NotEmpty(Shout("x"), "shout must never be empty for non-empty input")
	r.Equal("HELLO", Shout("hello"))
}

// -----------------------------------------------------------------------------
// Table tests using testify
// -----------------------------------------------------------------------------

func TestTestifyTable(t *testing.T) {
	cases := []struct {
		in, want string
	}{
		{"hello", "Hello"},
		{"rust", "Rust"},
		{"", ""},
		{"ALREADY", "ALREADY"},
	}
	for _, tc := range cases {
		tc := tc
		t.Run(tc.in, func(t *testing.T) {
			assert.Equal(t, tc.want, Capitalize(tc.in))
		})
	}
}

// -----------------------------------------------------------------------------
// Suite — class-style tests with SetupSuite / SetupTest / TearDown hooks.
// -----------------------------------------------------------------------------

type StringSuite struct {
	suite.Suite
	greeting string
}

func (s *StringSuite) SetupSuite()    { s.greeting = "hello" }
func (s *StringSuite) SetupTest()     {}
func (s *StringSuite) TearDownTest()  {}
func (s *StringSuite) TearDownSuite() {}

func (s *StringSuite) TestReverse() {
	s.Equal("olleh", Reverse(s.greeting))
}

func (s *StringSuite) TestShout() {
	s.Equal("HELLO", Shout(s.greeting))
}

func (s *StringSuite) TestPalindromeNo() {
	s.False(IsPalindrome(s.greeting))
}

func TestStringSuite(t *testing.T) {
	suite.Run(t, new(StringSuite))
}
