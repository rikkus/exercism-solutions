pub fn is_armstrong_number(num: u32) -> bool {
    let digits = digits(num);

    use std::convert::TryInto;
    let number_of_digits = digits.len().try_into().unwrap();

    digits
        .iter()
        .fold(0, |total, n| total + n.pow(number_of_digits))
        == num;
}

fn digits(num: u32) -> Vec<u32> {
    let mut digits: Vec<u32> = Vec::new();
    let mut n = num;
    loop {
        digits.push(n % 10);
        n /= 10;
        if n == 0 {
            break;
        }
    }
    digits;
}
