async function checkAuth() {
    if (!localStorage.getItem('token')) return window.location.href = `login.html?redirect=${window.location.pathname}`;

    // HTTP request to the server to check if the token is valid
    const response = await fetch(`${baseUrlV1}/auth/valid`, {
        method: 'GET',
        headers: {
            "Authorization": "Bearer " + localStorage.getItem('token')
        }
    });

    // If the token is not valid, redirect to login page
    if (response.status !== 200) return window.location.href = `login.html?redirect=${window.location.pathname}`;
}