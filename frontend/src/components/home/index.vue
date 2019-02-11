<!--<template src="./home.html"></template>-->
<!--<script src="./home.js"></script>-->
<!--<style src="./home.css" scoped lang="scss"></style>-->

<template>
    <div id="app">
        <img src="../../assets/logo.png">
        <h1>{{ msg }}</h1>
        <h3>hi</h3>
        <router-link to="/dashboard">Go To Dashboard</router-link>
    </div>
</template>

<script>
    export default {
        name: 'app',
        data () {
            return {
                msg: 'This is a Vue.js App running on Docker'
            }
        }
    }
</script>

<style lang="css">
    #app {
        font-family: 'Avenir', Helvetica, Arial, sans-serif;
        -webkit-font-smoothing: antialiased;
        -moz-osx-font-smoothing: grayscale;
        text-align: center;
        color: #2c3e50;
        margin-top: 60px;
    }

    h1, h2 {
        font-weight: normal;
    }

    ul {
        list-style-type: none;
        padding: 0;
    }

    li {
        display: inline-block;
        margin: 0 10px;
    }

    a {
        color: #42b983;
    }
</style>
