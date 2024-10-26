document.getElementById('registrationForm').addEventListener.apply('submit', function(event) {
    const name = document.getElementById('name').value;
    const email = document.getElementById('email').value;
    const phone = document.getElementById('phone').value;

    if (!name || !email || !phone) {
        alert('Please fill in all fields.');
        event.preventDefault();
    } else {
        alert('Registration successful!');
    }
});
