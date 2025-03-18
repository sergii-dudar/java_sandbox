 - sql READ COMMITED isolation level: but what if two transactions runs on same set of data in parallel and commit changes? how isolation can help here, as one transaction in result will overwrite another by the fact?

In the READ COMMITTED isolation level, each transaction sees only data that has been committed by other transactions, 
meaning that uncommitted data is not visible to other transactions. However, this isolation level does not prevent 
certain types of concurrency issues, particularly the scenario you've described, where two transactions modify the same 
data concurrently and then commit their changes.

## Scenario: Concurrent Updates in READ COMMITTED
Let's say you have two transactions, T1 and T2, running concurrently:

1. Transaction T1:

- Reads a row (let's call it Row A).
- Modifies Row A.
- Commits the changes.

2. Transaction T2:

- Reads Row A after T1 but before T1 commits.
- Modifies Row A.
- Commits the changes.


##  Outcome:
- Since both T1 and T2 are operating under the READ COMMITTED isolation level, they both see the most recently 
    committed version of Row A when they start.
- However, if T2 reads Row A before T1 commits its changes, T2 will not see the changes made by T1.
- When T2 modifies and commits Row A, it will overwrite the changes made by T1, effectively causing T1's changes to be lost.

## Why This Happens in READ COMMITTED:
Lack of Protection Against Lost Updates: READ COMMITTED does not protect against this type of concurrency issue known as 
lost updates. Since each transaction reads only committed data, but there is no locking or versioning to prevent one 
transaction from overwriting the changes made by another, the last transaction to commit effectively wins, and any 
previous changes can be overwritten.

## How Isolation Levels Can Help:
- Serializable Isolation Level:

    In the SERIALIZABLE isolation level, transactions are executed as if they were run sequentially. This means that T2 would not be able to modify Row A until T1 has finished and committed. If T2 tried to modify Row A after T1 commits, the database might roll back T2 with a serialization failure, forcing T2 to retry or abort.

- Repeatable Read Isolation Level:

    In the REPEATABLE READ isolation level, once T1 reads Row A, T2 cannot modify it until T1 commits. This prevents T2 from overwriting the changes made by T1, but it does not completely prevent other concurrency issues like phantom reads.

- Optimistic Concurrency Control:

    Some systems use optimistic concurrency control by including a version number or timestamp with each row. When T1 and T2 try to commit, the system checks if the data has been modified since it was last read. If T2 detects that T1 has already committed changes to Row A, T2 would be rolled back or prompted to retry, preventing the lost update scenario.

## Conclusion:
The READ COMMITTED isolation level ensures that transactions only see committed data, but it does not protect against concurrency 
issues like lost updates, where two transactions overwrite each other's changes. To avoid such issues, a higher isolation level 
like REPEATABLE READ or SERIALIZABLE, or the use of optimistic concurrency control, would be necessary. These approaches introduce 
additional safeguards to ensure that concurrent modifications do not lead to unintended data loss.