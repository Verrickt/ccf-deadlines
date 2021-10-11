<template>
  <section>
    <el-row>
      <a href="/" class="title">AISec Conference Deadlines</a>
      <span v-if="showLatestConf" style="color:#fd3c95;font-weight: bold; margin: 0 20px">Last Updated: {{this.showStr}} by <a href="https://github.com/verrickt">@verrickt</a></span>
    </el-row>
    <el-row class="subtitle">
      Countdowns to AISec conference deadlines. To add/edit a conference, <a style="color: #666666" href="https://github.com/ccfddl/ccf-deadlines/pulls">send a pull request.</a>
    </el-row>
  </section>
</template>

<script>
const moment = require('moment')
export default {
  name: 'Header',
  data() {
    return {
      showLatestConf: true,
      showStr: ''
    }
  },
  mounted() {
    this.$http.get('/conference/last_updated.json').then(
      response=>{
        console.log(response)
        console.log(response.bodyText)
        let last_modified_utc = moment.utc(response.bodyText)
        let last_modified_local = last_modified_utc.local()
        let last_modified_str = last_modified_local.format('ddd MMM Do YYYY HH:mm:ss z')
        this.showStr = last_modified_str
      }
    )
  },
}
</script>

<style scoped>
.title{
  font-size: 29px;
  color: #2c3e50;
}
.subtitle{
  padding-top: 15px;
  color: #666666;
}

a{
  text-decoration: none;
  border-bottom: 1px solid #ccc;
  color: inherit;
}

</style>
