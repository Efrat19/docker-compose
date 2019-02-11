/* eslint-disable */
import axios from 'axios'
export default {
    name: 'add-container',
    components: {},
    props: [],
    data() {
        return {
            name: '',
            port: ''
        }
    },
    computed: {},
    mounted() {

    },
    methods: {
        create() {
            axios.post('http://0.0.0.0:8181/container', {name: this.name, port: this.port}).then(res => {
                alert(res);
                this.$router.push('/dashboard');
            }).catch((data)=>{alert(date)});
        },
    }
}
