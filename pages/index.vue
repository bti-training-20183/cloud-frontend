<template>
  <v-layout column justify-center align-center>
    <v-flex xs12 sm8 md6>
      <div class="text-xs-center">
        <upload-form />
        <div id="task-list" :class="{'hidden': hideTaskList}">		
          <task-list 
            v-for="task in tasks"
              :key="task.id"
              :index="task.id"
              :id="'task-'+task.id"
              :name="task.name"
              :complete="task.complete">
            </task-list>
        </div>
      </div>
    </v-flex>
  </v-layout>
</template>

<script>
import Logo from "~/components/Logo.vue";
import VuetifyLogo from "~/components/VuetifyLogo.vue";
import UploadForm from "~/components/UploadForm.vue";
import TaskList from "~/components/TaskList.vue"
export default {
  data: function(){
		return {
      hideTaskList: true,
      processors: ['preprocessor', 'creator', 'deployer'],
      processor_id:[0,0,0,0],
      tasks: [
        { id: 1, name: 'Data Uploading', complete: false },
        { id: 2, name: 'Data Preprocessing', complete: false },
        { id: 3, name: 'Model Creating', complete: false },
        { id: 4, name: 'Model Deploying', complete: false }
      ]
		}
  },
  head: {
    link: [
      { rel: 'stylesheet', href: '/css/home.css' }
    ]
  },
  components: {
    Logo,
    VuetifyLogo,
    UploadForm,
    TaskList
  },
  methods:{
    on_upload: function(){
      this.hideTaskList = false;
    },
    on_uploaded: function(){
      this.tasks[0].complete = true;
    }
  }
};
</script>
