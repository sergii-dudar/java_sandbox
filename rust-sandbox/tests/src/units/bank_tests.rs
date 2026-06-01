use crate::bank::*;

fn new_acc() -> Account {
    Account::new("alice", 100)
}

#[test]
fn new_account_state() {
    let a = new_acc();
    assert_eq!(a.owner(), "alice");
    assert_eq!(a.balance(), 100);
}

#[test]
fn deposit_positive() {
    let mut a = new_acc();
    assert_eq!(a.deposit(50), Ok(150));
}

#[test]
fn deposit_zero_is_invalid() {
    let mut a = new_acc();
    assert_eq!(a.deposit(0), Err(BankError::InvalidAmount));
}

#[test]
fn withdraw_ok() {
    let mut a = new_acc();
    assert_eq!(a.withdraw(40), Ok(60));
}

#[test]
fn withdraw_too_much() {
    let mut a = new_acc();
    assert_eq!(
        a.withdraw(500),
        Err(BankError::InsufficientFunds { requested: 500, available: 100 })
    );
}

#[test]
fn transfer_moves_funds() {
    let mut a = Account::new("a", 100);
    let mut b = Account::new("b", 0);
    a.transfer(&mut b, 30).unwrap();
    assert_eq!(a.balance(), 70);
    assert_eq!(b.balance(), 30);
}
