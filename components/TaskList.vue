<template>
  <div class="task">
    <div class="checkmark">
      <svg
        version="1.1"
        xmlns="http://www.w3.org/2000/svg"
        xmlns:xlink="http://www.w3.org/1999/xlink"
        xml:space="preserve"
        x="0px"
        y="0px"
        viewBox="0, 0, 100, 100"
        id="checkmark"
      >
        <g transform>
          <circle
            class="path"
            :class="{'path-complete': success}"
            fill="none"
            stroke="#7DB0D5"
            stroke-width="8"
            stroke-miterlimit="10"
            cx="50"
            cy="50"
            r="44"
          />
          <circle
            class="fill"
            :class="{'fill-complete': complete, 'success': success}"
            fill="none"
            stroke="#7DB0D5"
            stroke-width="8"
            stroke-miterlimit="10"
            cx="50"
            cy="50"
            r="44"
          />
          <polyline
            class="check"
            :class="{'check-complete': complete, 'success': success}"
            fill="none"
            stroke="#7DB0D5"
            stroke-width="8"
            stroke-linecap="round"
            stroke-miterlimit="10"
            points="70,35 45,65 30,52  "
          />
        </g>
      </svg>
    </div>
    <span>{{ name }} {{complete?' completed':''}} {{success?' successfully!':''}}</span>
  </div>
</template>

<script >
export default {
  props: ["name", "complete", "index"],
  data: function() {
    return {
      success: false
    };
  },
  watch: {
    complete: function(newStatus, oldSatus) {
      setTimeout(() => {
        this.success = true;
      }, 1000);
      this.next_task();
    }
  },
  methods: {
    next_task: function() {
      console.log("Next Task");
      if (this.index < this.$parent.tasks.length) {
        // this.$parent.tasks[this.index].complete = true;
        this.$axios
          .get("/process", {
            headers: {
              "Access-Control-Allow-Origin": "*"
            },
            params: {
              current_processor_id: this.$parent.processor_id[this.index - 1],
              next_processor: this.$parent.processors[this.index - 1]
            }
          })
          .then(res => {
            console.log(res.data);
            if (res.data.id == 0) {
              setTimeout(this.next_task, 5000); // Try after 5 seconds
              console.log("Not found Try after 5 seconds");
              return;
            }
            this.$parent.processor_id[this.index] = res.data.id;
            this.$parent.tasks[this.index].complete = true;
          })
          .catch(error => {
            setTimeout(this.next_task, 5000); // Try after 5 seconds
            console.log("Error Try after 5 seconds");
            console.log(error);
          });
      }
    }
  }
};
</script>

