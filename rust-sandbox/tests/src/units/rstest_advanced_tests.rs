//! Advanced `rstest` features: composed fixtures, `#[once]` fixtures,
//! async tests with timeouts, and the `#[awt]` await-on-args attribute.

use crate::async_utils::*;
use crate::math::*;

use rstest::*;
use std::time::Duration;
use std::sync::atomic::{AtomicUsize, Ordering};

// -----------------------------------------------------------------------------
// Fixture composition: one fixture depends on another.
// -----------------------------------------------------------------------------

#[fixture]
fn base_numbers() -> Vec<i64> {
    vec![1, 2, 3, 4, 5]
}

#[fixture]
fn sum_of_base(base_numbers: Vec<i64>) -> i64 {
    base_numbers.iter().copied().fold(0, add)
}

#[rstest]
fn composed_fixture_yields_expected_sum(sum_of_base: i64) {
    assert_eq!(sum_of_base, 15);
}

// -----------------------------------------------------------------------------
// `#[once]` fixture: computed exactly once for the whole test run.
// -----------------------------------------------------------------------------

static EXPENSIVE_CALLS: AtomicUsize = AtomicUsize::new(0);

#[fixture]
#[once]
fn expensive_setup() -> Vec<u64> {
    EXPENSIVE_CALLS.fetch_add(1, Ordering::SeqCst);
    (2..=50).filter(|n| is_prime(*n)).collect()
}

#[rstest]
fn once_fixture_first_consumer(expensive_setup: &Vec<u64>) {
    assert!(expensive_setup.contains(&13));
}

#[rstest]
fn once_fixture_second_consumer(expensive_setup: &Vec<u64>) {
    assert!(expensive_setup.contains(&47));
    // Even with both tests, the fixture was built only once.
    assert!(EXPENSIVE_CALLS.load(Ordering::SeqCst) <= 1);
}

// -----------------------------------------------------------------------------
// Async rstest with timeout
// -----------------------------------------------------------------------------

#[rstest]
#[tokio::test]
#[timeout(Duration::from_millis(500))]
async fn rstest_async_completes_in_time() {
    assert_eq!(delayed_add(1, 2).await, 3);
}

#[rstest]
#[case(1, 2, 3)]
#[case(10, 20, 30)]
#[case(-5, 5, 0)]
#[tokio::test]
#[timeout(Duration::from_millis(500))]
async fn rstest_async_parametrized(#[case] a: i64, #[case] b: i64, #[case] expected: i64) {
    assert_eq!(delayed_add(a, b).await, expected);
}

// -----------------------------------------------------------------------------
// `#[future]` + `#[awt]` — fixture returns a future, awaited automatically.
// -----------------------------------------------------------------------------

#[fixture]
async fn async_answer() -> i64 {
    delayed_add(40, 2).await
}

#[rstest]
#[awt]
#[tokio::test]
async fn awt_awaits_fixture_args(#[future] async_answer: i64) {
    assert_eq!(async_answer, 42);
}
