var url = "http://asistencia.test/apis/";

function getUrl(name) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
            results = regex.exec(location.search);
    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}
function encode_utf8(s) {
    return unescape(encodeURIComponent(s));
}

function decode_utf8(s) {
    return decodeURIComponent(escape(s));
}
function numeros(e) {
    var charCode
    charCode = e.keyCode
    status = charCode
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
        return false
    }
    return true
}
function cerrar() {
    Swal.fire({
        title: 'Deseas Cerrar la Sesion?',
        showDenyButton: true,
        showCancelButton: false,
        confirmButtonText: `Si`,
        denyButtonText: `No`,
    }).then((result) => {
        /* Read more about isConfirmed, isDenied below */
        if (result.isConfirmed) {
            localStorage.clear();
            location.href = "./login.html";
        } else if (result.isDenied) {
            //Swal.fire('Changes are not saved', '', 'info')
        }
    })
}
async  function  validar() {
    var token = localStorage.getItem('token');
    //console.log(token);
    var URLactual = window.location.href;
    let sitios = URLactual.split("/");
    let actual = sitios[sitios.length - 1];
    //console.log(actual);
    try {
        if (token != null) {
            const params = new URLSearchParams();
            params.append('ac', 'validar');
            params.append('token', token);
            // console.log(token);

            var resp = await axios.post(url + "/login.php", params);
            //console.log(resp.data);
            let datos = resp.data;
            if (datos['exp'] >= datos['ahora'])
            {
                let usuario = datos;

                if (actual != "login.html") {
                    var user = {"id": usuario.aud.id
                        , "nombres": usuario.data.nombres
                        , "apellidos": usuario.data.apellidos
                        , "tipo": usuario.data.usuario};
                    return user;
                } else {
                    location.href = "./cursos.html";
                }

            } else {
                localStorage.clear();
                if (actual != "login.html") {
                    location.href = "./login.html";
                }

            }


        } else {
            localStorage.clear();
            if (actual != "login.html") {
                location.href = "./login.html";
            }
        }
    } catch (e) {
        console.log(e);
    }
}
function letras(e) { // 1
    tecla = (document.all) ? e.keyCode : e.which; // 2
    if (tecla == 8)
        return true; // 3
    patron = /[A-Za-z\s-ñ/Ñ]/; // 4
    te = String.fromCharCode(tecla); // 5
    return patron.test(te); // 6
}
