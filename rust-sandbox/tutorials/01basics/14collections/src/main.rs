use std::collections::{HashMap, HashSet};

fn example1() {
    println!("--->>> Vector: ");
    let mut v = Vec::new();
    v.push(20);
    v.push(30);
    v.push(40);

    println!("size of vector is :{}", v.len());
    println!("{:?}", v);
    println!("is contains 10: {}", v.contains(&10));
    println!("is contains 20: {}", v.contains(&20));
    println!("size of vector is :{}", v.len());
    println!("elem by index [0]: {:?}", v[0]);
    print!("for by ref: ");
    for i in &v {
        print!("{}, ", i);
    }

    v.remove(1);
    println!("\nafter remove first: {:?}", v);

    print!("for: ");
    for i in v {
        print!("{}, ", i);
    }

    println!();
    println!();
    let v = vec![1, 2, 3];
    println!("{:?}", v);
} // =======================================================>>>
fn example2() {
    println!("--->>> HashMap: ");
    let mut stateCodes = HashMap::new();
    stateCodes.insert("KL", "Kerala");
    stateCodes.insert("MH", "Maharashtra");
    println!("map: {:?}", stateCodes);
    println!("size of map is {}", stateCodes.len());
    println!("contains key 'MH': {}", stateCodes.contains_key("MH"));

    print!("get: ");
    match stateCodes.get(&"KL") {
        Some(value) => {
            println!("Value for key KL is {}", value);
        }
        None => {
            println!("nothing found");
        }
    }

    print!("iter: ");
    for (key, val) in stateCodes.iter() {
        print!("key: {}, val: {} ||| ", key, val);
    }

    stateCodes.remove(&"MH");
    println!("\nafter remove 'MH': {:?}", stateCodes);
} // =======================================================>>>
fn example3() {
    println!("--->>> HashSet: ");
    let mut names = HashSet::new();

    names.insert("Mohtashim");
    names.insert("Kannan");
    names.insert("TutorialsPoint");
    names.insert("Mohtashim"); //duplicates not added

    println!("all elements: {:?}", names);
    println!("size of the set is {}", names.len());
    println!("contains 'Kannan': {}", names.contains("Kannan"));
    print!("iter: ");
    for name in names.iter() {
        print!("{}, ", name);
    }
    print!("\nget: ");
    match names.get(&"Mohtashim") {
        Some(value) => {
            print!("[found] - {}", value);
        }
        None => {
            print!("[not found]");
        }
    }
    names.remove("Kannan");
    println!("\nafter remove Kannan: {:?}", names);
} // =======================================================>>>
fn example4() {
    println!("--->>> Iterators: ");
    let a = [10, 20, 30];

    let mut iter = a.iter();
    // fetch an iterator object for the array
    println!("{:?}", iter);

    //fetch individual values from the iterator object
    println!("{:?}", iter.next());
    println!("{:?}", iter.next());
    println!("{:?}", iter.next());
    println!("{:?}", iter.next());

    print!("iter for: ");
    for data in a.iter() {
        print!("{}, ", data);
    }
} // =======================================================>>>
fn example5() {
    println!("--->>> iter() borrowind: ");
    // The iter() function uses the concept of borrowing. It returns a reference to
    // each element of the collection, leaving the collection untouched and available
    // for reuse after the loop.

    let names = vec!["Kannan", "Mohtashim", "Kiran"];
    for name in names.iter() {
        match name {
            &"Mohtashim" => println!("There is a rustacean among us!"),
            _ => println!("Hello {}", name),
        }
    }
    println!("{:?}", names);
} // =======================================================>>>
fn example6() {
    println!("--->>> into_iter(): ");
    // This function uses the concept of ownership. It moves values in the collection
    // into an iter object, i.e., the collection is consumed and it is no longer
    // available for reuse.
    let names = vec!["Kannan", "Mohtashim", "Kiran"];
    for name in names.into_iter() {
        match name {
            "Mohtashim" => println!("There is a rustacean among us!"),
            _ => println!("Hello {}", name),
        }
    }
    // cannot reuse the collection after iteration
    //println!("{:?}",names);
    //Error:Cannot access after ownership move
} // =======================================================>>>
fn example7() {
    println!("--->>> iter_mut(): ");
    // This function is like the iter() function. However, this function can
    // modify elements within the collection.
    let mut names = vec!["Kannan", "Mohtashim", "Kiran"];
    for name in names.iter_mut() {
        match name {
            &mut "Mohtashim" => println!("There is a rustacean among us!"),
            _ => println!("Hello {}", name),
        }
    }
    println!("{:?}", names);
    //// reusing the collection after iteration
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