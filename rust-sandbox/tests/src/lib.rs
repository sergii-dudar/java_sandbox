//! Rust testing playground.
//!
//! Themed modules, each with its own unit tests (varying counts and styles).
//! Integration tests live in the `tests/` directory at the crate root.

pub mod math;
pub mod strings;
pub mod collections;
pub mod shapes;
pub mod bank;
pub mod parser;

#[cfg(test)]
mod units;
