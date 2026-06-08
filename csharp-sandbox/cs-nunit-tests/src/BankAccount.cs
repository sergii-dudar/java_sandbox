namespace Sandbox;

/// <summary>Small stateful class to demonstrate lifecycle hooks and exceptions.</summary>
public class BankAccount
{
    public BankAccount(decimal balance) => Balance = balance;

    public decimal Balance { get; private set; }

    public void Deposit(decimal amount)
    {
        if (amount <= 0)
        {
            throw new ArgumentException("amount must be positive", nameof(amount));
        }

        Balance += amount;
    }

    public void Withdraw(decimal amount)
    {
        if (amount > Balance)
        {
            throw new InvalidOperationException("insufficient funds");
        }

        Balance -= amount;
    }
}
