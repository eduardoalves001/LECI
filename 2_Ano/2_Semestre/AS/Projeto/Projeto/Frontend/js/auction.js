async function getAuctions() {
    const response = await fetch(`${baseUrlV1}/auctions`);
    const { auctions } = await response.json();
    return auctions;
}

async function loadAuctions() {
    const auctionsDiv = document.getElementById('auctions');
    auctionsDiv.innerHTML = '';

    const auctionRow = document.createElement('div');
    auctionRow.classList.add('row');
    for (const auction of await getAuctions()) {
        const auctionCol = document.createElement('div');
        auctionCol.classList.add('column');
        const figure = document.createElement('figure');
        const div = document.createElement('div');
        div.classList.add('auctionItem');
        const img = document.createElement('img');
        img.src = auction.image;
        img.alt = auction.name;
        const h1 = document.createElement('h1');
        h1.textContent = "Starting at " + auction.start_price + "€";
        const button = document.createElement('button');
        button.textContent = "Click Here to Bid";
        button.addEventListener('click', () => {
            window.location.href = `auctionitem.html?id=${auction.id}`;
        });
        div.appendChild(img);
        div.appendChild(h1);
        div.appendChild(button);
        figure.appendChild(div);
        auctionCol.appendChild(figure);
        auctionRow.appendChild(auctionCol);
    }
    auctionsDiv.appendChild(auctionRow);
}
