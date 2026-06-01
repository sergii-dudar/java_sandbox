//! Async test variants — `#[tokio::test]` (single- and multi-thread),
//! `#[async_std::test]`, and `futures::executor::block_on`.

use crate::async_utils::*;

// -----------------------------------------------------------------------------
// tokio
// -----------------------------------------------------------------------------

#[tokio::test]
async fn tokio_default_runtime() {
    assert_eq!(delayed_add(2, 3).await, 5);
}

#[tokio::test(flavor = "multi_thread", worker_threads = 4)]
async fn tokio_multi_thread() {
    let total = concurrent_sum((1..=10).collect()).await;
    assert_eq!(total, 55);
}

#[tokio::test(flavor = "current_thread", start_paused = true)]
async fn tokio_with_paused_clock() {
    // Time is virtual — `sleep` resolves instantly when paused.
    let result = tokio::time::timeout(
        std::time::Duration::from_secs(60),
        delayed_add(10, 20),
    )
    .await
    .unwrap();
    assert_eq!(result, 30);
}

// -----------------------------------------------------------------------------
// async-std
// -----------------------------------------------------------------------------

#[async_std::test]
async fn async_std_basic() {
    assert_eq!(delayed_add(7, 8).await, 15);
}

// -----------------------------------------------------------------------------
// futures::block_on — plain `#[test]` runs an async block manually
// -----------------------------------------------------------------------------

#[test]
fn futures_block_on() {
    let result = futures::executor::block_on(delayed_add(40, 2));
    assert_eq!(result, 42);
}

// -----------------------------------------------------------------------------
// Demonstrate failure detection: timeout on a never-completing future.
// -----------------------------------------------------------------------------

#[tokio::test]
async fn tokio_timeout_traps_runaway() {
    let res = tokio::time::timeout(
        std::time::Duration::from_millis(20),
        never_completes(),
    )
    .await;
    assert!(res.is_err(), "expected timeout error");
}
