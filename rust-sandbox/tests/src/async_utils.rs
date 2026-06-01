//! Async helpers used to demonstrate async/await testing.
//!
//! `delayed_add` is intentionally runtime-agnostic so it works under
//! `tokio`, `async-std`, and `futures::executor::block_on`. The
//! `tokio_delayed_add` variant uses `tokio::time::sleep` and therefore
//! requires a tokio reactor.

use std::time::Duration;

/// Add two numbers — runtime-agnostic, no timer required.
pub async fn delayed_add(a: i64, b: i64) -> i64 {
    // Yield once so the function genuinely awaits something.
    futures::pending_then_ready(a + b).await
}

/// Same as `delayed_add` but requires a tokio reactor (uses `tokio::time::sleep`).
pub async fn tokio_delayed_add(a: i64, b: i64) -> i64 {
    tokio::time::sleep(Duration::from_millis(1)).await;
    a + b
}

/// Fetch several values concurrently and return their sum (tokio-only).
pub async fn concurrent_sum(values: Vec<i64>) -> i64 {
    let handles: Vec<_> = values
        .into_iter()
        .map(|v| tokio::spawn(async move { v }))
        .collect();
    let mut total = 0;
    for h in handles {
        total += h.await.unwrap();
    }
    total
}

/// Loop forever — used to demonstrate `#[timeout(..)]` / `tokio::time::timeout`.
pub async fn never_completes() -> i64 {
    loop {
        tokio::time::sleep(Duration::from_millis(10)).await;
    }
}

mod futures {
    //! Tiny helper to yield once on any executor without depending on tokio.
    use std::future::Future;
    use std::pin::Pin;
    use std::task::{Context, Poll};

    pub fn pending_then_ready<T>(value: T) -> YieldOnce<T> {
        YieldOnce { value: Some(value), yielded: false }
    }

    pub struct YieldOnce<T> {
        value: Option<T>,
        yielded: bool,
    }

    impl<T: Unpin> Future for YieldOnce<T> {
        type Output = T;
        fn poll(mut self: Pin<&mut Self>, cx: &mut Context<'_>) -> Poll<T> {
            if !self.yielded {
                self.yielded = true;
                cx.waker().wake_by_ref();
                Poll::Pending
            } else {
                Poll::Ready(self.value.take().expect("polled after completion"))
            }
        }
    }
}

