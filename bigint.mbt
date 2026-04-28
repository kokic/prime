///|
fn is_even(n : BigInt) -> Bool {
  (
  // Fixed in Jan 9, 2026: 
  //   `n & 1` panic for n is large even (≥ 2^32)
  // Also see: https://github.com/moonbitlang/core/issues/3133 
    n & 1
  ) ==
  0
}

///|
fn is_odd(n : BigInt) -> Bool {
  (n & 1) == 1
}

///|
fn euclid_mod(a : BigInt, n : BigInt) -> BigInt {
  let r = a.mod(n)
  guard r < 0 else { r }
  r + n
}

///|
fn abs(x : BigInt) -> BigInt {
  guard x < 0 else { x }
  -x
}
