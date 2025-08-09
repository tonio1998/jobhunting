<template>
    <div class="bg-white shadow rounded-xl p-4 border border-gray-200">
        <div class="text-sm text-gray-500">{{ label }}</div>
        <div :class="['text-2xl font-bold', color || 'text-gray-800']">
            <span v-if="!loading">{{ value }}</span>
            <PlaceholderPattern v-else />
        </div>
    </div>
</template>

<script setup lang="ts">
defineProps({
    label: String,
    value: [String, Number],
    loading: Boolean,
    color: { type: String, default: 'text-gray-800' }
});
</script>
