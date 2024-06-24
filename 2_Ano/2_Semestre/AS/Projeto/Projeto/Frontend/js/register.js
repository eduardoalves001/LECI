async function register() {
    const name = document.getElementById('nameInput').value;
    const email = document.getElementById('emailInput').value;
    const password = document.getElementById('passwordInput').value;
    const contact = document.getElementById('contactInput').value;
    const address = document.getElementById('addressInput').value;
    const response = await fetch(`${baseUrlV1}/users`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ name, email, password, contact, address })
    });
    const data = await response.json()
    if (response.status === 200) {
        window.location.href = 'login.html';
    } else {;
        alert(data.error);
    }
}