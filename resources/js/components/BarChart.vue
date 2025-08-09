<template>
    <canvas ref="canvas"></canvas>
</template>

<script setup lang="ts">
import { onMounted, ref, watch } from 'vue';
import { Chart, registerables } from 'chart.js';
Chart.register(...registerables);

const props = defineProps({ data: Object });
const canvas = ref();
let chart;

onMounted(() => {
    chart = new Chart(canvas.value, {
        type: 'bar',
        data: props.data!,
        options: {
            responsive: true,
            plugins: {
                legend: { position: 'top' },
                title: { display: false }
            }
        }
    });
});

watch(() => props.data, (newData) => {
    if (chart && newData) {
        chart.data = newData;
        chart.update();
    }
});
</script>
