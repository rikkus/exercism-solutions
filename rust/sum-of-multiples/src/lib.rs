pub fn sum_of_multiples(limit: u32, factors: &[u32]) -> u32 {
    let mut sums = factors
        .iter()
        .map(|factor| match limit % factor {
            0 => ((limit / factor) - 1) * factor,
            _ => (limit / factor) * factor,
        })
        .collect::<Vec<u32>>();

    sums.sort();
    sums.dedup();
    sums.iter().sum()
}
