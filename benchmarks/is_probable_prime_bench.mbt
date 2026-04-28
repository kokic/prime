///|
fn prime_bench_cases() -> Array[BigInt] {
  [
    10007, 1919802127, 626290517014499, 83318820587408930933, 115792125365684818504981760053,
    1000006000009, 3215031751, 3825123056546413051,
  ]
}

///|
test "is_probable_prime benchmark" (b : @bench.T) {
  let cases = prime_bench_cases()
  b.bench(name="kokic/prime BPSW", fn() {
    for n in cases {
      b.keep(@prime.is_probable_prime_bpsw(n))
    }
  })

  let rand = @random.Rand::new()
  b.bench(name="core/math is_probable_prime", fn() {
    for n in cases {
      b.keep(@math.is_probable_prime(n, rand))
    }
  })
}
