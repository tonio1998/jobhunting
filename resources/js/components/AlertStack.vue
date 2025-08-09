<template>
    <div class="fixed top-4 right-4 space-y-2 z-50 w-96 max-w-full">
        <div
            v-for="alert in alerts"
            :key="alert.id"
            :class="[
        'px-4 py-3 rounded shadow-md flex items-center gap-2 text-sm border',
        alert.type === 'success'
          ? 'bg-green-100 text-green-800 border-green-300'
          : alert.type === 'error'
          ? 'bg-red-100 text-red-800 border-red-300'
          : 'bg-blue-100 text-blue-800 border-blue-300'
      ]"
        >
            <span class="flex-1">{{ alert.message }}</span>
            <button
                @click="$emit('close', alert.id)"
                class="ml-2 hover:text-opacity-80 focus:outline-none"
            >
                ✖
            </button>
        </div>
    </div>
</template>

<script setup>
defineProps({
    alerts: {
        type: Array,
        required: true,
    },
});
</script>
