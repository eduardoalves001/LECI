async function getProfileInfo() {
    if (!localStorage.getItem('token')) return window.location.href = 'login.html';

    const response = await fetch(`${baseUrlV1}/users/me`, {
        method: 'GET',
        headers: {
            "Authorization": "Bearer " + localStorage.getItem('token')
        }
    });

    if (response.status === 401) return window.location.href = 'login.html';

    const { user } = await response.json();

    document.getElementById('profile-name').innerHTML = user.name;
    document.getElementById('profile-email').innerHTML = user.email;
    document.getElementById('profile-contact').innerHTML = user.contact;
    document.getElementById('profile-address').innerHTML = user.address;
}