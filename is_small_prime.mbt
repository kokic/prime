///|
const PIERRE_DUSART_BOUNDARY : Int = 5393

///|
const MAX_ERROR_OFFSET : Int = 16

///|
const SMALL_PRIME_LIMIT : Int = 10000

///|
fn chebyshev_approx(n : Int) -> Double {
  n.to_double() / @math.ln(n.to_double())
}

///|
fn fast_error(n : Int) -> Double {
  n.to_double() / 64 - 1
}

///|
/// ∀ n ≤ 5392, `effective_chebyshev_approx ≤ π(n)`. 
fn effective_chebyshev_approx(n : Int) -> Double {
  chebyshev_approx(n) + fast_error(n)
}

///|
/// ∀ n ≥ 5393, `pierre_dusart_approx ≤ π(n)`.
/// 
/// Also see: https://en.wikipedia.org/wiki/Prime-counting_function#Inequalities
fn pierre_dusart_approx(n : Int) -> Double {
  n.to_double() / (@math.ln(n.to_double()) - 1)
}

///|
fn small_approx(n : Int) -> Double {
  guard n < PIERRE_DUSART_BOUNDARY else { pierre_dusart_approx(n) }
  effective_chebyshev_approx(n)
}

///|
pub fn is_small_prime(n : Int) -> Bool {
  guard n >= 2 else { false }
  guard n != 2 && n != 3 else { true }
  guard n < SMALL_PRIME_LIMIT else { false }
  guard n % 2 != 0 else { false }
  let min_index = (small_approx(n).to_int() - 1).max(0)
  let max_index = (min_index + MAX_ERROR_OFFSET).min(SMALL_PRIMES_LENGTH)
  for i = min_index; i < max_index; i = i + 1 {
    let prime = small_primes[i]
    if n == prime {
      return true
    }
  }
  false
}
