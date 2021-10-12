
var app = new Vue({
    el: '#app',

    data: {
        usuario: [],
        alumnos: [],
        clases: [],
        vista: 1,
        curso: [],
        filtroAlu: [], busqalu: ""
    },
    methods: {
        async apialumnos() {
            let idcurso = getUrl("curso");
            try {
                let api = url + "cursosApi.php?ac=todos&cod=" + idcurso;
                console.log(api);
                let datos = await axios.get(api);
                this.alumnos = datos.data;
                this.filtrar();
                this.curso = {"id": idcurso,
                    "descrCurso": this.alumnos[0][12],
                    "anio": this.alumnos[0][15]}
                console.log(this.alumnos);
            } catch (e) {
                console.log(e);
            }

        }, async apiClases() {
            let idcurso = getUrl("curso");
            try {
                let api = url + "clasesApi.php?ac=todos&cod=" + idcurso;
                console.log(api);
                let datos = await axios.get(api);
                this.clases = datos.data;
                console.log(this.clases);
            } catch (e) {
                console.log(e);
            }

        }, async validar() {
            this.usuario = await validar();
            console.log(this.usuario);
        }, filtrar() {
            this.filtroAlu = [];
            if (this.busqalu != "")
            {
                for (var i = 0; i < this.alumnos.length; i++) {
                    let alumno = this.alumnos[i];
                    let datos = alumno['codAlu'] + " " + alumno['apepaAlu'] + " " + alumno['apemaAlu'] + " " + alumno['nomAlu'];
                    var index = datos.includes(this.busqalu.toUpperCase());
                    //console.log(datos);
                    if (index > 0) {
                        /// console.log("la palabra existe dentro de la cadena y se encuentra en la posición " + index);
                        this.filtroAlu.push(alumno);
                    }
                }
            } else {
                this.filtroAlu = this.alumnos;
            }
        }
    }, mounted() {
        this.apialumnos();
        this.apiClases();
        this.validar();

    }
})