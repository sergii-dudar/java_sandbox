// Snapshot tests using `github.com/bradleyjkemp/cupaloy`.
// On first run cupaloy writes `.snapshots/<TestName>` files; subsequent
// runs compare against the snapshot. Update with `UPDATE_SNAPSHOTS=true`.
package strs

import (
	"testing"

	"github.com/bradleyjkemp/cupaloy/v2"
)

func TestSnapshotReverse(t *testing.T) {
	cupaloy.SnapshotT(t, Reverse("the quick brown fox"))
}

func TestSnapshotPalindromeReport(t *testing.T) {
	inputs := []string{"racecar", "no lemon, no melon", "hello", ""}
	results := map[string]bool{}
	for _, s := range inputs {
		results[s] = IsPalindrome(s)
	}
	cupaloy.SnapshotT(t, results)
}
