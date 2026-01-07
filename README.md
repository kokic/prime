
# Prime

An efficient implementation of primality testing in MoonBit. 

- Function `is_prime` calls `is_small_prime` (n < 1000) or `is_probable_prime_bpsw` (otherwise). 
- Function `is_small_prime` has 𝒪(1) time complexity for small primes (≤ 10,000).
- For larger numbers, function `is_probable_prime_bpsw` using the Baillie–Pomerance–Selfridge–Wagstaff (BPSW) test. 
