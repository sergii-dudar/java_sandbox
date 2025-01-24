fn example1() {
    println!("--->>> Vars Shadowing: ");
    let x = 5;

    let x = x + 1;

    {
        let x = x * 2;
        println!("The value of x in the inner scope is: {x}");
    }
    println!("The value of x is: {x}");
} // =======================================================>>>
fn example2() {
    println!("--->>> Parse number: ");
    let guess: u32 = "42".parse().expect("Not a number!");
    println!("{}", guess)
} // =======================================================>>>
fn example3() {
    println!("--->>> Tuple: ");
    let tup: (i32, f64, u8) = (500, 6.4, 1);
    println!("The value of y is: {:?}", tup);

    let (x, y, z) = tup;
    println!("Destructed values are: {}, {}, {}", x, y, z);

    let one = tup.0;
    let two = tup.1;
    let three = tup.2;
    println!("Accessed values are: {}, {}, {}", one, two, three);
} // =======================================================>>>
fn example4() {
    println!("--->>> : ");
} // =======================================================>>>

fn main() {
    println!(">>>>>--------------EXAMPLE1--------------<<<<<");
    example1();
    println!("\n\n>>>>>--------------EXAMPLE2--------------<<<<<");
    example2();
    println!("\n\n>>>>>--------------EXAMPLE3--------------<<<<<");
    example3();
    println!("\n\n>>>>>--------------EXAMPLE4--------------<<<<<");
    example4();
    println!("\n\n>>>>>--------------EXAMPLE5--------------<<<<<");
}