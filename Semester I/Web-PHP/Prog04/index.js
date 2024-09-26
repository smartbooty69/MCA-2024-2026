function isPrime(num) {
    if (num < 2) return false;
    for (let i = 2; i < num; i++) {
      if (num % i === 0) return false;
    }
    return true;
  }

  function displayPrimes() {
    let num = parseInt(document.getElementById("number").value);
    let result = '';
    for (let i = 2; i <= num; i++) {
      if (isPrime(i)) {
        result += i + ' ';
      }
    }
    document.getElementById("result").textContent = result.trim();
}