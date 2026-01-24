///|
pub fn is_even(n : BigInt) -> Bool {
  (
  // Fixed in Jan 9, 2026: 
  //   `n & 1` panic for n is large even (≥ 2^32)
  // Also see: https://github.com/moonbitlang/core/issues/3133 
    n & 1
  ) ==
  0
}

///|
pub fn is_odd(n : BigInt) -> Bool {
  (n & 1) == 1
}

///|
pub fn euclid_mod(a : BigInt, n : BigInt) -> BigInt {
  let r = a.mod(n)
  guard r < 0 else { r }
  r + n
}

///|
pub fn to_binary_bits(x : BigInt) -> Array[Int] {
  guard !x.is_zero() else { [0] }
  let mut x = x
  let bits : Array[Int] = []
  while x > 0 {
    let bit = x.mod(2)
    match bit.is_zero() {
      true => bits.push(0)
      _ => bits.push(1)
    }
    x = x / 2
  }
  bits.rev()
}

///|
test "BigInt to binary bits" {
  inspect(
    to_binary_bits(BigInt::from_string("1919802127"))
    .map(x => x.to_string())
    .join(""),
    content="1110010011011011101101100001111",
  )
}

///|
pub fn abs(x : BigInt) -> BigInt {
  guard x < 0 else { x }
  -x
}
