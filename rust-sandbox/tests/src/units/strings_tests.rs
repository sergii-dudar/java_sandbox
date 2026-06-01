use crate::strings::*;

#[test]
fn reverse_basic() {
    assert_eq!(reverse("hello"), "olleh");
}

#[test]
fn reverse_empty() {
    assert_eq!(reverse(""), "");
}

#[test]
fn reverse_unicode() {
    assert_eq!(reverse("aébc"), "cbéa");
}

#[test]
fn palindrome_simple() {
    assert!(is_palindrome("racecar"));
}

#[test]
fn palindrome_phrase() {
    assert!(is_palindrome("A man, a plan, a canal: Panama"));
}

#[test]
fn palindrome_negative() {
    assert!(!is_palindrome("hello"));
}

#[test]
fn word_count_works() {
    assert_eq!(word_count("the quick brown fox"), 4);
    assert_eq!(word_count("  spaced   out  "), 2);
    assert_eq!(word_count(""), 0);
}

#[test]
fn capitalize_basic() {
    assert_eq!(capitalize("rust"), "Rust");
    assert_eq!(capitalize(""), "");
}

#[test]
fn shout_works() {
    assert_eq!(shout("loud"), "LOUD");
}

mod edge_cases {
    use crate::strings::*;

    #[test]
    fn whitespace_only_is_palindrome_after_filtering() {
        assert!(is_palindrome("   "));
    }

    #[test]
    fn capitalize_already_capital() {
        assert_eq!(capitalize("Rust"), "Rust");
    }
}
