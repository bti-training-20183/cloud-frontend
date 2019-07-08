<template>
  <div class="upload">
    <input type="file" @change="onFileSelected" accept=".csv,text/plain"/>
    <v-btn color="info" @click="onUpload">Upload</v-btn>
  </div>
</template>

<script>
export default {
  data() {
    return {
      selectedFile: null,
      progress: null
    };
  },

  methods: {
    onFileSelected(event) {
      this.selectedFile = event.target.files[0];
      console.log(this.selectedFile);
    },
    onUpload() {
      const fd = new FormData();
      fd.append("data", this.selectedFile, this.selectedFile.name);
      console.log(fd);
    }
  }
};
</script>

