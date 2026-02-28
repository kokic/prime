///|
fn trial_division_prime(n : Int) -> Bool {
  guard n >= 2 else { false }
  guard n != 2 else { true }
  guard n % 2 != 0 else { false }

  let mut i = 3
  while i * i <= n {
    if n % i == 0 {
      return false
    }
    i = i + 2
  }
  true
}

///|
test "is_small_prime exact for [0, 10000)" {
  for n = 0; n < 10000; n = n + 1 {
    assert_eq(is_small_prime(n), trial_division_prime(n))
  }
}

///|
test "is_small_prime boundary regression" {
  assert_true(!is_small_prime(0))
  assert_true(!is_small_prime(1))
  assert_true(is_small_prime(2))
  assert_true(is_small_prime(3))
  assert_true(is_small_prime(5381))
  assert_true(is_small_prime(5387))
  assert_true(is_small_prime(5393))
  assert_true(is_small_prime(9973))
  assert_true(!is_small_prime(9999))
  assert_true(!is_small_prime(10000))
}

///|
test "is_prime boundary regression" {
  assert_true(!is_prime(-1))
  assert_true(!is_prime(0))
  assert_true(!is_prime(1))
  assert_true(is_prime(2))
  assert_true(is_prime(3))
  assert_true(is_prime(5381))
  assert_true(is_prime(5387))
  assert_true(is_prime(9973))
  assert_true(!is_prime(9999))
  assert_true(!is_prime(10000))
  assert_true(!is_prime(10001))
  assert_true(is_prime(10007))
}
