extern crate movies_lib;
use movies_lib::movies::play;

fn main() {
    println!("inside main of test ");
    play("Tutorialspoint".to_string())
}

// cd movie-lib
// cargo build

// cd movie-lib-test
// cargo build
// cargo run
