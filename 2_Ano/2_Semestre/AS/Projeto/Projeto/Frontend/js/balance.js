async function displayBalance() {
    const token = localStorage.getItem('token');
    if (!token) return window.location.href = 'login.html';

    const response = await fetch(`${baseUrlV1}/users/me`, {
        method: 'GET',
        headers: {
            "Authorization": "Bearer " + localStorage.getItem('token')
        }
    });

    if (response.status === 401) return window.location.href = 'login.html';
    if (response.status !== 200) return window.location.href = 'auction.html';

    const { user } = await response.json();
    document.getElementById('balance').innerHTML = user.balance;
}