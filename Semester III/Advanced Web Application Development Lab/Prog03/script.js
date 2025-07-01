function getDOB() {
    // Get the values from the input fields
    const dobInput = document.getElementById('dob').value;
    const currentDateInput = document.getElementById('cdate').value;
    // Validate if both dates are provided
    if (!dobInput || !currentDateInput) {
        alert('Please enter both Date of Birth and Current Date.');
        return;
    }
    // Convert input values to Date objects
    const dob = new Date(dobInput);
    const currentDate = new Date(currentDateInput);
    if (dob > currentDate) {
        alert('Date of Birth cannot be after Current Date.');
        return;
    }
    // Calculate years, months, days
    let years = currentDate.getFullYear() - dob.getFullYear();
    let months = currentDate.getMonth() - dob.getMonth();
    let days = currentDate.getDate() - dob.getDate();

    if (days < 0) {
        months--;
        // Get days in previous month
        let prevMonth = new Date(currentDate.getFullYear(), currentDate.getMonth(), 0);
        days += prevMonth.getDate();
    }
    if (months < 0) {
        years--;
        months += 12;
    }
    document.getElementById('currentAge').textContent = `Your age is ${years} years, ${months} months and ${days} days.`;
} 