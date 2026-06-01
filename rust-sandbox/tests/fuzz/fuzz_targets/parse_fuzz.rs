#![no_main]
//! Fuzz the `parse_config` parser: feed arbitrary bytes, ensure no panic.

use libfuzzer_sys::fuzz_target;

fuzz_target!(|data: &[u8]| {
    if let Ok(s) = std::str::from_utf8(data) {
        let _ = test1::parser::parse_config(s);
    }
});
