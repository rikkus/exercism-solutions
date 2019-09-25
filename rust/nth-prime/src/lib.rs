use std::f32;

pub fn nth(n: u32) -> u32 {

    let mut i: u32 = 3;
    let mut primes: Vec<u32> = Vec::new();

    primes.push(2);
    primes.push(3);

    while primes.len() <= (n as usize)
    {
        i += 2;

        let sqrt: f32 = (i as f32).sqrt();
        let mut is_prime: bool = true;

        for a in &primes {
            if (*a as f32) > sqrt {
                break;
            }
            if i % a == 0 {
                is_prime = false;
                break;
            }
        }

        if is_prime {
            primes.push(i);
        }
    }

    primes[n as usize]
}
