use std::fs::File;

fn example1() {
    println!("--->>> panic - unrecoverable: ");
    let no = 12;
    //try with odd and even
    if no % 2 == 0 {
        println!("Thank you , number is even");
    } else {
        panic!("NOT_AN_EVEN");
    }
    println!("End of main");
} // =======================================================>>>
fn example2() {
    println!("--->>> Result Enum and Recoverable Errors: ");
    let f = File::open("main.jpg"); //this file does not exist
    match f {
        Ok(f) => {
            println!("file found {:?}", f);
        }
        Err(e) => {
            println!("file not found \n{:?}", e); //handled error
        }
    }
    println!("end of main");
} // =======================================================>>>
fn is_even(no: i32) -> Result<bool, String> {
    if no % 2 == 0 {
        return Ok(true);
    } else {
        return Err("NOT_AN_EVEN".to_string());
    }
}
fn example3() {
    println!("--->>> : ");
    let result = is_even(13);
    match result {
        Ok(d) => {
            println!("no is even {}", d);
        }
        Err(msg) => {
            println!("Error msg is {}", msg);
        }
    }
    println!("end of main");
} // =======================================================>>>
fn example4() {
    println!("--->>> unwrap(): ");
    let result = is_even(10).unwrap();
    println!("result is {}", result);
    println!("end of main");
} // =======================================================>>>
fn example5() {
    println!("--->>> expect(): ");
    // let f = File::open("pqr.txt").expect("File not able to open");
    //file does not exist
    println!("end of main");
} // =======================================================>>>
fn example6() {
    println!("--->>> : ");
} // =======================================================>>>
fn example7() {
    println!("--->>> : ");
} // =======================================================>>>
fn example8() {
    println!("--->>> : ");
} // =======================================================>>>
fn example9() {
    println!("--->>> : ");
} // =======================================================>>>
fn example10() {
    println!("--->>> : ");
} // =======================================================>>>
fn example11() {
    println!("--->>> : ");
} // =======================================================>>>
fn example12() {
    println!("--->>> : ");
} // =======================================================>>>
fn example13() {
    println!("--->>> : ");
} // =======================================================>>>
fn example14() {
    println!("--->>> : ");
} // =======================================================>>>
fn example15() {
    println!("--->>> : ");
} // =======================================================>>>
fn example16() {
    println!("--->>> : ");
} // =======================================================>>>
fn example17() {
    println!("--->>> : ");
} // =======================================================>>>
fn example18() {
    println!("--->>> : ");
} // =======================================================>>>
fn example19() {
    println!("--->>> : ");
} // =======================================================>>>
fn example20() {
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