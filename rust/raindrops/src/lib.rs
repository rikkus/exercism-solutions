pub fn raindrops(n: u32) -> String {
    let s = [
        (if n % 3 == 0 { "Pling" } else { "" }),
        (if n % 5 == 0 { "Plang" } else { "" }),
        (if n % 7 == 0 { "Plong" } else { "" }),
    ]
    .concat();

    if s.is_empty() {
        n.to_string()
    } else {
        s.to_string()
    }
}
