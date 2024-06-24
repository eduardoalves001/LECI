function getGames(day, month) {
    return new Promise((resolve, reject) => {
        // Fetch the JSON data
        
        let filepath = "static/files/games/games"+month+".json";
        fetch(filepath)
            .then(response => response.json())
            .then(data => {
                // parse the CSV string into an array of objects
                resolve(data["Date"][`${day}`])
            })
            .catch(error => {
                console.error('Error fetching JSON data:', error);
                reject(error);
            });
    });
}   
  
function selectButton(buttonId, i) {
  // Get all buttons in the button group
  const buttons = document.querySelectorAll(`.button-group button`);
  // Remove the 'selected' class from all buttons
  buttons.forEach((button) => {
      if (`game${i}` === button.className.split(" ")[0] ) {
          button.classList.remove('selected');   
      }
  });

  // Add the 'selected' class to the clicked button
  const selectedButton = document.getElementById(buttonId);
  selectedButton.classList.add('selected');
}
// Function to populate the player dropdown based on the selected team

function changePlayers(team1, team2) {
  let teamDropdown = document.getElementById("team");    
  if(teamDropdown.value == team1) {
      getTeamPlayers(team1)
  } else {
      getTeamPlayers(team2)
  }
}
function getTeamPlayers(team) {
  return new Promise((resolve, reject) => {
      // Fetch the JSON data
      
      let file = 'static/files/teams/'+team+'.json';
      fetch(file)
          .then(response =>  response.json())
          .then(data => {
              resolve(data["Players"]);
          })
          .catch(error => {
              console.error('Error fetching JSON data:', error);
              reject(error);
          });
  });
}
function darkMode() {
  if (localStorage.getItem('theme') == 'dark') {
      toggleDarkMode();
      if(document.getElementById('checkbox').checked) {
        localStorage.setItem('checkbox', true);
      }
    }
    
}
function toggleDarkMode() {
  let isDark = document.body.classList.toggle('darkmode');
  if (isDark) {
    toggleDarkMode.checked = true;
    localStorage.setItem('theme','dark');
    document.getElementById('checkbox').setAttribute('checked', 'checked');
  } else {
    toggleDarkMode.checked = false;
    localStorage.removeItem('theme', 'dark');
  }
}


