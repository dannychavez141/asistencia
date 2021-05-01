var ac = "buno";
var cod = 2;
var anio = 4;
var url = "http://asistencia.test/apis/cursosApi.php?ac=buno&cod=4&anio=4";

var app = new Vue({
  el: '#ventana',

  data: {
    usuario: 'Hello Vue.js!', 
    cursos:[]
  },
  methods: {
    async apicursos(){
        
            try {
                
               let datos= await axios.get(url);  
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