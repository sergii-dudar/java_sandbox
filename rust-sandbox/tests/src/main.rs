use test1::{bank::Account, math, shapes::{Circle, Shape}, strings};

fn main() {
    println!("add(2, 3) = {}", math::add(2, 3));
    println!("fib(10) = {}", math::fibonacci(10));
    println!("reverse('hello') = {}", strings::reverse("hello"));

    let c = Circle { radius: 2.0 };
    println!("circle area = {:.3}", c.area());

    let mut acc = Account::new("alice", 100);
    acc.deposit(50).unwrap();
    acc.withdraw(30).unwrap();
    println!("balance = {}", acc.balance());
}
