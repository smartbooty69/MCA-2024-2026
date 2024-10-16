function isPrime(num) {
  if (num < 2) return false;
  for (let i = 2; i <= Math.sqrt(num); i++) {
    if (num % i === 0) return false;
  }
  return true;
}

function displayPrimesBetween() {
  let result = '';
  try {
    let M = parseInt(document.getElementById("numberM").value);
    let N = parseInt(document.getElementById("numberN").value);

    if (isNaN(M) || isNaN(N)) {
      throw new Error("Both inputs must be valid numbers.");
    }
    if (M < 2 || N < 2) {
      throw new Error("Both numbers must be greater than or equal to 2.");
    }
    if (M > N) {
      throw new Error("Starting number (M) must be less than or equal to the ending number (N).");
    }

    for (let i = M; i <= N; i++) {
      if (isPrime(i)) {
        result += i + ' ';
      }
    }

    if (result === '') {
      result = 'No prime numbers found in the given range.';
    }

  } catch (error) {
    result = `Error: ${error.message}`;
  } finally {
    document.getElementById("result").textContent = result.trim();
  }
}