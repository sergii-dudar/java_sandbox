//! Compile-pass / compile-fail tests using the `trybuild` crate.
//!
//! `trybuild` runs `rustc` on each `.rs` file and asserts whether it
//! compiles or fails with a matching `.stderr`. It produces its own
//! human-readable PASS/FAIL output that's distinct from libtest's.

#[test]
fn trybuild_examples() {
    let t = trybuild::TestCases::new();
    t.pass("tests/ui/pass_*.rs");
    // To add compile-fail cases, drop a file `fail_*.rs` plus a matching
    // `fail_*.stderr` snapshot, then enable:
    // t.compile_fail("tests/ui/fail_*.rs");
}
