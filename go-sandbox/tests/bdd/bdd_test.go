// Package bdd demonstrates BDD-style tests with Ginkgo v2 + Gomega.
// Each `Describe`/`It` block becomes a subtest under `TestBDD`.
package bdd

import (
	"testing"

	. "github.com/onsi/ginkgo/v2"
	. "github.com/onsi/gomega"

	"sandbox-tests/math"
	"sandbox-tests/strs"
)

func TestBDD(t *testing.T) {
	RegisterFailHandler(Fail)
	RunSpecs(t, "BDD suite")
}

var _ = Describe("Math", func() {
	Context("Add", func() {
		It("adds two positive numbers", func() {
			Expect(math.Add(2, 3)).To(Equal(5))
		})
		It("is commutative", func() {
			Expect(math.Add(7, -3)).To(Equal(math.Add(-3, 7)))
		})
	})

	Context("Factorial", func() {
		DescribeTable("known values",
			func(n, want int) {
				Expect(math.Factorial(n)).To(Equal(want))
			},
			Entry("0! = 1", 0, 1),
			Entry("1! = 1", 1, 1),
			Entry("5! = 120", 5, 120),
			Entry("10! = 3628800", 10, 3628800),
		)
	})

	Context("Div", func() {
		It("returns an error for zero divisor", func() {
			_, err := math.Div(1, 0)
			Expect(err).To(HaveOccurred())
		})
	})
})

var _ = Describe("Strings", func() {
	It("reverses ASCII", func() {
		Expect(strs.Reverse("hello")).To(Equal("olleh"))
	})
	It("detects palindromes", func() {
		Expect(strs.IsPalindrome("racecar")).To(BeTrue())
		Expect(strs.IsPalindrome("hello")).To(BeFalse())
	})
})

// BeforeEach / AfterEach hooks demo
var _ = Describe("With setup hooks", func() {
	var greeting string
	BeforeEach(func() { greeting = "hello" })
	AfterEach(func()  { greeting = "" })

	It("shouts", func() { Expect(strs.Shout(greeting)).To(Equal("HELLO")) })
	It("reverses", func() { Expect(strs.Reverse(greeting)).To(Equal("olleh")) })
})
