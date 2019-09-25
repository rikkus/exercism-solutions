pub fn square_of_sum(n: u32) -> u32 {
    (1..=n).sum::<u32>().pow(2)
}

pub fn sum_of_squares(n: u32) -> u32 {
    (1..=n).map(|n| n.pow(2)).sum::<u32>()
}

pub fn difference(n: u32) -> u32 {
    // Thanks, Internet!
    (((n.pow(2)) * (n + 1).pow(2)) / 4) - (n * (n + 1) * (2 * n + 1) / 6)
}
