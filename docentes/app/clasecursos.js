
var app = new Vue({
  el: '#app',

  data: {
    usuario: 'Hello Vue.js!', 
    alumnos:[],
    clases:[],vista:1
  },
  methods: {
    async apicursos(){
        
            try {
                let api=url+"asistenciaApi.php?ac=buno&cod=4&anio=4";
               let datos= await axios.get(api);  
               this.cursos=datos.data;
                console.log( this.cursos);
            } catch (e) {
                console.log(e);
            }

    }
  },mounted(){
        this.apicursos();
  }
})