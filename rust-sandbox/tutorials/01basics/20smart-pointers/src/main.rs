use std::ops::Deref;

struct MyBox<T>(T);
impl<T> MyBox<T> {
    // Generic structure with static method new
    fn new(x: T) -> MyBox<T> {
        MyBox(x)
    }
}
impl<T> Deref for MyBox<T> {
    type Target = T;
    fn deref(&self) -> &T {
        &self.0 //returns data
    }
}
impl<T> Drop for MyBox<T> {
    fn drop(&mut self) {
        println!("dropping MyBox object from memory ");
    }
}

fn example1() {
    println!("--->>> Box: ");
    // The Box smart pointer also called a box allows you to store data on the heap rather than the stack.
    // The stack contains the pointer to the heap data. A Box does not have performance overhead, other than
    // storing their data on the heap.

    let x = 5; //stack
    let y = Box::new(x); //heap
    println!("b = {}", y);

    println!("{}", 5 == x);
    println!("{}", 5 == *y); //dereferencing y
} // =======================================================>>>
fn example2() {
    println!("--->>> Deref Trait: ");
    // The Deref trait, provided by the standard library, requires us to implement one method named deref, that borrows
    // self and returns a reference to the inner data.

    // The Drop trait contains the drop() method. This method is called when a structure that implemented this
    // trait goes out of scope. In some languages, the programmer must call code to free memory or resources every
    // time they finish using an instance of a smart pointer. In Rust, you can achieve automatic memory deallocation
    // using Drop trait.

    let x = 5;
    let y = MyBox::new(x); // calling static method

    println!("5==x is {}", 5 == x);
    println!("5==*y is {}", 5 == *y); // dereferencing y
    println!("x==*y is {}", x == *y); //dereferencing y
} // =======================================================>>>

fn example3() {
    println!("--->>> Drop Trait: ");
} // =======================================================>>>

fn main() {
    println!(">>>>>--------------EXAMPLE1--------------<<<<<");
    example1();
    println!("\n\n>>>>>--------------EXAMPLE2--------------<<<<<");
    example2();
    println!("\n\n>>>>>--------------EXAMPLE3--------------<<<<<");
    example3();
}