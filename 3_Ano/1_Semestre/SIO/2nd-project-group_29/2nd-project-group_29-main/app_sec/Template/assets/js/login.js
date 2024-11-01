function doLogin() {
    username = document.getElementById("username0").value;       //buscar os dados que foram inseridos nos inputs/campos de texto do username e da password 
    password = document.getElementById("password0").value;
    totp_code = document.getElementById("totp_code").value;

    if (username == "" || password == "" || totp_code == "") {                     //verificar só se foi inserido algo nos dois campos (client-side)
        alert("Por favor insira um nome de utilizador e uma palavra-passe.")
    }

    else {
        var dados = new FormData();                                 //caso hajam dados suficientes, enviar POST ao servidor com eles
        dados.append("username", username);
        dados.append("password", password);
        dados.append("totp_code", totp_code)

        var xhr = new XMLHttpRequest();
        xhr.open("POST", "/login")

        xhr.onreadystatechange = () => {                                            
            // Call a function when the state changes.
            if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
                // Request finished. Do processing here.
                response = JSON.parse( xhr.response );     
                if (response.result == "sucesso") {
                    window.location = 'http://127.0.0.1:8080/inicio' 
                }
                else {
                    alert(response.result);
                }  
            }
        }
        xhr.send(dados);
    }
}




function doRegister() {
    username = document.getElementById("username1").value;       //buscar os dados que foram inseridos nos inputs/campos de texto do username e da password 
    password = document.getElementById("password1").value;
    password2 = document.getElementById("password2").value;
    email = document.getElementById("email").value;

    if (username == "" || password == "" || password2 == "") {                     //verificar só se foi inserido algo nos dois campos (client-side)
        alert("Por favor insira um nome de utilizador e uma palavra-passe.")
    }

    if (password != password2) alert("As passwords introduzidas não são idênticas")

    if (verificar_dados(username, password) == false ) return null;

    else {
        dados = new FormData();                                 //caso hajam dados suficientes, enviar POST ao servidor com eles
        dados.append("username", username);
        dados.append("password", password);
        dados.append("email", email);

        xhr = new XMLHttpRequest();
        xhr.open("POST", "/register")

        xhr.onreadystatechange = () => {                                            
            
            if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
                // Request finished. Do processing here.
                response = JSON.parse( xhr.response );  
                alert(response.result)
                var image = new Image();
                image.src = 'data:image/png;base64, '+response.totp_qr_code;
                document.getElementById("QR_image").append(image)
            }

        }
        xhr.send(dados);
    }
}


function clearInputs() {
    document.getElementById("username0").value="";
    document.getElementById("password0").value="";
    document.getElementById("username1").value="";
    document.getElementById("password1").value="";
    document.getElementById("password2").value="";
    document.getElementById("totp_code").value="";
    document.getElementById("email").value="";
    document.getElementById("QR_image").innerHTML = ''
}




//Este ficheiro java script está associado ao ficheiro novo_membro.html
function verificar_dados(username, password) {
    let utilizador = username;
    // Verifica se a palavra passe e o nome do utilizador possuem entre 6 ou 18 carateres.
    if ((password.length >= 12 && password.length <= 500) && (utilizador.length >= 10 && utilizador.length <= 30)) {
            //Verificar se a password verifica as restantes restrições.
            if (password.match(/[a-z]/) && password.match(/[A-Z]/) && password.match(/[0-9]/) && password.match(/[#*]/)) {
                return true;
                
                //Registar informação na database(não foi implementado).
            } else {
                Utilizador()
                restricoes()
                return false;
            }
         
    }
    else {
        Utilizador()
        restricoes()
        return false;
    }
}

function restricoes() {
    alert("A palvavra-passe deverá ter pelo menos 12 carateres, com as seguintes regras:" +
        " Pelo menos uma letra minúscula," +
        " uma letra maiúscula," +
        " um número" +
        " e pelo menos um  destes caratéres especiais: # *");
}

function Utilizador() {
    alert("O nome do utilizador, deverá ter 10 a 30 carateres.");
}