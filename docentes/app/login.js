

var app = new Vue({
    el: '#app',
    data: {base: url+"/login.php",
        user: "",
        pass: "",
        est: 1
    },
    methods: {
        async login() {
            const params = new URLSearchParams();
            params.append('ac', 'login');
            params.append('user', this.user);
            params.append('pass', this.pass);
            try {
                var resp = await axios.post(this.base, params);
                console.log(resp.data);
                let datos = resp.data;
                if (datos['error'] == "IDENTIFICADO")
                {
                    localStorage.clear();
                    localStorage.setItem('token', datos['token']);
                   // mensaje(5, "BIENVENIDO AL SISTEMA");
                    location.href = "./cursos.html";

                } else {
                    Swal.fire({
                        icon: 'error',
                        title: 'Error de Inicio de Sesion',
                        text: 'VERIFICAR SU USUARIO Y CONTRASEÑA',
                        
                    });
                }

            } catch (e) {
                console.log(e);
            }
        }
    },
    mounted() {
        console.log("inicializando");

    }, created() {
        validar();
    }
});




