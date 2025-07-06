<script setup>
import { onMounted, ref } from 'vue';
import L from 'leaflet';
import 'leaflet/dist/leaflet.css';

const mapRef = ref(null);

onMounted(() => {
  const params = new URLSearchParams(window.location.search);
  const lat = parseFloat(params.get('lat') || '0');
  const lng = parseFloat(params.get('lng') || '0');

  const map = L.map(mapRef.value).setView([lat, lng], 14);

  L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
    attribution: '© OpenStreetMap contributors'
  }).addTo(map);

  L.marker([lat, lng]).addTo(map).bindPopup('User Location').openPopup();
});
</script>

<template>
  <div class="h-screen w-full">
    <div ref="mapRef" class="w-full h-full z-10"></div>
  </div>
</template>
