# READ UNCOMMITTED:

- Allows transactions to read uncommitted changes made by other transactions.
- Least restrictive isolation level.
- Can result in dirty reads, non-repeatable reads, and phantom reads.

# READ COMMITTED:

- Transactions can only read committed changes made by other transactions.
- It prevents dirty reads but still allows non-repeatable reads and phantom reads.
- It's a compromise between isolation and concurrency.

# REPEATABLE READ:

- A transaction can repeatedly read its own changes and committed changes made by other transactions.
- Prevents dirty reads and non-repeatable reads but may still allow phantom reads.
- Higher isolation than READ COMMITTED.

# SERIALIZABLE:

- Provides the highest level of isolation.
- Ensures that transactions are executed in a way that is serializable, meaning the result of concurrent transactions is the same as if they were executed serially.
- Prevents dirty reads, non-repeatable reads, and phantom reads.

----


*Both Dirty Reads and Non-Repeatable Reads are anomalies that can occur in database transactions due to concurrency. They differ in the specific scenario and data they involve:*

## Dirty Read:

- Definition: Occurs when a transaction reads data written by another, uncommitted transaction. This means the data hasn't been permanently saved yet and could be rolled back.
- Impact: Reading data that might not exist in the final state of the database.
- Example: Imagine Transaction A reads a user's account balance, then Transaction B updates the balance but rolls back due to an error. Transaction A would have read an invalid balance.

## Phantom Reads:

- Definition: A phantom read occurs when a transaction reads a set of rows that match a certain condition, but during the course of the transaction, another transaction inserts, updates, or deletes rows that also match the condition.
- Example: Transaction A reads all rows where the age is greater than 25. While Transaction A is in progress, Transaction B inserts a new row with age 30. If Transaction A re-executes the same query, it may encounter a "phantom" row that wasn't present in the initial result.

## Non-Repeatable Read:

- Definition: Occurs when a transaction reads the same data twice but gets different values each time. This happens because another transaction updates the data and commits in between the reads.
- Impact: Inconsistency within the transaction, as it sees different versions of the same data.
- Example: Transaction A reads a product's quantity, then does some calculations. Before A finishes, Transaction B reduces the quantity and commits. When A tries to access the quantity again, it gets the lower value, potentially leading to incorrect results.

### Key Differences:

- *Data commitment*: Dirty Read involves uncommitted data, while Non-Repeatable Read involves committed data (but modified after the first read).
- *Data modification*: Dirty Read happens with any write operation (update, insert, delete) on uncommitted data. Non-Repeatable Read specifically occurs with updates on committed data.
- *Impact*: Dirty Read risks reading invalid data, while Non-Repeatable Read causes data inconsistency within the transaction.

**Preventing these anomalies:**

*Databases offer different transaction isolation levels to control how transactions interact. Higher levels provide stricter consistency but can impact performance.*

- *READ UNCOMMITTED*: Allows dirty reads. Not recommended in most cases.
- *READ COMMITTED*: Prevents dirty reads, but allows non-repeatable reads.
- *REPEATABLE READ*: Prevents non-repeatable reads, but allows phantom reads (reading data inserted by another transaction).
- *SERIALIZABLE*: Enforces strict order, preventing all anomalies but significantly impacting performance.

Choosing the appropriate isolation level depends on your application's needs for consistency and performance.
