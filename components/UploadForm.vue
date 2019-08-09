<template>
  <div class="upload">
    <input type="file" @change="onFileSelected" accept=".csv, text/plain, .xlsx" />
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
      this.$parent.on_upload();
      const fd = new FormData();
      fd.append("date", new Date());
      fd.append("data", this.selectedFile, this.selectedFile.name);
      this.$axios
        .$post("/create", fd, {
          onUploadProgess: uploadEvent => {
            console.log(
              "Upload progess:" +
                Math(uploadEvent.loaded / uploadEvent.total) +
                "%"
            );
          },
          headers: {
            "Content-Type": "multipart/form-data"
          }
        })
        .then(res => {
          console.log(res);
          this.$parent.processor_id[0] = res.id;
          this.$parent.on_uploaded();
        });
      console.log(fd);
    }
  }
};
</script>

