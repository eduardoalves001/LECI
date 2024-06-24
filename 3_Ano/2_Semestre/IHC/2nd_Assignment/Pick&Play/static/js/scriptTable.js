$(document).ready(function() {
    $('#example').DataTable({
        "columns": [
            { "data": "Name" },
            { "data": "Pos" },
            { "data": "Games" },
            { "data": "PPG" },
            { "data": "APG" },
            { "data": "RPG" },
            { "data": "SPG" },
            { "data": "BPG" },
            { "data": "FG%" },
            { "data": "3PT%" },
            { "data": "FT%" },
            { "data": "FPG" },
            { "data": "TPG" }
        ],
        paging: false,
        layout: {
            topStart: 'search',
            topEnd: null,
            bottom: null,
            bottomStart: null,
            bottomEnd: null
        }

    });
});
$(document).ready(function() {
    $('#example1').DataTable({
        "columns": [
            { "data": "Player" },
            { "data": "Points" },
            { "data": "Assists" },
            { "data": "Rebounds" },
            { "data": "Steals" },
            { "data": "Blocks" },
            { "data": "FGM" },
            { "data": "FGA" },
            { "data": "FG%" },
            { "data": "3PM" },
            { "data": "3PA" },
            { "data": "3P%" },
            { "data": "FTM" },
            { "data": "FTA" },
            { "data": "FT%" },
            { "data": "Fouls" },
            { "data": "Turnovers" }
        ],
        paging: false,
        layout: {
            topStart: 'search',
            topEnd: null,
            bottom: null,
            bottomStart: null,
            bottomEnd: null
        }
    });
});
$(document).ready(function() {
    $('#example2').DataTable({
        "columns": [
            { "data": "Player" },
            { "data": "Points" },
            { "data": "Assists" },
            { "data": "Rebounds" },
            { "data": "Steals" },
            { "data": "Blocks" },
            { "data": "FGM" },
            { "data": "FGA" },
            { "data": "FG%" },
            { "data": "3PM" },
            { "data": "3PA" },
            { "data": "3P%" },
            { "data": "FTM" },
            { "data": "FTA" },
            { "data": "FT%" },
            { "data": "Fouls" },
            { "data": "Turnovers" }
        ],
        paging: false,
        layout: {
            topStart: 'search',
            topEnd: null,
            bottom: null,
            bottomStart: null,
            bottomEnd: null
        }
    });
});