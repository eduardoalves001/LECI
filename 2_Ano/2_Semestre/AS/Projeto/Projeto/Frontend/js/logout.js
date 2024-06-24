async function logout() {
    if (!localStorage.getItem('token')) return window.location.href = 'login.html';

    // HTTP request to the server to check if the token is valid
    const response = await fetch(`${baseUrlV1}/auth/logout`, {
        method: 'GET',
        headers: {
            "Authorization": "Bearer " + localStorage.getItem('token')
        }
    });

    localStorage.removeItem('token');
    window.location.href = 'login.html';
}