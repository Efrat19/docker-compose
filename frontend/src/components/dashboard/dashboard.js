/* eslint-disable */
import axios from 'axios'
import AddContainer from '../AddContainer/index.vue'
export default {
  name: 'dashboard',
  components: {
      AddContainer
  },
  props: [],
  data () {
    return {
      containers:[]
    }
  },
  computed: {

  },
  mounted () {
    this.requestContainers();
  },
  methods: {
    requestContainers(){
        axios.get('http://0.0.0.0:8181/container').then(res => {
            console.log('res.data:',res.data);
            if(Array.isArray(res.data)){
                res.data.forEach(container=>{
                    container.name=container.name&&container.name.split('"').join('').split('/').join('').split('\\').join('');
                    container.port=JSON.parse(container.port)||'';
                    container.volume=JSON.parse(container.volume)||'';
                })
            }
            this.containers = res.data
        }).catch(e=>{
          alert('Something went wrong: '+e)
        })
    }
  }
}
