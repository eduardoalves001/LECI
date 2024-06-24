async function getAuctionInfo() {
    if (!localStorage.getItem('token')) return window.location.href = 'login.html';

    const urlParams = new URLSearchParams(window.location.search);
    const auctionId = urlParams.get('id');
    if (!auctionId) return window.location.href = 'auction.html';

    const response = await fetch(`${baseUrlV1}/auctions/${auctionId}`, {
        method: 'GET',
    });

    if (response.status === 401) return window.location.href = 'login.html';
    if (response.status !== 200) return window.location.href = 'auction.html';

    const { auction } = await response.json();

    document.getElementById('auctionItem-name').innerHTML = auction.name;
    document.getElementById('auctionItem-image').src = auction.image;
    document.getElementById('auctionItem-image').alt = auction.name;
    for (const bid of auction.history) {
        const li = document.createElement('li');
        const date = new Date(bid.date);
        li.innerHTML = `[${date.toLocaleDateString()}] ${await getUserName(bid.user_id)} - ${bid.amount}€`;
        document.getElementById('auctionItem-history').appendChild(li);
    }
}

async function getUserName(userId) {
    const response = await fetch(`${baseUrlV1}/users/${userId}`, {
        method: 'GET',
    });

    if (response.status !== 200) return 'Unknown user';

    const { user } = await response.json();
    return user.name;
}