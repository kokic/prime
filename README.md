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

## Benchmark

```
$ moon bench -p kokic/prime/benchmarks --target native

name                        time (mean ± σ)         range (min … max) 
kokic/prime BPSW               1.36 ms ±   9.23 µs     1.35 ms …   1.37 ms  in 10 ×     74 runs
core/math is_probable_prime   17.80 ms ± 200.94 µs    17.50 ms …  17.98 ms  in 10 ×      6 runs
```
