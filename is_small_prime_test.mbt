///|
test "Is small prime" {
  assert_true(is_small_prime(2))
  assert_true(is_small_prime(3))
  assert_true(is_small_prime(5))
  assert_true(is_small_prime(7))
  assert_true(is_small_prime(2011))
  assert_true(is_small_prime(2017))
  assert_true(is_small_prime(2027))
  assert_true(is_small_prime(9973))
  assert_true(!is_small_prime(9974))
  assert_true(!is_small_prime(9975))
  assert_true(!is_small_prime(9976))
  assert_true(!is_small_prime(9977))
  assert_true(!is_small_prime(9999))
}

///|
test "Effective Chebyshev approximation" {
  let nearby_index = n => effective_chebyshev_approx(n).to_int()

  // 941, 947, 953, 967, 971, 977, 983, 991, 997, 
  inspect(small_primes[nearby_index(1000)], content="941")

  // 1931, 1933, 1949, 1951, 1973, 1979, 1987, 1993, 1997, 1999
  inspect(small_primes[nearby_index(2000)], content="1931")

  // 2909, 2917, 2927, 2939, 2953, 2957, 2963, 2969, 2971, 2999
  inspect(small_primes[nearby_index(3000)], content="2909")

  // 3923, 3929, 3931, 3943, 3947, 3967, 3989
  inspect(small_primes[nearby_index(4000)], content="3923")

  // 4969, 4973, 4987, 4993, 4999
  inspect(small_primes[nearby_index(5000)], content="4969")

  // (none)
  inspect(small_primes[nearby_index(5392)], content="5393")
}

///|
test "Pierre Dusart approximation" {
  let nearby_index = n => pierre_dusart_approx(n).to_int()

  // (none)
  inspect(small_primes[nearby_index(5393)], content="5393")

  // 5939, 5953, 5981, 5987
  inspect(small_primes[nearby_index(6000)], content="5939")

  // 6949, 6959, 6961, 6967, 6971, 6977, 6983, 6991, 6997
  inspect(small_primes[nearby_index(7000)], content="6949")

  // 7933, 7937, 7949, 7951, 7963, 7993
  inspect(small_primes[nearby_index(8000)], content="7933")

  // 8933, 8941, 8951, 8963, 8969, 8971, 8999
  inspect(small_primes[nearby_index(9000)], content="8933")

  // 9871, 9883, 9887, 9901, 9907, 9923, 9929, 9931, 9941, 9949, 9967, 9973
  inspect(small_primes[nearby_index(10000)], content="9871")
}
