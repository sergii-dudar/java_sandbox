fn example1() {
    let company_string = "TutorialsPoint"; // string type
    let rating_float = 4.5; // float type
    let is_growing_boolean = true; // boolean type
    let icon_char = '♥'; //unicode character type
    let isfun: bool = true;

    println!("company name is:{}", company_string);
    println!("company rating on 5 is:{}", rating_float);
    println!("company is growing :{}", is_growing_boolean);
    println!("company icon is:{}", icon_char);
    println!("Is Rust Programming Fun ? {}", isfun);

    // Char
    let special_character = '@'; //default
    let alphabet: char = 'A';
    let emoji: char = '😁';

    println!("special character is {}", special_character);
    println!("alphabet is {}", alphabet);
    println!("emoji is {}", emoji);
}
fn example2() {
    /*
    Integer:
    Sr.No.	Size	Signed	Unsigned
    1       8 bit	i8      u8
    2       16 bit	i16     u16
    3       32 bit	i32     u32
    4       64 bit	i64     u64
    5       128 bit	i128	u128
    6       Arch	isize	usize
    */
    let result = 10; // i32 by default
    let age: u32 = 20;
    let sum: i32 = 5 - 15;
    let mark: isize = 10;
    let count: usize = 30;
    let int_with_separator = 50_000;

    println!("result value is {}", result);
    println!("sum is {} and age is {}", sum, age);
    println!("mark is {} and count is {}", mark, count);
    println!("int value {}", int_with_separator);

    // // Integer Overflow
    // let age: u8 = 255;
    //
    // // 0 to 255 only allowed for u8
    // let weight: u8 = 256; //overflow value is 0
    // let height: u8 = 257; //overflow value is 1
    // let score: u8 = 258; //overflow value is 2
    //
    // println!("age is {} ", age);
    // println!("weight is {}", weight);
    // println!("height is {}", height);
    // println!("score is {}", score);
}
fn example3() {
    // Float
    // Float data type in Rust can be classified as f32 and f64.
    // The f32 type is a single-precision float, and f64 has double precision.
    // The default type is f64
    let result = 10.00; //f64 by default
    let interest: f32 = 8.35;
    let cost: f64 = 15000.600; //double precision
    let float_with_separator = 11_000.555_001;

    println!("result value is {}", result);
    println!("interest is {}", interest);
    println!("cost is {}", cost);
    println!("float value {}", float_with_separator);

    // automatic type casting not allowed, error
    // let interest: f32 = 8; // integer assigned to float variable
}
fn example4() {}
fn example5() {}
fn example6() {}
fn example7() {}
fn example8() {}
fn example9() {}
fn example10() {}
fn example11() {}
fn example12() {}
fn example13() {}
fn example14() {}
fn example15() {}
fn example16() {}
fn example17() {}
fn example18() {}
fn example19() {}
fn example20() {}

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
    example5();
    println!("\n\n>>>>>--------------EXAMPLE6--------------<<<<<");
    example6();
    println!("\n\n>>>>>--------------EXAMPLE7--------------<<<<<");
    example7();
    println!("\n\n>>>>>--------------EXAMPLE8--------------<<<<<");
    example8();
    println!("\n\n>>>>>--------------EXAMPLE9--------------<<<<<");
    example9();
    println!("\n\n>>>>>--------------EXAMPLE10--------------<<<<<");
    example10();
    println!("\n\n>>>>>--------------EXAMPLE11--------------<<<<<");
    example11();
    println!("\n\n>>>>>--------------EXAMPLE12--------------<<<<<");
    example12();
    println!("\n\n>>>>>--------------EXAMPLE13--------------<<<<<");
    example13();
    println!("\n\n>>>>>--------------EXAMPLE14--------------<<<<<");
    example14();
    println!("\n\n>>>>>--------------EXAMPLE15--------------<<<<<");
    example15();
    println!("\n\n>>>>>--------------EXAMPLE16--------------<<<<<");
    example16();
    println!("\n\n>>>>>--------------EXAMPLE17--------------<<<<<");
    example17();
    println!("\n\n>>>>>--------------EXAMPLE18--------------<<<<<");
    example18();
    println!("\n\n>>>>>--------------EXAMPLE19--------------<<<<<");
    example19();
    println!("\n\n>>>>>--------------EXAMPLE20--------------<<<<<");
    example20();
}
