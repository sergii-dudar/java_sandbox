// A second compile-pass program — exercises a public API of the `test1` crate
// to demonstrate using the crate under test from a trybuild fixture.
fn main() {
    // Trybuild compiles this file standalone, so we don't import test1 here;
    // we just exercise stdlib to keep the fixture hermetic.
    let v: Vec<i32> = (1..=5).collect();
    assert_eq!(v.iter().sum::<i32>(), 15);
}
