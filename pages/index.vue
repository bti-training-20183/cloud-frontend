<template>
  <v-layout column justify-center align-center>
    <v-flex xs12 sm8 md6>
      <div class="text-xs-center">
        <upload-form />
      </div>
    </v-flex>
  </v-layout>
</template>

<script>
import Logo from "~/components/Logo.vue";
import VuetifyLogo from "~/components/VuetifyLogo.vue";
import UploadForm from "~/components/UploadForm.vue";
export default {
  components: {
    Logo,
    VuetifyLogo,
    UploadForm
  }
};
</script>
