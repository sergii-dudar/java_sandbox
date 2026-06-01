mod common;

use common::{alice_with, bob_with};
use test1::bank::BankError;

#[test]
fn deposit_then_withdraw() {
    let mut a = alice_with(0);
    a.deposit(200).unwrap();
    assert_eq!(a.balance(), 200);
    a.withdraw(75).unwrap();
    assert_eq!(a.balance(), 125);
}

#[test]
fn transfer_between_accounts() {
    let mut a = alice_with(100);
    let mut b = bob_with(20);
    a.transfer(&mut b, 60).unwrap();
    assert_eq!(a.balance(), 40);
    assert_eq!(b.balance(), 80);
}

#[test]
fn transfer_fails_on_insufficient() {
    let mut a = alice_with(10);
    let mut b = bob_with(0);
    let err = a.transfer(&mut b, 50).unwrap_err();
    assert_eq!(err, BankError::InsufficientFunds { requested: 50, available: 10 });
    assert_eq!(a.balance(), 10);
    assert_eq!(b.balance(), 0);
}

#[test]
fn negative_deposit_rejected() {
    let mut a = alice_with(10);
    assert_eq!(a.deposit(-5), Err(BankError::InvalidAmount));
}

#[test]
#[ignore = "scenario reserved for manual long-running run"]
fn many_transfers_stress() {
    let mut a = alice_with(1_000_000);
    let mut b = bob_with(0);
    for _ in 0..1000 {
        a.transfer(&mut b, 1).unwrap();
    }
    assert_eq!(b.balance(), 1000);
}
