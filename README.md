# Prime

Efficient primality testing for MoonBit `BigInt`.

## Public API

- `is_prime(n)`:
  - Uses `is_small_prime` for `n < 10_000`.
  - Uses `is_probable_prime_bpsw` for `n >= 10_000`.
- `is_small_prime(n)`:
  - Exact primality check for `Int` values in `[0, 10_000)`.
- `is_probable_prime_bpsw(n)`:
  - Baillie-Pomerance-Selfridge-Wagstaff (BPSW) probable-prime test.
  - Fast in practice and has no known counterexample, but is still a probable-prime test.

## Notes

- The small-number path is optimized with a precomputed prime table and a narrow lookup window.
- The large-number path combines Miller-Rabin (base 2) and strong Lucas-Selfridge.
