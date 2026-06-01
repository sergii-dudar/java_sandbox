//! A tiny bank account model with explicit error type.

#[derive(Debug, PartialEq, Eq)]
pub enum BankError {
    InsufficientFunds { requested: i64, available: i64 },
    InvalidAmount,
}

#[derive(Debug, Clone)]
pub struct Account {
    owner: String,
    balance: i64,
}

impl Account {
    pub fn new(owner: impl Into<String>, balance: i64) -> Self {
        Self { owner: owner.into(), balance }
    }

    pub fn owner(&self) -> &str {
        &self.owner
    }

    pub fn balance(&self) -> i64 {
        self.balance
    }

    pub fn deposit(&mut self, amount: i64) -> Result<i64, BankError> {
        if amount <= 0 {
            return Err(BankError::InvalidAmount);
        }
        self.balance += amount;
        Ok(self.balance)
    }

    pub fn withdraw(&mut self, amount: i64) -> Result<i64, BankError> {
        if amount <= 0 {
            return Err(BankError::InvalidAmount);
        }
        if amount > self.balance {
            return Err(BankError::InsufficientFunds {
                requested: amount,
                available: self.balance,
            });
        }
        self.balance -= amount;
        Ok(self.balance)
    }

    pub fn transfer(&mut self, other: &mut Account, amount: i64) -> Result<(), BankError> {
        self.withdraw(amount)?;
        other.deposit(amount)?;
        Ok(())
    }
}

