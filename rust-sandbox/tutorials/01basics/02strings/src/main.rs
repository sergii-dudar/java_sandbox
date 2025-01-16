fn example1() {
    println!("--->>> String literals: ");
    let company: &str = "TutorialsPoint";
    let location: &str = "Hyderabad";
    println!("company is : {} location :{}", company, location);

    // String literals are static by default. This means that string literals are
    // guaranteed to be valid for the duration of the entire program. We can also
    // explicitly specify the variable as static as shown below

    let company: &'static str = "TutorialsPoint";
    let location: &'static str = "Hyderabad";
    println!("company is : {} location :{}", company, location);
}
fn example2() {
    println!("--->>> String Object: ");
    // The String object type is provided in Standard Library. Unlike string literal, the string object type
    // is not a part of the core language. It is defined as public structure in standard library pub struct
    // String. String is a growable collection. It is mutable and UTF-8 encoded type. The String object type
    // can be used to represent string values that are provided at runtime. String object is allocated in the heap
    let empty_string = String::new();
    println!("length is {}", empty_string.len());

    let content_string = String::from("TutorialsPoint");
    println!("length is {}", content_string.len());
}
fn example3() {
    println!("--->>> String::new(): ");
    let mut z = String::new();
    z.push_str("hello");
    println!("{}", z);
}
fn example4() {
    println!("--->>> to_string(): ");
    let name1 = "Hello TutorialsPoint, Hello!".to_string();
    println!("{}", name1);
}
fn example5() {
    println!("--->>> replace(): ");
    let name1 = "Hello TutorialsPoint, Hello!".to_string(); //String object
    let name2 = name1.replace("Hello", "Howdy"); //find and replace
    println!("{}", name2);
}
fn example6() {
    println!("--->>> as_str(): ");
    let example_string = String::from("example_string");
    print_literal(example_string.as_str());
}
fn print_literal(data: &str) {
    println!("displaying string literal {}", data);
}

fn example7() {
    println!("--->>> push(): ");
    let mut company = "Tutorial".to_string();
    company.push('s');
    println!("{}", company);
}
fn example8() {
    println!("--->>> push_str(): ");
    let mut company = "Tutorials".to_string();
    company.push_str(" Point");
    println!("{}", company);
}
fn example9() {
    println!("--->>> len(): ");
    let fullname = " Tutorials Point";
    println!("length is {}", fullname.len());
}
fn example10() {
    println!("--->>> trim(): ");
    let fullname = " Tutorials Point \r\n";
    println!("Before trim ");
    println!("length is {}", fullname.len());
    println!();
    println!("After trim ");
    println!("length is {}", fullname.trim().len());
}
fn example11() {
    println!("--->>> split_whitespace(): ");
    let msg = "Tutorials Point has good tutorials".to_string();
    let mut i = 1;

    for token in msg.split_whitespace() {
        println!("token {} {}", i, token);
        i += 1;
    }
}
fn example12() {
    println!("--->>> split(): ");
    let fullname = "Kannan,Sudhakaran,Tutorialspoint";

    for token in fullname.split(",") {
        println!("token is {}", token);
    }

    //store in a Vector
    println!("\n");
    let tokens: Vec<&str> = fullname.split(",").collect();
    println!("firstName is {}", tokens[0]);
    println!("lastname is {}", tokens[1]);
    println!("company is {}", tokens[2]);
}
fn example13() {
    println!("--->>> chars(): ");
    let n1 = "Tutorials".to_string();

    for n in n1.chars() {
        println!("{}", n);
    }
}
fn example14() {
    println!("--->>> Concatenation of Strings: ");
    let n1 = "Tutorials".to_string();
    let n2 = "Point".to_string();

    let n3 = n1 + " " + &n2; // n2 reference is passed
    println!("{}", n3);
}
fn example15() {
    println!("--->>> Type Casting: ");
    let number = 2020;
    let number_as_string = number.to_string();

    // convert number to string
    println!("{}", number_as_string);
    println!("{}", number_as_string == "2020");
}
fn example16() {
    println!("--->>> Format! Macro: ");
    let n1 = "Tutorials".to_string();
    let n2 = "Point".to_string();
    let n3 = format!("{} {}", n1, n2);
    println!("{}", n3);
}
fn example17() {
    println!("--->>> : ");
}
fn example18() {
    println!("--->>> : ");
}
fn example19() {
    println!("--->>> : ");
}
fn example20() {
    println!("--->>> : ");
}

fn main() {
    println!(">>>>>--------------EXAMPLE1--------------<<<<<");
    example1();
    println!("\n\n>>>>>--------------EXAMPLE2--------------<<<<<");
    example2();
    println!("\n\n>>>>>--------------EXAMPLE3 Common Methods - String Object--------------<<<<<");
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
