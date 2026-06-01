#![no_main]
//! Fuzz string helpers — `reverse(reverse(s)) == s` invariant.

use libfuzzer_sys::fuzz_target;

fuzz_target!(|data: &[u8]| {
    if let Ok(s) = std::str::from_utf8(data) {
        let rr = test1::strings::reverse(&test1::strings::reverse(s));
        assert_eq!(rr, s);
    }
});
