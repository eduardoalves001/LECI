var button = document.getElementById("Submit");

button.addEventListener("click", function() {
    var bid = document.getElementById("bid").value;
    var displayBalance = balance;



    if (!isNaN(bid) && validateCurrencyFormat(bid) && bid <= displayBalance) {
        addBidToHistory(bid);
    } else if (bid > displayBalance) {
        window.alert("insufficient funds");
    } else {
        window.alert("You must enter a valid currency")
    }
    var new_balance = displayBalance - bid;
    displayBalance2(new_balance);
});

function validateCurrencyFormat(bid) {
    // Regular expression pattern to match the desired formats
    var pattern = /^[1-9]\d*(((,\d{3}){1})?(\.\d{0,2})?)$/;
    // Check if the number matches the pattern
    return pattern.test(bid);
}

function addBidToHistory(bid) {
    var bidHistory = document.getElementById("bidHistory");
    var li = document.createElement("li");
    li.textContent = "You bade " + bid + "€";
    bidHistory.appendChild(li);
}

function displayBalance2(new_balance) {
    var balanceElement = document.getElementById("balance");
    balanceElement.textContent = new_balance;
}


function displayBalance2(balance) {
    var balanceElement = document.getElementById("balance");
    balanceElement.textContent = balance;
}