async function login() {
    const email = document.getElementById('emailInput').value;
    const password = document.getElementById('passwordInput').value;
    const response = await fetch(`${baseUrlV1}/auth/login`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ email, password })
    });
    const data = await response.json()
    if (response.status === 200) {
        localStorage.setItem('token', data.token);
        // Get the redirect URL from the query parameters
        const urlParams = new URLSearchParams(window.location.search);
        const redirect = urlParams.get('redirect') ?? 'index.html';
        window.location.href = redirect;
    } else {;
        alert(data.error);
    }
}