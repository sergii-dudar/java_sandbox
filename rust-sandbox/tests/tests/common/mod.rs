#![allow(dead_code)]

use test1::bank::Account;

pub fn alice_with(balance: i64) -> Account {
    Account::new("alice", balance)
}

pub fn bob_with(balance: i64) -> Account {
    Account::new("bob", balance)
}

pub fn approx_eq(a: f64, b: f64) -> bool {
    (a - b).abs() < 1e-6
}
