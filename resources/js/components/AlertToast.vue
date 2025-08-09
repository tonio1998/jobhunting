<template>
    <div
        v-if="alert.show"
        :class="[
      'fixed top-4 left-1/2 transform -translate-x-1/2 px-4 py-3 rounded shadow-lg flex items-center gap-2 text-white z-50',
      alert.type === 'success' ? 'bg-green-600' :
      alert.type === 'error' ? 'bg-red-600' :
      'bg-blue-600'
    ]"
    >
        <svg
            v-if="alert.type === 'success'"
            class="h-5 w-5"
            fill="none"
            stroke="currentColor"
            stroke-width="2"
            viewBox="0 0 24 24"
        >
            <path stroke-linecap="round" stroke-linejoin="round" d="M5 13l4 4L19 7" />
        </svg>
        <svg
            v-else-if="alert.type === 'error'"
            class="h-5 w-5"
            fill="none"
            stroke="currentColor"
            stroke-width="2"
            viewBox="0 0 24 24"
        >
            <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
        </svg>
        <svg
            v-else
            class="h-5 w-5"
            fill="none"
            stroke="currentColor"
            stroke-width="2"
            viewBox="0 0 24 24"
        >
            <path stroke-linecap="round" stroke-linejoin="round" d="M13 16h-1v-4h-1m1-4h.01M12 20c4.418 0 8-3.582 8-8s-3.582-8-8-8-8 3.582-8 8 3.582 8 8 8z" />
        </svg>

        <span>{{ alert.message }}</span>
        <button @click="$emit('close')" class="ml-2 hover:text-gray-200">✖</button>
    </div>
</template>

<script setup>
defineProps({
    alert: {
        type: Object,
        required: true
    }
})
</script>
