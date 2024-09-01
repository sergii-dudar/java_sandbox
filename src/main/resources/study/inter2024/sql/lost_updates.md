## Lost updates 
Lost updates in SQL occur when two or more transactions read the same data, and then each transaction updates the data based 
on the value it read, but the last transaction to commit overwrites the changes made by the other transactions. This results 
in some updates being "lost" because they are overwritten by later commits.

## Example of a Lost Update:
Imagine two transactions, T1 and T2, both trying to update the same row in a database table.

1. Initial State:

- A table with a column balance has a value of 100.

2. Transaction T1:

- Reads balance (value is 100).
- Adds 50 to balance.
- Sets balance = 150.
- Does not commit yet.

3. Transaction T2:

- Reads balance (value is still 100, because T1 has not committed).
- Subtracts 30 from balance.
- Sets balance = 70.
- Commits the transaction.

4. Transaction T1:

- Commits its changes (balance = 150).

## Outcome:
The final value of balance is 150, but the -30 update from T2 is lost because T1 overwrote it.

## Ways to Prevent Lost Updates:
There are several strategies to prevent lost updates in SQL, depending on the isolation level and locking mechanisms used:

1. Optimistic Concurrency Control:
   - Versioning: Each row in the table has a version number or timestamp.
   - Process:
     1. When a transaction reads a row, it also reads the version number.
     2. Before committing an update, the transaction checks if the version number has changed since it was read.
     3. If the version number has changed, the transaction detects a conflict and can either retry or abort.
   - Example: UPDATE table SET balance = 150 WHERE id = 1 AND version = 1;
   - Result: If another transaction has updated the row, the update will fail, and the transaction can handle the conflict accordingly.

2. Pessimistic Locking:
   - Using SELECT FOR UPDATE: Lock the row when it is read so that no other transaction can modify it until the lock is released.
   - Process:
     - Transaction T1 reads balance using SELECT ... FOR UPDATE, locking the row.
     - Transaction T2 attempts to read balance but is blocked until T1 commits or rolls back.
     - Once T1 commits, T2 can proceed.
   Example:
   ```
   BEGIN;
   SELECT balance FROM accounts WHERE id = 1 FOR UPDATE;
   UPDATE accounts SET balance = balance + 50 WHERE id = 1;
   COMMIT;
   ```
    - Result: This approach prevents T2 from making changes while T1 holds the lock, thus avoiding lost updates.

3. Higher Isolation Levels:
   - Repeatable Read Isolation Level:
     - Ensures that if a transaction reads a row, no other transaction can modify that row until the first transaction is complete.
     - This prevents lost updates by ensuring that once a transaction has read a value, it sees the same value throughout its execution.
   - Serializable Isolation Level:
     - Transactions are executed in a way that the result is as if they were run sequentially, one after the other.
     - This is the strongest isolation level and prevents lost updates by ensuring that no other transaction can interfere with the current transaction's operations on the data.
   Example:
   ```
   SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
   BEGIN;
   -- Transaction logic
   COMMIT;
   ```

## Conclusion:
Preventing lost updates requires careful management of transaction concurrency. Techniques like optimistic concurrency control, 
pessimistic locking, higher isolation levels (like REPEATABLE READ or SERIALIZABLE), and manual check-and-update logic are 
effective ways to avoid lost updates in a multi-transaction environment. Each method has its trade-offs in terms of complexity, 
performance, and the level of concurrency they allow, so the choice of strategy depends on the specific requirements of your 
application.