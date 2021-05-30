var app = new Vue({
    el: '#app',
    data: {usuario:[],name:"hola papi"
    }, methods: {async validar(){
            this.usuario = await validar();
            console.log(this.usuario);
    }

    }, mounted() {
        this.validar();
    }
    ,

    created() {

    }
});