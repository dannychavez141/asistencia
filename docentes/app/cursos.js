

var app = new Vue({
  el: '#ventana',

  data: {
    usuario: [], 
    cursos:[]
  },
  methods: {
    async apicursos(){
         console.log( url);
            try {
                let api=url+"cursosApi.php?ac=buno&cod="+this.usuario['id'];
               console.log( api);
               let datos= await axios.get(api);  
               this.cursos=datos.data;
               // console.log( this.cursos);
            } catch (e) {
                console.log(e);
            }

    },async validar(){
            this.usuario = await validar();
            this.apicursos();
            console.log(this.usuario);
    }
  },mounted(){
      
        this.validar();
  }
})